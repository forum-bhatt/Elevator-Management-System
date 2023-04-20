USE Team_Project10;

------------ SCHEMA: Territory ------------

-- GO
-- CREATE SCHEMA Territory
-- GO

-------------------------------------------

-------------------------------- TABLE: Country ------------------------------------

CREATE TABLE Territory.Country (
    CountryCode INT IDENTITY(1,1) PRIMARY KEY,
    CountryName VARCHAR(255)
);

-------------------------------------------------------------------------------------


-------------------------------- TABLE: Region --------------------------------------

CREATE TABLE Territory.Region (
    RegionID INT IDENTITY(1,1) PRIMARY KEY,
    RegionName VARCHAR(10),
    CountryCode INT FOREIGN KEY(CountryCode) REFERENCES Territory.Country(CountryCode)
);

ALTER TABLE Territory.Region ALTER COLUMN RegionName VARCHAR(30)

-------------------------------------------------------------------------------------


-------------------------------- TABLE: Territory -----------------------------------

CREATE TABLE Territory.Territory (
    TerritoryID INT IDENTITY(1,1) PRIMARY KEY,
    TerritoryName VARCHAR(10),
    RegionID INT FOREIGN KEY(RegionID) REFERENCES Territory.Region(RegionID)
);

ALTER TABLE Territory.Territory ALTER COLUMN TerritoryName VARCHAR(30)

-------------------------------------------------------------------------------------

-------------------------------- TABLE: Route -----------------------------------

CREATE TABLE Territory.Route (
    RouteID INT IDENTITY(1,1) PRIMARY KEY,
    RouteName VARCHAR(100),
    TerritoryID INT FOREIGN KEY(TerritoryID) REFERENCES Territory.Territory(TerritoryID)
);

-------------------------------------------------------------------------------------

-------------------------------- TABLE: Building ------------------------------------

CREATE TABLE Territory.Building (
    BuildingID INT IDENTITY(1,1) PRIMARY KEY,
    StreetNumber INT,
    [Address 1] VARCHAR(50),
    [Address 2] VARCHAR(50),
    RouteID INT FOREIGN KEY(RouteID) REFERENCES Territory.Route(RouteID)
);

-------------------------------------------------------------------------------------

------------- Schema: Client -------------

-- Go
-- CREATE SCHEMA Client
-- GO

-------------------------------------------


-------------------------------- TABLE: Organization ---------------------------------

CREATE TABLE Client.Organization (
    OrganizationID INT IDENTITY(1,1) PRIMARY KEY,
    OrganizationName VARCHAR(200) NOT NULL,
    OrganizationCountryCode INT FOREIGN KEY REFERENCES territory.country(CountryCode),
    OrganizationSSN VARCHAR(12) NOT NULL
);

-------------------------------------------------------------------------------------


-------------------------------- TABLE: Company ---------------------------------

CREATE TABLE Client.Company (
    CompanyID INT IDENTITY(1,1) PRIMARY KEY,
    OrganizationID INT FOREIGN KEY REFERENCES Client.Organization(OrganizationID),
    RegionID INT FOREIGN KEY REFERENCES Territory.Region(RegionID) ,
    CompanyName VARCHAR(200)
);


--------- Constraint ----------

GO
CREATE OR ALTER FUNCTION dbo.CheckRegion
(@RegionID INT, @OrganizationID INT)
RETURNS INT
AS 
BEGIN
    RETURN (
        SELECT 
            COUNT(*)
        FROM
            Client.Organization org
        INNER JOIN 
            Territory.Region reg ON reg.CountryCode = org.OrganizationCountryCode
        WHERE 
            org.OrganizationID = @OrganizationID
            AND reg.RegionID = @RegionID
    )
END
GO

-- SELECT * FROM Client.Organization;
-- SELECT * FROM Territory.Region

-- ALTER TABLE Client.Company DROP CONSTRAINT chk_CheckRegion
-- GO
ALTER TABLE Client.Company ADD CONSTRAINT chk_CheckRegion CHECK (dbo.CheckRegion(Company.RegionID,Company.OrganizationID) <> 0)

-------------------------------------------------------------------------------------

------------- Schema: Product -------------

-- GO 
-- CREATE SCHEMA Product
-- GO

-------------------------------------------


-------------------------------- TABLE: ProductType ------------------------------------

CREATE TABLE Product.ProductType(
    ProductTypeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(20)
)

-------------------------------------------------------------------------------------


-------------------------------- TABLE: Product ------------------------------------

CREATE TABLE Product.Product (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(20),
    FixedPrice NUMERIC,
    ProductTypeID INT FOREIGN KEY(ProductTypeID) REFERENCES Product.ProductType(ProductTypeID),
    ManufacturingDate DATE,
    IsCommercial BIT
);

-------------------------------------------------------------------------------------

------------- Schema: Person -------------

-- GO
-- CREATE SCHEMA Person
-- GO

-------------------------------------------


-------------------------------- TABLE: Gender ------------------------------

CREATE TABLE Person.Gender(
    GenderID INT IDENTITY(1,1) PRIMARY KEY,
    Gender VARCHAR(10)
)

-------------------------------------------------------------------------------------

-------------------------------- TABLE: Person ---------------------------------

CREATE TABLE Person.Person (
    PersonId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(200) NOT NULL,
    LastName VARCHAR(200) NOT NULL,
    PhoneNumber CHAR(12), -- you might not want to have such a precise length
    CONSTRAINT chk_phone CHECK (PhoneNumber NOT LIKE '%[^0-9+-.]%'),
    DateofBirth Date,
    AGE AS dbo.GetAge(DateOfBirth),
    EmailAddress VARCHAR(200),
    GenderID INT FOREIGN KEY REFERENCES Person.Gender(GenderID)
);

GO
CREATE FUNCTION GetAge  
(@DateOfBirth SMALLINT) 
RETURNS INT 
AS 
BEGIN
    DECLARE @age INT
    SET @age = (SELECT CAST(DATEDIFF(hour,@DateOfBirth,GETDATE())/8766 AS INT));
    RETURN @age;
END
GO 

-------------------------------------------------------------------------------------

-------------------------------- TABLE: Role ---------------------------------

CREATE TABLE Person.Role (
    RoleId INT IDENTITY(1,1) PRIMARY KEY,
    Position VARCHAR(200)
);

-------------------------------------------------------------------------------------

-------------------------------- TABLE: Employee ---------------------------------

CREATE TABLE Person.Employee (
    EmployeeId INT PRIMARY KEY FOREIGN KEY REFERENCES Person.Person(PersonID),
    CompanyId INT FOREIGN KEY REFERENCES Client.Company(CompanyID),
    RoleId INT FOREIGN KEY REFERENCES Person.Role(RoleId),
    JoiningDate DATE,
    LastDate DATE
);

-------------------------------------------------------------------------------------


-------------------------------- TABLE: Customer ---------------------------------

CREATE TABLE Person.Customer(
    CustomerId INT PRIMARY KEY FOREIGN KEY REFERENCES Person.Person(PersonID),
    CompanyId INT FOREIGN KEY REFERENCES Client.Company(CompanyID)
);

-------------------------------------------------------------------------------------

-------------------------------- TABLE: UserDetails ---------------------------------

CREATE TABLE Person.UserDetails (
    LoginId VARCHAR(200) PRIMARY KEY,
    EncryptedPassword VARBINARY(250),
    PersonID INT FOREIGN KEY REFERENCES Person.Person(PersonID)
);
-------------------------------------------------------------------------------------

------------- Schema: Contract -------------

-- Go
-- CREATE SCHEMA Contract
-- Go

-------------------------------------------

-------------------------------- TABLE: Unit ------------------------------------

CREATE TABLE Contract.Unit(
  SerialNo int IDENTITY(1,1) PRIMARY KEY,
  ProductID int FOREIGN KEY REFERENCES Product.Product(ProductID),
  IsActive bit,
  BuildingID int FOREIGN KEY REFERENCES Territory.Building(BuildingID)
);

-------------------------------------------------------------------------------------

-------------------------------- TABLE: Sale ------------------------------------

CREATE TABLE Contract.Sale(
	SaleID INT IDENTITY(1,1) PRIMARY KEY,
    SerialNo INT FOREIGN KEY REFERENCES Contract.Unit(SerialNo),
    Quantity INT NOT NULL,
	SalesRepID INT FOREIGN KEY REFERENCES Person.Employee(EmployeeId),
	BillingCycle varchar(255) NOT NULL,
	Discount INT NOT NULL,
	ContractDate DATE NOT NULL,
	CustomerID INT FOREIGN KEY REFERENCES Person.Customer(CustomerId),
	Tenure NUMERIC NOT NULL,
	BillingMode VARCHAR(255) NOT NULL,
    CompanyID INT FOREIGN KEY REFERENCES Client.Company(CompanyID)
);

-------------------------------------------------------------------------------------

GO
--DROP TRIGGER [Contract].[InsertMaintenanceJobs]
CREATE OR ALTER TRIGGER InsertMaintenanceJobs
ON Contract.Sale
AFTER 
    INSERT AS
BEGIN
      SET NOCOUNT ON;

      -- CREATE TABLE [sale] (
      --       serialNo INT,
      --       startDate DATE,
      --       companyID INT
      -- );

      -- INSERT INTO [sale]     
            -- SELECT 
            --       INSERTED.SerialNo [serialNo],
            --       INSERTED.ContractDate [startDate],
            --       INSERTED.companyID [companyID]  
            -- INTO [sale]
            -- FROM INSERTED
            

      -- Get EmployeeID
      DECLARE @employeeID INT = (SELECT TOP 1 emp.EmployeeID FROM Person.Employee emp WHERE emp.CompanyID = (SELECT companyID FROM INSERTED) AND emp.RoleId = 1 ORDER BY NEWID());

      -- Get RouteID
      DECLARE @routeID INT = (
            SELECT 
                  [build].RouteID 
            FROM Contract.Unit [unit] 
            INNER JOIN Territory.Building [build] ON [build].BuildingId = [unit].BuildingId
            WHERE 
                  [unit].SerialNo = (SELECT serialNo FROM INSERTED)
            )

      -- Get visit date
      DECLARE @visitDate DATE = (SELECT DATEADD(month, DATEDIFF(month, 0, (SELECT contractDate FROM INSERTED)), 0) AS StartOfMonth)

      -- Get serial no
      DECLARE @serialNo INT = (SELECT serialNo FROM INSERTED)

      DECLARE @startMonth INT = (SELECT MONTH(@visitDate))
      WHILE ( @startMonth <> 13)
      BEGIN
            INSERT INTO Callback.MaintenanceJobs (EmployeeID, RouteID, VisitDate, JobStatus, SerialNumber ) VALUES (@employeeID, @routeID, @visitDate, 1, @serialNo);
            SET @visitDate = DATEADD(MONTH, 1, @visitDate)
            SET @startMonth = @startMonth + 1;
      END

END
GO

-------------------------------------------------------------------------------------

------------- Schema: Contract -------------

-- Go
-- CREATE SCHEMA Callback
-- Go

-------------------------------------------

-------------------------------- TABLE: Status ------------------------------------

CREATE TABLE Callback.Status
(
    StatusID INT IDENTITY(1,1) PRIMARY KEY,
    StatusType VARCHAR(10)
)

-------------------------------------------------------------------------------------


-------------------------------- TABLE: Callback ------------------------------------

CREATE TABLE Callback.Callback
(CallbackID INT IDENTITY(1,1),
 RouteID INT,
 MechanicID INT,
 StatusID INT FOREIGN KEY REFERENCES Callback.Status(StatusID),
 CallbackDate DATE,
 SerialNumber INT, 
 PRIMARY KEY (CallbackID),
 FOREIGN KEY (RouteID) REFERENCES Territory.Route(RouteID) ,
 FOREIGN KEY (MechanicID) REFERENCES Person.Employee(EmployeeId),
 FOREIGN KEY (SerialNumber) REFERENCES Contract.Unit(SerialNo)
);

-------------------------------------------------------------------------------------

-------------------------------- TABLE: MaintenanceJobs ------------------------------

CREATE TABLE Callback.MaintenanceJobs
(JobID INT IDENTITY(1,1),
 EmployeeID INT,
 RouteID INT,
 VisitDate DATE,
 JobStatus INT,
 SerialNumber INT,
 PRIMARY KEY (JobID),
 FOREIGN KEY (RouteID) REFERENCES Territory.Route(RouteID) ,
 FOREIGN KEY (EmployeeID) REFERENCES Person.Employee(EmployeeId),
 FOREIGN KEY (SerialNumber) REFERENCES Contract.Unit(SerialNo),
 FOREIGN KEY (JobStatus) REFERENCES Callback.Status(StatusId)
);

-------------------------------------------------------------------------------------



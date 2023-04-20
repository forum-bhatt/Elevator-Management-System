USE Team_Project10;
-------------------------- PROCEDURE: InsertContractUnit ------------------------
GO
CREATE OR ALTER PROCEDURE InsertContractUnit @ProductId int, @IsActive bit,@BuildingID int
AS
SET NOCOUNT ON
INSERT INTO [Contract].[Unit]
           ([ProductID]
           ,[IsActive]
           ,[BuildingID])
     VALUES
           (@ProductId
           ,@IsActive
           ,@BuildingID)
GO

-------------------------- PROCEDURE: InsertRoleDetails ------------------------


GO
CREATE OR ALTER PROCEDURE InsertRoleDetails @Position VARCHAR(200)
AS
SET NOCOUNT ON
INSERT INTO [Person].[Role]
           ([Position])
     VALUES
           (@Position)
GO


------------------------ PROCEDURE: InsertTerritoryBuilding-------------------------

CREATE OR ALTER PROCEDURE InsertTerritoryBuilding @StreetNumber int,@Address1 varchar(50),@Address2 varchar(50),@RouteID int
 AS
 SET NOCOUNT ON
 INSERT INTO [Territory].[Building]
  ([StreetNumber]
  ,[Address 1]
  ,[Address 2],
  [RouteID])
  VALUES
  (@StreetNumber
  ,@Address1
  ,@Address2
  ,@RouteID)
 GO

------------------------- PROCEDURE: CreateEmployee ------------------------

--SELECT * FROM Person.Employee

GO
CREATE OR ALTER PROCEDURE CreateEmployee @EmployeeId INT,@CompanyId INT, @RoleId INT, @JoiningDate DATE
AS
SET NOCOUNT ON

INSERT INTO [Person].[Employee]
           (
            [EmployeeId],
            [CompanyId],
            [RoleId],
            [JoiningDate]
           )
     VALUES
           (
            @EmployeeId,
            @CompanyId,
            @RoleId,
            @JoiningDate
           )

GO

-- Test
-- EXECUTE CreateEmployee @EmployeeId=27,@CompanyId=1,@RoleId=1,@JoiningDate='11/30/2022'


------------------------- PROCEDURE: CreateCustomer ------------------------

--SELECT * FROM Person.Employee

GO
CREATE OR ALTER PROCEDURE CreateCustomer @CustomerId INT,@CompanyId INT
AS
SET NOCOUNT ON

INSERT INTO [Person].[Customer]
           (
            [CustomerId],
            [CompanyId]
           )
     VALUES
           (
            @CustomerId,
            @CompanyId
           )

GO

------------------------- PROCEDURE: RegisterCallback ------------------------

GO
CREATE OR ALTER PROCEDURE RegisterCallback @SerialNo INT
AS
SET NOCOUNT ON

BEGIN
      -- Get Route level information
      DECLARE @RouteId INT;

      SET @RouteId = (
            SELECT 
                  RouteID 
            FROM 
                  Contract.Unit unit
            INNER JOIN Territory.Building bldg ON bldg.BuildingID = unit.BuildingID
            WHERE SerialNo = @SerialNo
      );

      -- Get mechanic
      DECLARE @EmployeeId INT;

      SET @EmployeeId = (
            SELECT 
                  TOP 1
                  emp.EmployeeId
            FROM 
                  Person.Employee emp
            WHERE 
                  emp.RoleId = 1
                  AND emp.LastDate IS NULL
      )

      -- Set callback status as active
      DECLARE @StatusID INT = 1;

      -- Set callback date as current date
      DECLARE @CallbackDate DATE = GETDATE();

      INSERT INTO [Callback].[Callback]
            (
                  [RouteID],
                  [MechanicId],
                  [StatusId],
                  [CallbackDate],
                  [SerialNumber]
            )
      VALUES
            (
                  @RouteId,
                  @EmployeeId,
                  @StatusID,
                  @CallbackDate,
                  @SerialNo
            )

END
GO

-- Test
-- EXECUTE CreateCustomer @CustomerId=4,@CompanyId=1

------------------------- PROCEDURE: RegisterCallbackRandomizer ------------------------

GO
CREATE OR ALTER PROCEDURE RegisterCallbackRandomizer @SerialNo INT
AS
SET NOCOUNT ON

BEGIN
      -- Get Route level information
      DECLARE @RouteId INT;

      SET @RouteId = (
            SELECT 
                  RouteID 
            FROM 
                  Contract.Unit unit
            INNER JOIN Territory.Building bldg ON bldg.BuildingID = unit.BuildingID
            WHERE SerialNo = @SerialNo
      );

      -- Get mechanic
      DECLARE @EmployeeId INT;

      SET @EmployeeId = (
            SELECT 
                  TOP 1
                  emp.EmployeeId
            FROM 
                  Person.Employee emp
            WHERE 
                  emp.RoleId = 1
                  AND emp.LastDate IS NULL
            ORDER BY NEWID()
      )

      -- Set callback status as active
      DECLARE @StatusID INT = 1;

      -- Set callback date as current date
      DECLARE @CallbackDate DATE;-- = GETDATE();
      DECLARE @StartDate AS date;
      DECLARE @EndDate AS date;

      SELECT @StartDate = '01/01/2018', -- Date Format - DD/MM/YYY
            @EndDate   = '12/31/2022';

      SET @CallbackDate = (SELECT DATEADD(DAY, RAND(CHECKSUM(NEWID()))*(1+DATEDIFF(DAY, @StartDate, @EndDate)),@StartDate) AS 'SalesDate');

      INSERT INTO [Callback].[Callback]
            (
                  [RouteID],
                  [MechanicId],
                  [StatusId],
                  [CallbackDate],
                  [SerialNumber]
            )
      VALUES
            (
                  @RouteId,
                  @EmployeeId,
                  @StatusID,
                  @CallbackDate,
                  @SerialNo
            )

END
GO

------------------------- PROCEDURE: CancelCallback ------------------------


CREATE OR ALTER PROCEDURE CancelCallback @CallbackId INT
AS
BEGIN
      UPDATE Callback.Callback 
      SET 
            StatusID = 4 
      WHERE 
            Callback.CallbackID = @CallbackId;
END

------------------------- PROCEDURE: CompletedCallback ------------------------
GO
CREATE OR ALTER PROCEDURE CompletedCallback @CallbackId INT
AS
BEGIN
      UPDATE Callback.Callback 
      SET 
            StatusID = 2 
      WHERE 
            Callback.CallbackID = @CallbackId
END
GO
------------------------- PROCEDURE: ClosedCallback ------------------------

GO
CREATE OR ALTER PROCEDURE ClosedCallback @CallbackId INT
AS
BEGIN
      UPDATE Callback.Callback 
      SET 
            StatusID = 3 
      WHERE 
            Callback.CallbackID = @CallbackId
END
GO
------------------------- PROCEDURE: CreateSale ------------------------

CREATE OR ALTER PROCEDURE CreateSale 
      @SerialNo INT,
      @Quantity INT, 
      @SalesRepID INT,
      @BillingCycle VARCHAR(255),
      @Discount INT,
	@ContractDate DATE,
	@CustomerID INT,
	@Tenure NUMERIC,
	@BillingMode VARCHAR(255)
AS
BEGIN
      -- Verify SalesRep role
      DECLARE @notFound INT = (SELECT
            CAST(
                  CASE 
                        WHEN COUNT(*) = 0 
                              THEN 1
                              ELSE 0
                        END AS BIT) AS [Found]  
      FROM
            Person.Employee emp
      WHERE 
            emp.EmployeeId = @SalesRepID AND
            emp.RoleId = 4);       

      IF @notFound = 1
            RAISERROR (15600, -1, -1, 'Sales Representative not found!');

      
      -- Fetch Company ID
      DECLARE @companyId INT = (
            SELECT CompanyId FROM Person.Customer WHERE CustomerId = @CustomerId
      )

      -- Insert data into Sale
      INSERT INTO Contract.Sale
            (
                  SerialNo,
                  Quantity,
                  SalesRepID,
                  BillingCycle,
                  Discount,
                  ContractDate,
                  CustomerID,
                  Tenure,
                  BillingMode,
                  CompanyID
            ) 
            VALUES
            (
                  @SerialNo,
                  @Quantity,
                  @SalesRepID,
                  @BillingCycle,
                  @Discount,
                  @ContractDate,
                  @CustomerID,
                  @Tenure,
                  @BillingMode,
                  @companyId
            )
END

------------------------- PROCEDURE: CreateSaleRandomizer ------------------------

-- EXECUTE CreateSaleRandomizer

GO
CREATE OR ALTER PROCEDURE CreateSaleRandomizer 
AS
BEGIN
      -- Get SalesRep
      DECLARE @SalesRepID INT = (SELECT TOP 1 EmployeeId FROM Person.Employee WHERE RoleID = 4 ORDER BY NEWID())
      
      -- Fetch Company ID
      DECLARE @CompanyId INT = (
            SELECT CompanyId FROM Person.Employee WHERE EmployeeId = @SalesRepID
      )

      -- Get Unit
      DECLARE @RegionID INT = (

            SELECT TOP 1
                  cmp.RegionID 
            FROM Client.Company cmp
            WHERE 
                  cmp.CompanyId = @CompanyId
            ORDER BY NEWID()
            );

      DECLARE @TerritoryID INT = (
            SELECT TOP 1
                  TerritoryID 
            FROM 
                  Territory.Territory ter
            INNER JOIN Territory.Region reg ON reg.RegionID = ter.RegionID
            WHERE 
                  reg.RegionID = @RegionID
            ORDER BY NEWID()
            );

      DECLARE @RouteID INT = (
            SELECT TOP 1
                  RouteID 
            FROM 
                  Territory.Route [route]
            INNER JOIN Territory.Territory ter ON ter.TerritoryID = [route].TerritoryID
            WHERE 
                  ter.TerritoryID = @TerritoryID
            ORDER BY NEWID()
            );
      
      DECLARE @BuildingId INT = (
            SELECT TOP 1
                  BuildingID 
            FROM 
                  Territory.Building [build]
            INNER JOIN Territory.Route [route] ON [route].RouteID = [build].RouteID
            WHERE 
                  [route].RouteID = @RouteID
            ORDER BY NEWID()
            );
      
      DECLARE @SerialNo INT = (
            SELECT TOP 1
                  SerialNo 
            FROM 
                  Contract.Unit [unit]
            INNER JOIN Territory.Building [build] ON [build].BuildingID = [unit].BuildingID
            WHERE 
                  [build].BuildingID = 1--@BuildingId
            ORDER BY NEWID()
            );

      -- Get Customer
      DECLARE @CustomerID INT = (SELECT TOP 1 CustomerID FROM Person.Customer WHERE CompanyId <> @CompanyId ORDER BY NEWID())

      DECLARE @Discount INT = (SELECT RAND()*(10-5)+5);

      DECLARE @Quantity INT = (SELECT RAND()*(10-5)+5);

      -- Billing cycle
      CREATE TABLE #BillingCycle (BillingCycle VARCHAR(255))

      --Inserting data into the local temp table
      INSERT INTO #BillingCycle Values('Monthly');  
      INSERT INTO #BillingCycle Values('Half Yearly'); 
      INSERT INTO #BillingCycle Values('Yearly');  
      INSERT INTO #BillingCycle Values('Quarterly'); 

      DECLARE @BillingCycle VARCHAR(255) = (SELECT TOP 1 BillingCycle FROM #BillingCycle ORDER BY NEWID());

      -- Billing cycle
      CREATE TABLE #BillingMode (BillingMode VARCHAR(255))

      --Inserting data into the local temp table
      INSERT INTO #BillingMode Values('Advance');  
      INSERT INTO #BillingMode Values('Arrears'); 

      DECLARE @BillingMode VARCHAR(255) = (SELECT TOP 1 BillingMode FROM #BillingMode ORDER BY NEWID());

      DECLARE @Tenure NUMERIC = (SELECT RAND()*(12-1)+1);

      -- Set Contract date
      DECLARE @ContractDate DATE;-- = GETDATE();
      DECLARE @StartDate AS date;
      DECLARE @EndDate AS date;

      SELECT @StartDate = '01/01/2018', -- Date Format - DD/MM/YYY
             @EndDate   = '12/31/2022';

      SET @ContractDate = (SELECT DATEADD(DAY, RAND(CHECKSUM(NEWID()))*(1+DATEDIFF(DAY, @StartDate, @EndDate)),@StartDate) AS 'SalesDate');

      -- Insert data into Sale
      INSERT INTO Contract.Sale
            (
                  SerialNo,
                  Quantity,
                  SalesRepID,
                  BillingCycle,
                  Discount,
                  ContractDate,
                  CustomerID,
                  Tenure,
                  BillingMode,
                  CompanyID
            ) 
            VALUES
            (
                  @SerialNo,
                  @Quantity,
                  @SalesRepID,
                  @BillingCycle,
                  @Discount,
                  @ContractDate,
                  @CustomerID,
                  @Tenure,
                  @BillingMode,
                  @companyId
            )
END
GO

------------------------- PROCEDURE: InsertMaintenanceJobs ------------------------

GO
--DROP TRIGGER [Contract].[InsertMaintenanceJobs]
CREATE OR ALTER TRIGGER InsertMaintenanceJobs
ON Contract.Sale
AFTER 
    INSERT AS
BEGIN
      SET NOCOUNT ON;

      -- Get EmployeeID
      DECLARE @employeeID INT = (SELECT TOP 1 emp.EmployeeID FROM Person.Employee emp WHERE emp.CompanyID = (SELECT companyID FROM INSERTED));

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

------------------------- PROCEDURE: CompletedMaintenanceJob ------------------------

GO
CREATE OR ALTER PROCEDURE CompletedMaintenanceJob @JobId INT
AS
BEGIN
      UPDATE Callback.MaintenanceJobs 
      SET 
            JobStatus = 2 
      WHERE 
            JobId = @JobId
END
GO

------------------------- PROCEDURE: CancelMaintenanceJob ------------------------

GO
CREATE OR ALTER PROCEDURE CancelMaintenanceJob @JobId INT
AS
BEGIN
      UPDATE Callback.MaintenanceJobs
      SET 
            JobStatus = 4 
      WHERE 
            mj.JobId = @JobId
END
GO

SELECT * FROM Callback.Status

------------------------- PROCEDURE: CreateRegionRandomizer ------------------------

GO
CREATE OR ALTER PROCEDURE CreateRegionRandomizer
AS
BEGIN
      -- Fetch CountryCode
      DECLARE @CountryCode INT = (
            SELECT  TOP 1 CountryCode FROM Territory.Country WHERE CountryCode <> 1 ORDER BY NEWID()
      );
      -- Region
      CREATE TABLE #Region (RegionName VARCHAR(30))
      --Inserting data into the local temp table
      INSERT INTO #Region Values('Southwest');
      INSERT INTO #Region Values('Northeast');
      INSERT INTO #Region Values('Northwest');
      INSERT INTO #Region Values('Southeast');
      INSERT INTO #Region Values('North');
      INSERT INTO #Region Values('South');
      INSERT INTO #Region Values('East');
      INSERT INTO #Region Values('West');
      DECLARE @RegionName VARCHAR(30) = (SELECT TOP 1 RegionName FROM #Region ORDER BY NEWID());
      -- Insert data into Region
      INSERT INTO Territory.Region
            (
                  RegionName,
                  CountryCode
            )
            VALUES
            (
                  @RegionName,
                  @CountryCode
            )
END
GO


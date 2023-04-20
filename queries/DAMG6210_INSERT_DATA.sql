USE Team_Project10;

------------------------- Country ---------------------------
INSERT INTO Territory.Country (CountryName) VALUES ('United States');
INSERT INTO Territory.Country (CountryName) VALUES ('United Kingdom'); 
INSERT INTO Territory.Country (CountryName) VALUES ('India');
INSERT INTO Territory.Country (CountryName) VALUES ('China');
INSERT INTO Territory.Country (CountryName) VALUES ('Russia');
INSERT INTO Territory.Country (CountryName) VALUES ('Japan');
INSERT INTO Territory.Country (CountryName) VALUES ('Turkey');
INSERT INTO Territory.Country (CountryName) VALUES ('France');
INSERT INTO Territory.Country (CountryName) VALUES ('Italy');
INSERT INTO Territory.Country (CountryName) VALUES ('Canada');

------------------------- Territory.Region ---------------------------
INSERT INTO Territory.Region (RegionName,CountryCode) VALUES ('Northwest',1);
INSERT INTO Territory.Region (RegionName,CountryCode) VALUES ('Southwest',1);
INSERT INTO Territory.Region (RegionName,CountryCode) VALUES ('Southeast',1);
INSERT INTO Territory.Region (RegionName,CountryCode) VALUES ('Northeast',1);
INSERT INTO Territory.Region (RegionName,CountryCode) VALUES ('Northwest',2);
INSERT INTO Territory.Region (RegionName,CountryCode) VALUES ('Southwest',2);
INSERT INTO Territory.Region (RegionName,CountryCode) VALUES ('Southeast',2);
INSERT INTO Territory.Region (RegionName,CountryCode) VALUES ('Northeast',2);
INSERT INTO Territory.Region (RegionName,CountryCode) VALUES ('North',3);
INSERT INTO Territory.Region (RegionName,CountryCode) VALUES ('South',3);
INSERT INTO Territory.Region (RegionName,CountryCode) VALUES ('East',3);
INSERT INTO Territory.Region (RegionName,CountryCode) VALUES ('West',3);

------------------------- Territory.Territory ---------------------------
INSERT INTO Territory.Territory (TerritoryName,RegionID) VALUES ('Berkshire',4);
INSERT INTO Territory.Territory (TerritoryName,RegionID) VALUES ('Franklin',4);
INSERT INTO Territory.Territory (TerritoryName,RegionID) VALUES ('Worcester',4);
INSERT INTO Territory.Territory (TerritoryName,RegionID) VALUES ('Middlesex',4);
INSERT INTO Territory.Territory (TerritoryName,RegionID) VALUES ('Hampshire',4);
INSERT INTO Territory.Territory (TerritoryName,RegionID) VALUES ('Hampden',4);
INSERT INTO Territory.Territory (TerritoryName,RegionID) VALUES ('Bristol',4);
INSERT INTO Territory.Territory (TerritoryName,RegionID) VALUES ('Dukes',4);
INSERT INTO Territory.Territory (TerritoryName,RegionID) VALUES ('Nantucket',4);
INSERT INTO Territory.Territory (TerritoryName,RegionID) VALUES ('Barnstable',4);
INSERT INTO Territory.Territory (TerritoryName,RegionID) VALUES ('Plymouth',4);
INSERT INTO Territory.Territory (TerritoryName,RegionID) VALUES ('Norfolk',4);
INSERT INTO Territory.Territory (TerritoryName,RegionID) VALUES ('Suffolk',4);
INSERT INTO Territory.Territory (TerritoryName,RegionID) VALUES ('Essex',4);

------------------------- Territory.Route ---------------------------
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('Allston',4);
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('Boston',4);
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('Brighton',4);
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('Charlestown',4);
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('Chelsea',4);
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('Dorchester',4);
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('Dorchester Center',4);
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('Hyde Park',4);
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('Jamaica Plain',4);
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('Mattapan',4);
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('Revere',4);
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('Roslindale',4);
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('Roxbury',4);
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('Roxbury Crossing',4);
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('West Roxbury',4);
INSERT INTO Territory.Route(RouteName,TerritoryID) VALUES ('Winthrop',4);

------------------------- Client.Organization ---------------------------
INSERT INTO Client.Organization (OrganizationName,OrganizationCountryCode,OrganizationSSN) VALUES ('OTIS US',1,'999-999-9999');
INSERT INTO Client.Organization (OrganizationName,OrganizationCountryCode,OrganizationSSN) VALUES ('OTIS UK',2,'129-567-9999');
INSERT INTO Client.Organization (OrganizationName,OrganizationCountryCode,OrganizationSSN) VALUES ('OTIS IN',3,'159-678-9699');
INSERT INTO Client.Organization (OrganizationName,OrganizationCountryCode,OrganizationSSN) VALUES ('OTIS CH',4,'906-657-9499');
INSERT INTO Client.Organization (OrganizationName,OrganizationCountryCode,OrganizationSSN) VALUES ('OTIS RU',5,'349-496-9299');
INSERT INTO Client.Organization (OrganizationName,OrganizationCountryCode,OrganizationSSN) VALUES ('OTIS JP',6,'149-570-9199');
INSERT INTO Client.Organization (OrganizationName,OrganizationCountryCode,OrganizationSSN) VALUES ('OTIS TR',7,'134-123-9199');
INSERT INTO Client.Organization (OrganizationName,OrganizationCountryCode,OrganizationSSN) VALUES ('OTIS FR',8,'179-367-9023');
INSERT INTO Client.Organization (OrganizationName,OrganizationCountryCode,OrganizationSSN) VALUES ('OTIS IT',9,'567-457-8301');
INSERT INTO Client.Organization (OrganizationName,OrganizationCountryCode,OrganizationSSN) VALUES ('OTIS CA',10,'432-980-9824');


------------------------- Client.Company ---------------------------
INSERT INTO Client.Company (OrganizationID,RegionID,CompanyName) VALUES (1,1,'Otis US: Northwest');
INSERT INTO Client.Company (OrganizationID,RegionID,CompanyName) VALUES (1,2,'Otis US: Southwest');
INSERT INTO Client.Company (OrganizationID,RegionID,CompanyName) VALUES (1,3,'Otis US: Southeast');
INSERT INTO Client.Company (OrganizationID,RegionID,CompanyName) VALUES (1,4,'Otis US: Northeast');
INSERT INTO Client.Company (OrganizationID,RegionID,CompanyName) VALUES (2,5,'Otis UK: Northwest');
INSERT INTO Client.Company (OrganizationID,RegionID,CompanyName) VALUES (2,6,'Otis UK: Southwest');
INSERT INTO Client.Company (OrganizationID,RegionID,CompanyName) VALUES (2,7,'Otis UK: Southeast');
INSERT INTO Client.Company (OrganizationID,RegionID,CompanyName) VALUES (2,8,'Otis UK: Northeast');
INSERT INTO Client.Company (OrganizationID,RegionID,CompanyName) VALUES (3,9,'Otis IN: South');
INSERT INTO Client.Company (OrganizationID,RegionID,CompanyName) VALUES (3,10,'Otis IN: North');



------------------------- ProductType ---------------------------
INSERT INTO Product.ProductType (Name) VALUES ('DUMBWAITER');
INSERT INTO Product.ProductType (Name) VALUES ('LOW RISE-ELEVATOR');
INSERT INTO Product.ProductType (Name) VALUES ('ESCALATOR'); 
INSERT INTO Product.ProductType (Name) VALUES ('MOVING WALKS');
INSERT INTO Product.ProductType (Name) VALUES ('MID RISE-ELEVATOR');
INSERT INTO Product.ProductType (Name) VALUES ('HIGH RISE-ELEVATOR'); 
INSERT INTO Product.ProductType (Name) VALUES ('BOAT LIFTS');
INSERT INTO Product.ProductType (Name) VALUES ('STAGE LIFTS');
INSERT INTO Product.ProductType (Name) VALUES ('SIDEWALK ELEVATORS');
INSERT INTO Product.ProductType (Name) VALUES ('SCISSOR LIFT');


------------------------- Product ---------------------------
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('DW300',1000,1,'01/24/1999',1);
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('LR500',2000,2,'12/21/1997',0); 
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('ES555',5000,3,'02/26/1996',1); 
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('MV999',2000,4,'12/02/2006',1); 
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('MR400',5599,5,'06/14/1993',0); 
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('HR800',9000,6,'05/03/1994',0);
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('BL250',9999,7,'08/14/1993',1);
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('SL190',3459,8,'05/03/1994',1);
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('SE899',9999,9,'07/07/2004',1);
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('SC420',6900,10,'10/16/1997',1);
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('DW300',1000,1,'06/20/2003',0);
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('LR500',2000,2,'02/12/2000',1);
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('ES555',5000,3,'12/02/2006',1); 
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('MV999',2000,4,'12/02/2002',0); 
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('MR400',5599,5,'09/24/1999',1); 
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('HR800',9000,6,'11/23/2004',1);
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('BL250',9999,7,'09/23/1999',1);
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('SL190',3459,8,'01/20/1999',1);
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('SE899',9999,9,'10/29/2000',1);
INSERT INTO Product.Product (ProductName,FixedPrice,ProductTypeID,ManufacturingDate,IsCommercial) VALUES ('SC420',6900,10,'07/02/1999',1);

------------------------- Status ---------------------------
INSERT INTO Callback.Status (StatusType) VALUES ('Active')
INSERT INTO Callback.Status (StatusType) VALUES ('Completed')
INSERT INTO Callback.Status (StatusType) VALUES ('Closed')
INSERT INTO Callback.Status (StatusType) VALUES ('Cancelled')

------------------------- Gender ---------------------------
INSERT INTO Person.Gender (Gender) VALUES ('MALE');
INSERT INTO Person.Gender (Gender) VALUES ('FEMALE');
INSERT INTO Person.Gender (Gender) VALUES ('OTHER');

------------------------- Client.Role ---------------------------
INSERT INTO Person.Role (Position) VALUES ('Mechanic');
INSERT INTO Person.Role (Position) VALUES ('Supervisor');
INSERT INTO Person.Role (Position) VALUES ('Branch Manager');
INSERT INTO Person.Role (Position) VALUES ('Sales Represetative');

------------------------- Person ---------------------------
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Akshita','Barot','870-567-0987','06/22/1995','aks@otis.com',2);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Siddhant','Kohli','900-127-3507','12/20/1996','sid@otis.com',1);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Aniruddha','Tambe','125-674-3045','10/31/1996','ani@otis.com',1);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Kinjal','Thakkar','800-289-8247','07/07/1997','kinjal@otis.com',2);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Forum','Bhatt','764-123-8765','04/08/1997','foram@otis.com',2);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Vishwa','Shah','790-345-8900','01/13/1994','vish@otis.com',2);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Rishabh','Mehra','679-007-2357','03/02/1990','rish@otis.com',1);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Mehul','Sharma','762-827-0274','07/02/1980','mehul@otis.com',1);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Kate','Tyler','890-530-0931','12/12/1985','kate@otis.com',3);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Robert','Tate','456-780-2907','05/29/1989','rob@otis.com',1);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Vince','Bach','782-758-0127','10/03/1979','vince@otis.com',1);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Sebastian','Novak','435-098-1230','09/28/1988','seb@otis.com',3);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Susan','Connor','890-409-6279','01/01/1990','sus@otis.com',3);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Jeff','Johnson','900-780-0001','05/24/1998','jeff@otis.com',1);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Marlene','Grace','800-145-7379','08/30/1994','marlene@otis.com',3);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Ann','Claire','790-820-5611','11/11/1983','ann@otis.com',2);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('John','Andrew','908-569-1203','03/31/1976','john@otis.com',1);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Frank','Hill','901-111-8900','08/12/1989','frank@otis.com',1);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Rick','Forbis','901-524-5678','04/28/1986','rick@otis.com',1);
INSERT INTO Person.Person (FirstName,LastName,PhoneNumber,DateofBirth,EmailAddress,GenderID) VALUES ('Graham','Coleman','870-567-0987','12/12/1982','graham@otis.com',1);

------------------------Employee-----------------------------

EXECUTE CreateEmployee @EmployeeId=1,@CompanyId=1,@RoleId=1,@JoiningDate='11/30/2022'
EXECUTE CreateEmployee @EmployeeId=2,@CompanyId=1,@RoleId=1,@JoiningDate='11/30/2022'
EXECUTE CreateEmployee @EmployeeId=3,@CompanyId=1,@RoleId=1,@JoiningDate='10/30/2022'
EXECUTE CreateEmployee @EmployeeId=4,@CompanyId=1,@RoleId=1,@JoiningDate='10/30/2022'
EXECUTE CreateEmployee @EmployeeId=5,@CompanyId=1,@RoleId=1,@JoiningDate='9/30/2022'
EXECUTE CreateEmployee @EmployeeId=6,@CompanyId=1,@RoleId=2,@JoiningDate='9/30/2022'
EXECUTE CreateEmployee @EmployeeId=7,@CompanyId=1,@RoleId=2,@JoiningDate='8/14/2022'
EXECUTE CreateEmployee @EmployeeId=8,@CompanyId=1,@RoleId=3,@JoiningDate='8/30/2022'
EXECUTE CreateEmployee @EmployeeId=9,@CompanyId=1,@RoleId=4,@JoiningDate='6/30/2022'
EXECUTE CreateEmployee @EmployeeId=10,@CompanyId=1,@RoleId=4,@JoiningDate='6/15/2022'


------------------------Customer-----------------------------
EXECUTE CreateCustomer @CustomerId=11,@CompanyId=1
EXECUTE CreateCustomer @CustomerId=12,@CompanyId=1
EXECUTE CreateCustomer @CustomerId=13,@CompanyId=2
EXECUTE CreateCustomer @CustomerId=14,@CompanyId=2
EXECUTE CreateCustomer @CustomerId=15,@CompanyId=3
EXECUTE CreateCustomer @CustomerId=16,@CompanyId=3
EXECUTE CreateCustomer @CustomerId=17,@CompanyId=4
EXECUTE CreateCustomer @CustomerId=18,@CompanyId=4
EXECUTE CreateCustomer @CustomerId=19,@CompanyId=4
EXECUTE CreateCustomer @CustomerId=20,@CompanyId=4

----------------------- UserDetails --------------------------
INSERT INTO Person.UserDetails (LoginId, EncryptedPassword,PersonId ) VALUES ('kinjalthakkar14' , EncryptByKey(Key_GUID(N'PasswordSymmetricKey'), convert(varbinary, 'PassTS1')),4);
INSERT INTO Person.UserDetails (LoginId, EncryptedPassword,PersonId ) VALUES ('akshitabarot' , EncryptByKey(Key_GUID(N'PasswordSymmetricKey'), convert(varbinary, 'akshita')),1);
INSERT INTO Person.UserDetails (LoginId, EncryptedPassword,PersonId ) VALUES ('siddhantkohli' , EncryptByKey(Key_GUID(N'PasswordSymmetricKey'), convert(varbinary, 'siddhant')),2);
INSERT INTO Person.UserDetails (LoginId, EncryptedPassword,PersonId ) VALUES ('aniruddhatambe' , EncryptByKey(Key_GUID(N'PasswordSymmetricKey'), convert(varbinary, 'aniruddha')),3);
INSERT INTO Person.UserDetails (LoginId, EncryptedPassword,PersonId ) VALUES ('forumbhatt' , EncryptByKey(Key_GUID(N'PasswordSymmetricKey'), convert(varbinary, 'forum')),5);
INSERT INTO Person.UserDetails (LoginId, EncryptedPassword,PersonId ) VALUES ('vishwashah' , EncryptByKey(Key_GUID(N'PasswordSymmetricKey'), convert(varbinary, 'vishwa')),6);
INSERT INTO Person.UserDetails (LoginId, EncryptedPassword,PersonId ) VALUES ('rishabhmehra' , EncryptByKey(Key_GUID(N'PasswordSymmetricKey'), convert(varbinary, 'rishabh')),7);
INSERT INTO Person.UserDetails (LoginId, EncryptedPassword,PersonId ) VALUES ('mehulsharma' , EncryptByKey(Key_GUID(N'PasswordSymmetricKey'), convert(varbinary, 'mehul')),8);
INSERT INTO Person.UserDetails (LoginId, EncryptedPassword,PersonId ) VALUES ('kateteyler' , EncryptByKey(Key_GUID(N'PasswordSymmetricKey'), convert(varbinary, 'teyler')),9);
INSERT INTO Person.UserDetails (LoginId, EncryptedPassword,PersonId ) VALUES ('roberttate' , EncryptByKey(Key_GUID(N'PasswordSymmetricKey'), convert(varbinary, 'robert')),10);


------------------------ PROCEDURE: InsertTerritoryBuilding-------------------------
EXECUTE InsertTerritoryBuilding @StreetNumber=34,@Address1='Wigglesworth',@Address2='Boston,MA', @RouteID=2
EXECUTE InsertTerritoryBuilding @StreetNumber=68, @Address1='Day Street',@Address2='Boston,MA', @RouteID=2
EXECUTE InsertTerritoryBuilding @StreetNumber=45, @Address1='School Street',@Address2='Boston,MA', @RouteID=2
EXECUTE InsertTerritoryBuilding @StreetNumber=75, @Address1='St. Alphonsus Street',@Address2='Boston,MA', @RouteID=2
EXECUTE InsertTerritoryBuilding @StreetNumber=168, @Address1='Peterborough Street',@Address2='Boston,MA', @RouteID=2
EXECUTE InsertTerritoryBuilding @StreetNumber=2,@Address1='N Harvard St',@Address2='Allston,MA', @RouteID=1
EXECUTE InsertTerritoryBuilding @StreetNumber=43, @Address1='Rotterdam St',@Address2='Allston,MA', @RouteID=1
EXECUTE InsertTerritoryBuilding @StreetNumber=41, @Address1='Arlington Street',@Address2='Brighton,MA', @RouteID=3
EXECUTE InsertTerritoryBuilding @StreetNumber=7, @Address1='Duncklee Street',@Address2='Brighton,MA', @RouteID=3
EXECUTE InsertTerritoryBuilding @StreetNumber=168, @Address1='Woodrow Avenue',@Address2='Dorchester,MA', @RouteID=6


-------------------------- PROCEDURE: InsertContractUnit ------------------------

DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 1000)
BEGIN
    DECLARE @prodId INT = (SELECT TOP 1 ProductId FROM Product.Product ORDER BY NEWID());
    DECLARE @isActive INT = (SELECT RAND(1));
    DECLARE @buildingId INT = (SELECT TOP 1 BuildingId FROM Territory.Building ORDER BY NEWID());
    EXECUTE InsertContractUnit @ProductId=@prodId,@IsActive=1,@BuildingID=@buildingId
    SET @Counter = @Counter + 1;
END

-------------------------- Callback ------------------------

SET @Counter=1
WHILE ( @Counter <= 100)
BEGIN
    DECLARE @serialNo INT = (SELECT TOP 1 SerialNo FROM Contract.Unit ORDER BY NEWID());
    DECLARE @serialCounter INT = 1
    WHILE (@serialCounter <= 15)
    BEGIN
        EXECUTE RegisterCallbackRandomizer @serialNo
        SET @serialCounter = @serialCounter + 1;
    END
    SET @Counter = @Counter + 1;
END


SET @Counter=1
WHILE ( @Counter <= 200)
BEGIN
    DECLARE @callbackId INT = (SELECT TOP 1 CallbackId FROM Callback.Callback ORDER BY NEWID());
    EXECUTE CancelCallback @callbackId

    SET @callbackId = (SELECT TOP 1 CallbackId FROM Callback.Callback ORDER BY NEWID());
    EXECUTE CompletedCallback @callbackId

    SET @callbackId = (SELECT TOP 1 CallbackId FROM Callback.Callback ORDER BY NEWID());
    EXECUTE ClosedCallback @callbackId

    SET @Counter = @Counter + 1;
END

-------------------------- Sale ------------------------

SET @Counter = 1
WHILE ( @Counter <= 100)
BEGIN
    EXECUTE CreateSaleRandomizer
    SET @Counter = @Counter + 1;
END         

-------------------------- MaintenanceJob ------------------------

SET @Counter = 1
WHILE ( @Counter <= 100)
BEGIN
    DECLARE @jobId INT = (SELECT TOP 1 JobID FROM Callback.MaintenanceJobs ORDER BY NEWID())
    EXECUTE CompletedMaintenanceJob @jobId

    SET @jobId = (SELECT TOP 1 JobID FROM Callback.MaintenanceJobs ORDER BY NEWID())
    EXECUTE CancelMaintenanceJob @jobId

    SET @Counter = @Counter + 1;
END     


SET @Counter = 1
WHILE ( @Counter <= 20)
BEGIN
    EXECUTE CreateRegionRandomizer
    SET @Counter = @Counter + 1;
END

SELECT * FROM YearlyCallBackPerSerial10
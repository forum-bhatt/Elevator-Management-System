USE Team_Project10
DROP TABLE Callback.Callback
DROP TABLE Callback.MaintenanceJobs
DROP TABLE Callback.Status
DROP TABLE Person.UserDetails
DROP TABLE Contract.Sale
DROP TABLE Person.Customer
DROP TABLE Person.Employee
DROP TABLE Person.Person
DROP TABLE Person.Role
DROP TABLE Person.Gender
DROP TABLE Contract.Unit
DROP TABLE Product.Product
DROP TABLE Product.ProductType
DROP TABLE Territory.Building
DROP TABLE Client.Company
DROP TABLE Client.Organization
DROP TABLE Territory.Route
DROP TABLE Territory.Territory
DROP TABLE Territory.Region
DROP TABLE Territory.Country

CLOSE SYMMETRIC KEY PasswordSymmetricKey;
DROP SYMMETRIC KEY PasswordSymmetricKey;
DROP CERTIFICATE PasswordCertificate;
DROP MASTER KEY;










----- Encrypt Passsword -----

-- Create DMK
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'Team10_P@sswOrd';

-- Create certificate to protect symmetric key
CREATE CERTIFICATE PasswordCertificate
WITH SUBJECT = 'Password Test Certificate',
EXPIRY_DATE = '2026-10-31';

-- DROP CERTIFICATE PasswordCertificate;

-- Create symmetric key to encrypt data
CREATE SYMMETRIC KEY PasswordSymmetricKey
WITH ALGORITHM = AES_128
ENCRYPTION BY CERTIFICATE PasswordCertificate;

-- DROP SYMMETRIC KEY PasswordSymmetricKey;

-- Open symmetric key
OPEN SYMMETRIC KEY PasswordSymmetricKey
DECRYPTION BY CERTIFICATE PasswordCertificate;


-- Use DecryptByKey to decrypt the encrypted data and see what we have in the table
-- select LoginId, DecryptByKey(EncryptedPassword)
-- from Person.UserDetails;


-- -- Use DecryptByKey to decrypt the encrypted data and see what we have in the table
-- -- DecryptByKey returns VARBINARY with a maximum size of 8,000 bytes
-- -- Also use CONVERT to convert the decrypted data to VARCHAR so that we can see the
-- -- plain passwords
-- select LoginId, convert(varchar, DecryptByKey(EncryptedPassword))
-- from Person.UserDetails;


-- DECLARE @command varchar(1000)
-- SELECT @command = 'SELECT * FROM sys.symmetric_keys'
-- EXEC sp_MSforeachdb @command

-- End
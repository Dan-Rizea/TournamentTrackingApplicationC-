CREATE TABLE TestPerson (
    id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    EmailAddress NVARCHAR(200) NOT NULL,
	PhoneNumber VARCHAR(20),
	NumberOfKids INT NOT NULL,
	CreateDate DATETIME2(7) NOT NULL,
);

ALTER TABLE TestPerson
	ADD CONSTRAINT NOKCD_DEFAULT
	DEFAULT GETDATE() FOR CreateDate,
	DEFAULT 0 FOR NumberOfKidS;

DROP TABLE TestPerson

INSERT INTO TestPerson (FirstName,LastName,EmailAddress,PhoneNumber,NumberOfKids)
			VALUES ('Tim','Corey','test@corey.com','555-121212',2)
			
INSERT INTO TestPerson (FirstName,LastName,EmailAddress,PhoneNumber)
			VALUES ('Jim','Smith','hello@world.com','555-1212')

CREATE PROC spPrizes_GetByTournament
	@TournamentId Int
AS
BEGIN
 
SET NOCOUNT ON

SELECT p. *
FROM dbo.Prizes p
INNER JOIN dbo.TournamentPrizes t on p.id = t.PrizeId
WHERE t.TournamentId = @TournamentId;

END

CREATE PROC spTestPerson_GetByLastName
	@LastName nvarchar(100)
AS
BEGIN

SET NOCOUNT ON

SELECT * FROM TestPerson WHERE LastName = @LastName;

END

exec spTestPerson_GetByLastName @LastName = 'Smith'

SELECT * FROM TestPerson
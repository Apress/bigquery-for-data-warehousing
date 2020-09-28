WITH PetCount AS (SELECT UserID, COUNT(*) NumberOfPets
FROM UserPets
GROUP BY UserID)
SELECT Username, PhoneNumber, NumberOfPets
FROM Users
JOIN PetCount USING (UserID)

SELECT UserID, UserName, PetName
FROM Users
INNER JOIN UserPets
ON Users.UserID = UserPets.OwnerID    
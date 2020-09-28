SELECT UserID, PhoneNumber,
(SELECT COUNT(*) FROM UNNEST(UserPets)) PetCount
FROM DW_Users;

SELECT UserID, P.PetName
FROM DW_Users
JOIN UNNEST(DW_Users.UserPets) P;

#!/usr/bin/env python
import bcrypt

f = open('roll.txt')

selectString = "SELECT * FROM STUDENTS_INFO WHERE RollNumber IN ("
insertString = "INSERT INTO STUDENT_ADMIN (Username, Password ) VALUES "
updateStringTemplate = "UPDATE STUDENT_ADMIN SET Password = "
updateString = ""

for roll in f:
    roll = roll[:-1]
    salt = bcrypt.gensalt(10)
    hashed = bcrypt.hashpw(roll.encode('UTF-8'), salt)
    hashed = hashed.decode('UTF-8')
    selectString = selectString + "'" + roll + "',"
    insertString = insertString + "('" + roll + "', '" + hashed + "'), "
    updateString = updateString + updateStringTemplate + \
        "'" + hashed + "' WHERE Username = '" + roll + "';"

selectString = selectString[:-1] + ");"
insertString = insertString[:-2] + ";"

print("-----DB Password-----")
print("n04xp2243543grein1i")
print("\n-----Checks-----")
print(selectString)
print(selectString.replace('STUDENTS_INFO',
      'STUDENT_ADMIN').replace('RollNumber', 'Username'))
print("\n-----Insert New-----")
print(insertString)
print("\n-----Update Existing-----")
print(updateString)

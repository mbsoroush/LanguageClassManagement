import mysql.connector
from datetime import datetime

conn = mysql.connector.connect(
    host='localhost',
    database='project',
    user='root',
    password='1111'
)
cursor = conn.cursor()


def responsible():
    while True:
        option = input(
            """Select what want to do:
    1. Add new class
    2. teacher registration
    3. Student registration
    4. Add teacher to class
    5. Add student to class
    6. Change ClassID or Class time
    7. Roll call of teachers
    8. Roll call of students
    x. exit
    : """)
        if option == "1":
            add_class()
        elif option == "2":
            regteacher()
        elif option == "3":
            regstudent()
        elif option == "4":
            addteacher()
        elif option == "5":
            addstudent()
        elif option == "6":
            change_time_id()
        elif option == "7":
            roll_call_teacher()
        elif option == "8":
            roll_call_student()
        elif option == "x":
            return main_menu()


def add_class():
    C_Id = int(input("Enter class's number: "))
    C_Language = input("Enter class's language: ")
    C_TeacherID = int(input("Enter Teacher ID(if class dont have teacher yet enter 0): "))
    time = str(input("Enter time of start class (HH:MM): "))
    C_time = datetime.strptime(time, "%H:%M")
    C_days = input("Enter the day of the class: ")
    Sdate = str(input("Enter date when class start (yyyy-mm-dd): "))
    C_Sdate = datetime.strptime(Sdate, "%Y-%m-%d")
    Fdate = str(input("Enter date when class finish (yyyy-mm-dd): "))
    C_Fdate = datetime.strptime(Fdate, "%Y-%m-%d")
    C_Snumber = int(input("Enter number of sessions: "))
    C_Term = int(input("Enter term of the class: "))

    sql = 'INSERT INTO class(Class_ID,Language,Teacher,Start_Date,Finish_Date,Number_sessions,Term) VALUES(%s,%s,%s,%s,%s,%s,%s)'
    val = (C_Id, C_Language, C_TeacherID, C_Sdate, C_Fdate, C_Snumber, C_Term)
    cursor.execute(sql, val)

    cursor.execute('INSERT INTO class_days(Class_ID,Language,Days,Time) VALUES(%s,%s,%s,%s)',
                   (C_Id, C_Language, C_days, C_time))

    cursor.execute('INSERT INTO roll_call_teacher(Class_ID,Language) VALUES(%s,%s)', (C_Id, C_Language))

    if C_TeacherID != 0:
        cursor.execute('INSERT INTO class_teacher(Class_ID,Teacher,Term) VALUES(%s,%s,%s)', (C_Id, C_TeacherID, C_Term))

    conn.commit()

    print('\nNew class added successfully!\n')


def regteacher():
    T_Id = int(input("Enter teacher ID: "))
    P_Fname = input("Enter First name: ")
    P_Lname = input("Enter Last name: ")
    P_NID = int(input("Enter national ID: "))
    P_sex = input("Enter sex(man/woman): ")
    P_Pnumber = input("Enter phone number: ")
    P_Address = input("Enter address: ")
    T_Language = input("Enter teaching language:")
    T_certificate = input("Enter teacher certification: ")
    Sdate = str(input("Enter date when teaching start (yyyy-mm-dd): "))
    T_Sdate = datetime.strptime(Sdate, "%Y-%m-%d")
    Fdate = str(input("Enter date when teaching finish (yyyy-mm-dd): "))
    T_Fdate = datetime.strptime(Fdate, "%Y-%m-%d")

    sql = "INSERT INTO teacher(ID,Startwork_Date,Finishwork_Date) VALUES(%s,%s,%s)"
    val = (T_Id, T_Sdate, T_Fdate)
    cursor.execute(sql, val)

    sql2 = 'INSERT INTO persons(ID,FName,LName,National_ID,Sex,Phone_Number,Address) VALUES(%s,%s,%s,%s,%s,%s,%s)'
    val2 = (T_Id, P_Fname, P_Lname, P_NID, P_sex, P_Pnumber, P_Address)
    cursor.execute(sql2, val2)

    sql3 = 'INSERT INTO teacher_languages(Teacher_ID,Languages,Certificate) VALUES(%s,%s,%s)'
    val3 = (T_Id, T_Language, T_certificate)
    cursor.execute(sql3, val3)

    conn.commit()

    print('\nNew teacher added successfully!\n')


def regstudent():
    S_Id = int(input("Enter student ID: "))
    P_Fname = input("Enter First name: ")
    P_Lname = input("Enter Last name: ")
    P_NID = int(input("Enter national ID: "))
    P_sex = input("Enter sex(man/woman): ")
    P_Pnumber = input("Enter phone number: ")
    P_Address = input("Enter address: ")
    S_LLanguage = input("Enter learning language:")
    S_Passterm = int(input("Enter passed term: "))
    Sdate = str(input("Enter date when learning start (yyyy-mm-dd): "))
    S_Sdate = datetime.strptime(Sdate, "%Y-%m-%d")

    sql = "INSERT INTO student(Student_ID,Learn_Language,Passed_Term,Start_Date) VALUES(%s,%s,%s,%s)"
    val = (S_Id, S_LLanguage, S_Passterm, S_Sdate)
    cursor.execute(sql, val)

    sql2 = 'INSERT INTO persons(ID,FName,LName,National_ID,Sex,Phone_Number,Address) VALUES(%s,%s,%s,%s,%s,%s,%s)'
    val2 = (S_Id, P_Fname, P_Lname, P_NID, P_sex, P_Pnumber, P_Address)
    cursor.execute(sql2, val2)

    conn.commit()

    print('\nNew student added successfully!\n')


def find_term(C_ID):
    cursor.execute("SELECT Term FROM class WHERE Class_ID = %s", (C_ID,))
    result = cursor.fetchall()
    arry = []
    for i in result:
        arry.append(i[0])
    C_Term = arry[0]
    return C_Term


def addteacher():
    C_ID = int(input("Enter class ID: "))
    T_ID = int(input("Enter teacher ID: "))

    sql = "UPDATE class SET Teacher = %s  WHERE Class_ID = %s "
    val = (T_ID, C_ID)
    cursor.execute(sql, val)

    C_Term = find_term(C_ID)
    sql2 = "INSERT INTO class_teacher(Class_ID,Teacher_ID,Term) VALUES(%s,%s,%s)"
    val2 = (C_ID, T_ID, C_Term)
    cursor.execute(sql2, val2)

    conn.commit()

    print("\nTeacher added to class successfully!\n")


def addstudent():
    C_ID = int(input("Enter class ID: "))
    S_ID = int(input("Enter student ID: "))

    C_Term = find_term(C_ID)

    sql = "INSERT INTO class_student(Class_ID,Student_ID,Term) VALUES(%s,%s,%s)"
    val = (C_ID, S_ID, C_Term)
    cursor.execute(sql, val)
    conn.commit()

    print("\nStudent added to class successfully!\n")


def change_time_id():
    C_ID = int(input("Enter class ID: "))
    C_NID = int(input("Enter new class ID: "))
    C_Day = input("Enter the new day of class: ")
    time = str(input("Enter new time of the class(HH:MM): "))
    C_time = datetime.strptime(time, "%H:%M")

    sql = "UPDATE class_days SET Class_ID = %s , Days = %s , Time = %s WHERE Class_ID = %s"
    val = (C_NID, C_Day, C_time, C_ID)
    cursor.execute(sql, val)

    cursor.execute("UPDATE class SET Class_ID = %s WHERE Class_ID = %s", (C_NID, C_ID))
    cursor.execute("UPDATE class_student SET Class_ID = %s WHERE Class_ID = %s", (C_NID, C_ID))
    cursor.execute("UPDATE class_teacher SET Class_ID = %s WHERE Class_ID = %s", (C_NID, C_ID))
    cursor.execute("UPDATE roll_call_student SET Class_ID = %s WHERE Class_ID = %s", (C_NID, C_ID))
    cursor.execute("UPDATE roll_call_teacher SET Class_ID = %s WHERE Class_ID = %s", (C_NID, C_ID))

    conn.commit()

    print("\nChange the class ID and days and time of the class are successfully!\n")


def roll_call_teacher():
    C_ID = int(input("Enter class ID: "))
    T_ID = int(input("Enter teacher ID: "))
    date = str(input("Enter date of the class(yyyy-mm-dd): "))
    C_Date = datetime.strptime(date, "%Y-%m-%d")
    T_Attened = input("Enter Present/Absent: ")

    sql = "UPDATE roll_call_teacher SET Teacher_ID = %s , Date = %s , Attendance = %s WHERE Class_ID = %s"
    val = (T_ID, C_Date, T_Attened, C_ID)
    cursor.execute(sql, val)
    conn.commit()

    print("\n roll call finished!\n")


def roll_call_student():
    C_ID = int(input("Enter class ID: "))
    S_ID = int(input("Enter student ID: "))
    date = str(input("Enter date of the class(yyyy-mm-dd): "))
    C_Date = datetime.strptime(date, "%Y-%m-%d")
    S_Attened = input("Enter Present/Absent: ")

    sql = "INSERT INTO roll_call_student(Class_ID,Student_ID,Date,Attendance) values(%s,%s,%s,%s) "
    val = (C_ID, S_ID, C_Date, S_Attened)
    cursor.execute(sql, val)
    conn.commit()

    print("\n roll call finished!\n")


def teacher():
    while True:
        option = input(
            """Select what want to do:
    1. Grading students
    2. Roll call of students
    3. Watch history of teaching
    x. exit
    : """)
        if option == "1":
            grading()
        elif option == "2":
            roll_call_student()
        elif option == "3":
            teacher_history()
        elif option == "x":
            return main_menu()


def grading():
    C_Id = int(input("Enter class ID: "))
    S_ID = int(input("Enter student ID: "))
    S_grade = int(input("Enter student's grade: "))

    sql = "UPDATE class_student SET Grade = %s WHERE Class_ID = %s and Student_ID = %s"
    val = (S_grade, C_Id, S_ID)
    cursor.execute(sql, val)
    conn.commit()

    print("\nGrading successfully!\n")


def teacher_history():
    T_ID = int(input("Enter teacher ID: "))
    print_name(T_ID)

    sql1 = "SELECT Class_ID,Language,Start_Date,Finish_Date,Number_sessions FROM class WHERE Teacher = %s"
    val = (T_ID,)
    cursor.execute(sql1, val)
    result = cursor.fetchall()
    print("All your classes: ")
    for i in result:
        print("Class_ID:", i[0], end=" | ")
        print("Language:", i[1], end=" | ")
        print("Start_Date:", i[2], end=" | ")
        print("Finish_Date:", i[3], end=" | ")
        print("Number_sessions", i[4])

    sql2 = "SELECT Class_ID,Language,Date FROM roll_call_teacher WHERE Teacher_ID = %s and Attendance = %s "
    val2 = (T_ID, "Present")
    cursor.execute(sql2, val2)
    result2 = cursor.fetchall()
    print("\nAll your attended classes:")
    for i in result2:
        print("Class_ID:", i[0], end=" | ")
        print("Language:", i[1], end=" | ")
        print("Date:", i[2])
    print()


def student():
    while True:
        option = input(
            """"Select what want to do:
    1. Classes
    2. Grades
    3. History of learning
    x. exit
    : """)
        if option == "1":
            student_classes()
        elif option == "2":
            student_grade()
        elif option == "3":
            student_history()
        elif option == "x":
            return main_menu()


def student_classes():
    S_ID = int(input("Enter student ID: "))
    C_Term = int(input("Enter term of the learning: "))
    print_name(S_ID)

    sql = "SELECT Class_ID,Language,Days,Time,Start_Date,Finish_Date,Grade" \
          " FROM (class_student NATURAL JOIN class) NATURAL JOIN class_days" \
          " WHERE Student_ID = %s and Term = %s"
    val = (S_ID, C_Term)
    cursor.execute(sql, val)
    result = cursor.fetchall()
    print("All classes in %s term: " % C_Term)
    for i in result:
        print("Class_ID:", i[0], end=" | ")
        print("Language:", i[1], end=" | ")
        print("Days:", i[2], end=" | ")
        print("Time:", i[3], end=" | ")
        print("Start_Date:", i[4], end=" | ")
        print("Finish_Date:", i[5], end=" | ")
        print("Grade:", i[6])
    print()


def student_grade():
    S_ID = int(input("Enter student ID: "))

    print_name(S_ID)

    sql = "SELECT Class_ID,Language,Grade FROM class_student NATURAL JOIN class WHERE Student_ID = %s"
    val = (S_ID,)
    cursor.execute(sql, val)
    result = cursor.fetchall()
    print("Your grades: ")
    for i in result:
        print("Class_ID:", i[0], end=" | ")
        print("Language:", i[1], end=" | ")
        print("Grade:", i[2])
    print()


def student_history():
    S_ID = int(input("Enter student ID: "))
    print_name(S_ID)

    sql = "SELECT Class_ID,Language FROM class_student NATURAL JOIN class WHERE Student_ID = %s"
    val = (S_ID,)
    cursor.execute(sql, val)
    result = cursor.fetchall()
    print("All your class: ")
    for i in result:
        print("Class_ID:", i[0], end=" | ")
        print("Language:", i[1])

    sql2 = "SELECT Class_ID,Language,Date FROM roll_call_student NATURAL JOIN class WHERE Student_ID = %s and Attendance = %s"
    val2 = (S_ID, "Present")
    cursor.execute(sql2, val2)
    result2 = cursor.fetchall()
    print("\nAll your class when present: ")
    for i in result2:
        print("Class_ID:", i[0], end=" | ")
        print("Language:", i[1], end=" | ")
        print("Date:", i[2])
    print()


def print_name(ID):
    sql = "SELECT Fname,Lname FROM persons WHERE ID = %s"
    val = (ID,)
    cursor.execute(sql, val)
    result0 = cursor.fetchall()
    for i in result0:
        print("\nWelcome!", i[0], i[1])
        print()


def main_menu():
    while True:
        option = input(
            """Who are you? :
    1. Responsible
    2. Teacher
    3. Student
    x. exit
    : """)
        if option == "1":
            responsible()

        elif option == "2":
            teacher()
            
        elif option == "3":
            student()
        elif option == "x":
            return


if __name__ == "__main__":
    main_menu()

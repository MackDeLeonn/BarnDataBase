import mysql.connector

# DATABASE CONNECTION
def connect_db():
    return mysql.connector.connect(
        host="localhost",
        user="root",         
        password="your_password",  
        database="EquestrianBarnDB"
    )

# VIEW DATA (OVERVIEW)
def view_students():
    db = connect_db()
    cursor = db.cursor()

    query = """
    SELECT StudentID, FirstName, LastName, RidingLevel, Email
    FROM Students;
    """

    cursor.execute(query)
    results = cursor.fetchall()

    print("\n--- Students Overview ---")
    for row in results:
        print(row)

    db.close()


def view_lessons():
    db = connect_db()
    cursor = db.cursor()

    query = """
    SELECT LessonDate, LessonTime, DurationMinutes
    FROM Lessons;
    """

    cursor.execute(query)
    results = cursor.fetchall()

    print("\n--- Lessons Overview ---")
    for row in results:
        print(row)

    db.close()

# SEARCH FUNCTION
def search_student():
    name = input("Enter student last name to search: ")

    db = connect_db()
    cursor = db.cursor()

    query = """
    SELECT StudentID, FirstName, LastName, RidingLevel
    FROM Students
    WHERE LastName = %s;
    """

    cursor.execute(query, (name,))
    results = cursor.fetchall()

    print("\n--- Search Results ---")
    for row in results:
        print(row)

    db.close()

# ADD DATA
def add_student():
    first = input("First name: ")
    last = input("Last name: ")
    level = input("Riding level: ")
    phone = input("Phone: ")
    email = input("Email: ")
    trainer_id = input("Trainer ID: ")

    db = connect_db()
    cursor = db.cursor()

    query = """
    INSERT INTO Students (FirstName, LastName, RidingLevel, PhoneNumber, Email, TrainerID)
    VALUES (%s, %s, %s, %s, %s, %s);
    """

    cursor.execute(query, (first, last, level, phone, email, trainer_id))
    db.commit()

    print("Student added successfully!")
    db.close()

# UPDATE DATA
def update_student_email():
    student_id = input("Enter Student ID to update: ")
    new_email = input("Enter new email: ")

    db = connect_db()
    cursor = db.cursor()

    query = """
    UPDATE Students
    SET Email = %s
    WHERE StudentID = %s;
    """

    cursor.execute(query, (new_email, student_id))
    db.commit()

    print("Student email updated successfully!")
    db.close()

# DELETE DATA
def delete_student():
    student_id = input("Enter Student ID to delete: ")

    db = connect_db()
    cursor = db.cursor()

    query = "DELETE FROM Students WHERE StudentID = %s;"

    cursor.execute(query, (student_id,))
    db.commit()

    print("Student deleted successfully!")
    db.close()

# MAIN MENU
def menu():
    while True:
        print("\n===== Equestrian Database Menu =====")
        print("1. View Students")
        print("2. View Lessons")
        print("3. Search Student")
        print("4. Add Student")
        print("5. Update Student Email")
        print("6. Delete Student")
        print("7. Exit")

        choice = input("Choose an option: ")

        if choice == "1":
            view_students()
        elif choice == "2":
            view_lessons()
        elif choice == "3":
            search_student()
        elif choice == "4":
            add_student()
        elif choice == "5":
            update_student_email()
        elif choice == "6":
            delete_student()
        elif choice == "7":
            print("Goodbye!")
            break
        else:
            print("Invalid option. Try again.")

# RUN PROGRAM
if __name__ == "__main__":
    menu()

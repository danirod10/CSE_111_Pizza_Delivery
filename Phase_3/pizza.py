import sys
import sqlite3
from sqlite3 import Error

def exit():
    conn.close()
    sys.exit()

def fetchData(sql_string):
    try:
        cur = conn.cursor()
        cur.execute(sql_string)
        data = cur.fetchall()
        return data
    except Error as e:
        print(e)
        return -1

def putData(sql_string):
    try:
        cur = conn.cursor()
        cur.execute(sql_string)
        conn.commit()
        return 1
    except Error as e:
        return -1

def Welcome_Screen():
    print("Welcome to Dani's Pizza!\nEnter your choice:")
    print("1: I am a customer\n2: I am an employee\n3: I am a manager\nq: quit")
    while(True):
        v = input()
        if v == "1":
            Customer_Screen()
        elif v == "2":
            Employee_Screen()
        elif v == "3":
            Manager_Screen()
        elif v == "q":
            exit()
        else:
            print("Invalid option. Please enter a valid choice.\n")


def Customer_Screen():
    print("Please make a selection:")
    print("1: Create new account\n2: Start a new order (existing customer)\n0: back\nq: quit")
    while (True):
        v = input()
        if v == "1":
            Create_Account()
        elif v == "2":
            New_Order()
        elif v == "q":
            exit()
        elif v == "0":
            Welcome_Screen()
        else:
            print("Invalid option. Please enter a valid choice.\n")


def Employee_Screen():
    print("Enter your employee ID or '0' to quit:")
    v = input()
    if v == '0':
        Welcome_Screen()

    # Show all shifts with that employee
    emp_id = v
    sql = "SELECT e_name FROM Employees WHERE emp_id = {}".format(emp_id)
    data = fetchData(sql)
    if (data == -1 or data == []):
        print("Invalid valid employee ID.\n")
        Welcome_Screen()
    emp_name = data[0][0]

    sql = "SELECT s.shift_id, s.s_date, s.start_time, s.end_time FROM SHIFTS AS s WHERE emp_id = {}".format(emp_id)
    data = fetchData(sql)
    # already know this is a valid emp_id from earlier check

    # valid emp_id, print shift data
    print("Shifts for " + emp_name + ":")
    headers = ['Shift ID', 'Date', 'Start Time', 'End Time']
    data.insert(0, headers)
    for row in data:
        print("{: >20} {: >20} {: >20} {: >20}".format(*row))

    print("Enter any key when done: ")
    v = input()
    if v:
        Welcome_Screen()

def Manager_Screen():
    print("Welcome! Please make your selection below.")
    while (True):
        print("1: Add a new employee\n2: Create a new shift\n3: Delete an employee\n0: back\nq: quit")
        v = input()
        if v == "1":
            # add a new employee
            Add_Employee()
        elif v == "2":
            # create a new shift
            Create_Shift()
        elif v == "3":
            # delete an employee
            Delete_Employee()
        elif v == "q":
            exit()
        elif v == "0":
            Welcome_Screen()
        else:
            print("Invalid option. Please enter a valid choice.\n")

def Add_Employee():
    new_emp = []
    prints = ["Enter the new employee id: ", "Enter the employee name: ", "Enter the hourly wage: ", "Enter the employee phone number: "]
    for i in range(4):
        print(prints[i])
        v = input()
        new_emp.append(v)

    sql = "INSERT INTO Employees (emp_id, e_name, hourly_wage, e_phone) VALUES ('{}', '{}', '{}', '{}')".format(new_emp[0], new_emp[1], new_emp[2], new_emp[3])
    data = putData(sql)
    if (data == -1): # Error
        print("Unable to add the new employee. Please try again.\n")
        Manager_Screen()
    print("Successfully added new employee.\n")
    Manager_Screen()


def Create_Shift():
    new_shift = []

    # get the next shift id we can use for the new shift
    shift_id = 0
    sql = "SELECT MAX(shift_id) FROM Shifts"
    data = fetchData(sql)
    if (data == -1 or data == []):
        shift_id = 1
    shift_id = data[0][0] + 1

    prints = ["Enter the employee ID: ", "Enter the new shift date: ", "Enter the shift start time: ",
              "Enter the shift end time: "]
    new_shift = [shift_id] # shift id, emp_id, date, start, end
    for i in range(4):
        print(prints[i])
        v = input()
        if i==0:
            new_shift.append(int(v))
            continue
        new_shift.append(v)

    sql = "INSERT INTO Shifts (shift_id, emp_id, start_time, s_date, end_time) VALUES ({}, {}, '{}', '{}', '{}')".format(
        new_shift[0], new_shift[1], new_shift[3], new_shift[2], new_shift[4])
    #print(sql)
    data = putData(sql)
    if (data == -1):  # Error
        print("Unable to add the new shift. Please try again.\n")
        Manager_Screen()
    print("Successfully added new shift.\n")
    Manager_Screen()

def New_Order():
    # customer tells us who they are by phone number
    print("Please sign in by entering your phone number: ")
    v = input()
    sql = "SELECT * FROM Customers WHERE c_phone = '{}'".format(v)
    data = fetchData(sql)
    if (data == -1 or data == []):
        print("No such customer exists. Please create an account.\n")
        Customer_Screen()

    # get cust name
    cust_name = data[0][1]
    print("Welcome, "+cust_name+ "! Menu: ")

    # get cust id
    cust_id = data[0][0]

    # display all menu items from db
    menu_prices = {} # key=item id, val = price
    sql = "SELECT * FROM Menu_item"
    data = fetchData(sql)
    if (data == -1 or data == []):
        print("An error occurred. Please try again.")
        Customer_Screen()
    # reached here, no error, print the data
    headers = ['Item Number', 'Description', 'Price']
    data.insert(0, headers)
    for row in data:
        menu_prices[row[0]] = row[2]
        print("{: >20} {: >150} {: >20}".format(*row))
    # save valid menu item numbers
    valid_item_numbers = []
    for i, row in enumerate(data):
        valid_item_numbers.append(row[0])

    order = []
    order_prices = []
    print("Please enter an Item Number to add to your order or f to finish adding items: ")
    while(True): # Allow customers to enter as many selections as they want
        print("Item Number: ")
        item = input()
        if item == 'f':
            break
        # check to make sure the item number the customer entered is a valid menu item id
        if int(item) not in valid_item_numbers:
            print("Invalid menu item number. Please try again.")
            Customer_Screen()
        order.append(item)
        order_prices.append(menu_prices[int(item)])

    print("Please enter a delivery date (YYYY-MM-DD): ")
    d_date = input()
    print("Please enter a delivery time(HH:MM): ")
    d_time = input()

    # send order to db
    # get the next order number we can use for this order
    order_id = 0
    sql = "SELECT MAX(order_id) FROM Orders"
    data = fetchData(sql)
    if (data == -1 or data == []):
        order_id = 1
    order_id = data[0][0] + 1

    sql = "INSERT INTO Orders (order_id, cust_id, delivery_time, delivery_date) VALUES ({}, {}, '{}', '{}')".format(
        order_id, cust_id, d_time, d_date)
    #print(sql)
    data = putData(sql)
    if (data == -1):  # Error
        print("Unable to submit the order. Please try again.\n")
        Customer_Screen()

    # now enter ordered items into Ordered_items table
    for item_id in order:
        sql = "INSERT INTO Ordered_items (order_id, item_id) VALUES ({}, {})".format(order_id, item_id)
        data = putData(sql)
        if (data == -1):
            print("Error adding an ordered item.")

    print("Thank you for your order! Your total is:", sum(order_prices))
    Welcome_Screen()


def Create_Account():
    # Make sure we have a good address!
    cust_info = []
    d = {0:"Please enter your name: ", 1:"Please enter your address: ", 2:"Please enter your phone number: "}

    for i in range(3):
        print(d[i])
        v = input()
        cust_info.append(v)

    # check that customer doesn't already exist in the Customers table by phone number
    sql = "SELECT cust_id FROM Customers WHERE c_phone = {}".format(cust_info[2])
    data = fetchData(sql)
    if (data == -1):
        print("Error: Customer already exists.")
        Customer_Screen()

    # get the next customer id we can use for this customer
    cust_id = 0
    sql = "SELECT MAX(cust_id) FROM Customers"
    data = fetchData(sql)
    if (data == -1 or data == []):
        print("An error occurred. Please try again.")
        Customer_Screen()
    cust_id = data[0][0] + 1

    # now we have customer info, create a new entry in customers table, say "thanks for signing up"
    sql = "INSERT INTO Customers (cust_id, c_name, c_address, c_phone) VALUES ({}, '{}', '{}', {})".format(cust_id, cust_info[0], cust_info[1], cust_info[2])
    data = putData(sql)
    if (data == -1):
        print("Error: unable to add customer.")
        Customer_Screen()
    print("Sign up successful. Thank you for signing up!\n")
    Customer_Screen()

def Delete_Employee():
    # Show all employees
    sql = "SELECT * FROM Employees"
    data = fetchData(sql)
    if (data == -1 or data == []):
        print("Error: No employees to display. Please try again.")
        Manager_Screen()

    # grab each employee id
    emp_ids = []
    for row in data:
        emp_ids.append(row[0])
    #print(emp_ids)

    print("All Dani's Pizza Employees: ")
    headers = ['Employee ID', 'Name', 'Hourly Wage', 'Phone']
    data.insert(0, headers)
    for row in data:
        print("{: >20} {: >40} {: >20} {: >20}".format(*row))

    print("Please enter the Employee ID to delete or 0 to quit: ")
    v = input()

    # check that v is an integer
    try:
        v = int(v)
    except:
        print("Invalid employee ID. Please try again.")
        Manager_Screen()

    # check that v is an employee id in our employee table
    if v == 0:
        Manager_Screen()
    elif v not in emp_ids:
        print("Invalid employee ID. Please try again. HERE")
        Manager_Screen()
    else: # v is in emp_ids
        sql = "DELETE FROM Employees WHERE emp_id = {}".format(int(v))
        data = putData(sql)
        if data == 1:
            print("Successfully deleted employee.")
            # will return to Manager Screen
        else:
            print("Unable to delete employee "+v+". Please try again.")
            Manager_Screen()


def main():
    Welcome_Screen()

conn = sqlite3.connect('pizza.db')
main()
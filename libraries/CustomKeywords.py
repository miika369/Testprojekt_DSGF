import os
from dotenv import load_dotenv
import mysql.connector

# Used to load variables from .env file
load_dotenv()

# Custom keyword to save purchase results into the database.
def save_purchase_to_database(user, product="N/A", price="0.00", status="Failed"):
    connection = None

    try:
        # Connect to the SQL database
        connection = mysql.connector.connect(
            host=os.getenv("DB_HOST"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            database=os.getenv("DB_NAME")
        )

        # Create a cursor to execute SQL commands
        cursor = connection.cursor()

        # Prepare SQL query to insert data
        query = "INSERT INTO purchase_results (user, product, price, status) VALUES (%s, %s, %s, %s)"
        values = (user, product, price, status)

        # Execute the query and run commit to make it a permanent change
        cursor.execute(query, values)
        connection.commit()

        print(f"Success: Logged result for {user}")

    except mysql.connector.Error as error:
        # Log database errors 
        print(f"Error: {error}")


    finally:
        # Make sure that the cursor and the connection are always closed
        if connection and connection.is_connected():
            cursor.close()
            connection.close()

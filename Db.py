import os
import pymysql

# Database connection parameters
db_user = os.environ.get('icon')
db_password = os.environ.get('icon')
db_name = os.environ.get('iconDb')
db_connection_name = os.environ.get('icon-422417:us-central1:icon')


def open_connection():
    """
    Open a connection to the MySQL database.
    """
    unix_socket = '/cloudsql/{}'.format(db_connection_name)
    try:
        if os.environ.get('GAE_ENV') == 'standard':
            conn = pymysql.connect(user=db_user,
                                   password=db_password,
                                   unix_socket=unix_socket,
                                   db=db_name,
                                   cursorclass=pymysql.cursors.DictCursor)
            return conn
    except pymysql.MySQLError as e:
        print(e)


def get_users():
    """
    Retrieve all users from the Users table.
    """
    conn = open_connection()
    with conn.cursor() as cursor:
        cursor.execute('SELECT * FROM Users;')
        users = cursor.fetchall()
    conn.close()
    return users


def get_icons():
    """
    Retrieve all icons from the Icon table.
    """
    conn = open_connection()
    with conn.cursor() as cursor:
        cursor.execute('SELECT * FROM Icon;')
        icons = cursor.fetchall()
    conn.close()
    return icons


def get_publications():
    """
    Retrieve all publications from the Publication table.
    """
    conn = open_connection()
    with conn.cursor() as cursor:
        cursor.execute('SELECT * FROM Publication;')
        publications = cursor.fetchall()
    conn.close()
    return publications


def get_user_interactions():
    """
    Retrieve all user interactions from the UserInteraction table.
    """
    conn = open_connection()
    with conn.cursor() as cursor:
        cursor.execute('SELECT * FROM UserInteraction;')
        user_interactions = cursor.fetchall()
    conn.close()
    return user_interactions


def get_search_filters():
    """
    Retrieve all search filters from the SearchFilter table.
    """
    conn = open_connection()
    with conn.cursor() as cursor:
        cursor.execute('SELECT * FROM SearchFilter;')
        search_filters = cursor.fetchall()
    conn.close()
    return search_filters


def get_awards():
    """
    Retrieve all awards from the Awards table.
    """
    conn = open_connection()
    with conn.cursor() as cursor:
        cursor.execute('SELECT * FROM Awards;')
        awards = cursor.fetchall()
    conn.close()
    return awards

import psycopg2

class SQL:

    def getConfig(self, database="postgres", user="postgres", password="postgres", host="localhost", port=5432):
        """
        Function to get database configuration. Defaults to PostgreSQL configuration
        """
        return {
            "database": database,
            "user": user,
            "password": password,
            "host": host,
            "port": port
        }

    def getConnection(self, db_config):
        """Function to get a database connection."""
        return psycopg2.connect(**db_config)

try:
    # Establish connection
    sql = SQL()
    db_config = sql.getConfig()
    with sql.getConnection(db_config) as connection:
        print("Connection successful.....")
        with connection.cursor() as cursor:
            cursor.execute("SELECT version();")
            version = cursor.fetchone()[0]
            database = str(version).split(" ")
            print(f"Database = {database[0]} {database[1]}")
        # ...you can add CRUD operations here...
except Exception as e:
    print("Error connecting to database:", e)
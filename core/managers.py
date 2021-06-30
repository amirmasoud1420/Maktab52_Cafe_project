from abc import ABC, abstractmethod
from psycopg2 import connect
from psycopg2._psycopg import connection, cursor


class BaseManager(ABC):
    @abstractmethod
    def create(self, obj):
        pass

    @abstractmethod
    def read(self):
        pass

    @abstractmethod
    def update(self):
        pass

    @abstractmethod
    def delete(self):
        pass


class DataBaseManager(BaseManager):
    def __init__(self, table_name):
        self.conn: connection = connect("dbname='Cafe' host='localhost' user='postgres' password='am14201378'")
        self.curs: cursor = self.conn.cursor()
        self.table_name = table_name

    def __del__(self):
        self.conn.close()

    def create(self, obj):
        pass

    def read(self):
        pass

    def update(self):
        pass

    def delete(self):
        pass

    def close(self):
        self.conn.close()

    def open(self):
        self.conn: connection = connect("dbname='Cafe' host='localhost' user='postgres' password='am14201378'")
        self.curs: cursor = self.conn.cursor()

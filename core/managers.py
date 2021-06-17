from abc import ABC, abstractmethod
from psycopg2 import connect
from psycopg2._psycopg import connection, cursor


class BaseManager(ABC):
    @abstractmethod
    def create(self, obj):
        pass

    @abstractmethod
    def read(self, id):
        pass

    @abstractmethod
    def update(self, obj1, obj2):
        pass

    @abstractmethod
    def delete(self, id):
        pass


class DataBaseManager(BaseManager):
    def __init__(self, table_name):
        self.conn: connection = connect("dbname='Cafe' host='localhost' user='postgres' password='am14201378'")
        self.curs: cursor = self.conn.cursor()
        self.table_name = table_name

    def create(self, id):
        pass

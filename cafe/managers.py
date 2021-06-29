from core.managers import *
from cafe.models import *

from core.managers import *
from user.models import *


class TableManager(DataBaseManager):
    def __init__(self):
        super(TableManager, self).__init__('"table"')

    def create(self, t: Table):
        self.curs.execute(
            f"INSERT INTO {self.table_name}(number,position,status) VALUES ({t.number},'{t.position}',{t.status})"
        )
        self.conn.commit()

    def read(self, number):
        self.curs.execute(
            f"select * from {self.table_name} where number={number}")
        table = self.curs.fetchone()
        if table:
            t = Table(table[1], table[2], table[3])
            t.id = table[0]
            return t
        else:
            return False

    def update(self, number, col, val):
        self.curs.execute(
            f"update {self.table_name} set {col}='{val}' where number={number}"
        )
        self.conn.commit()

    def delete(self, number):
        self.curs.execute(
            f"delete from {self.table_name} where number={number}"
        )
        self.conn.commit()


class CategoryManager(DataBaseManager):
    def __init__(self):
        super(CategoryManager, self).__init__('"category"')

    def create(self, c: Category):
        self.curs.execute(
            f"INSERT INTO {self.table_name}(name) VALUES ('{c.name}')"
        )
        self.conn.commit()

    def read(self, name):
        try:
            self.curs.execute(
                f"select * from {self.table_name} where name='{name}'")
            category = self.curs.fetchone()

            c = Category(category[1])
            c.id = category[0]
            return c
        except:
            return False

    def update(self, name, col, val):
        self.curs.execute(
            f"update {self.table_name} set {col}='{val}' where name='{name}'"
        )
        self.conn.commit()

    def delete(self, name):
        self.curs.execute(
            f"delete from {self.table_name} where name='{name}'"
        )
        self.conn.commit()

class MenuItemManager(DataBaseManager):
    def __init__(self):
        super(MenuItemManager, self).__init__('"menu_item"')

    def create(self, m: MenuItem):
        cm = CategoryManager()
        category = cm.read(m.category.name)
        if category:
            c_id = category.id
        else:
            cm.create(m.category)
            c_id = cm.read(m.category.name).id

        self.curs.execute(
            f"INSERT INTO {self.table_name}(name,price,discount,serving_time_period,estimate_cooking_time,category_id) VALUES ('{m.name}',{m.price},{m.discount},{m.serving_time_period},{m.estimated_cooking_time},{c_id})"
        )
        self.conn.commit()

    def read(self, number):
        self.curs.execute(
            f"select * from {self.table_name} where number={number}")
        table = self.curs.fetchone()
        if table:
            return Table(table[1], table[2], table[3])
        else:
            return False

    def update(self, number, col, val):
        self.curs.execute(
            f"update {self.table_name} set {col}='{val}' where number={number}"
        )
        self.conn.commit()

    def delete(self, number):
        self.curs.execute(
            f"delete from {self.table_name} where number={number}"
        )
        self.conn.commit()

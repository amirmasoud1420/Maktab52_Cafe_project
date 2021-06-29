from core.models import *


class Table(BaseTable):
    def __init__(self, number, position, status=0):
        self.number = number
        self.position = position
        self.status = status
        self.table_name = '"table"'


class Category(BaseCategory):
    def __init__(self, name):
        self.name = name


class MenuItem(BaseMenuItem):
    def __init__(self, name, price, category: Category, serving_time_period, estimated_cooking_time, discount=0):
        self.name = name
        self.price = price
        self.category = category
        self.discount = discount
        self.serving_time_period = serving_time_period
        self.estimated_cooking_time = estimated_cooking_time
        self.table_name = 'menu_item'


class Order(BaseOrder):
    def __init__(self, table, number, status, time_stamp, menu_items):
        self.table = table
        self.menu_items = menu_items
        self.number = number
        self.status = status
        self.time_stamp = time_stamp
        self.table_name = 'order'


class Receipt(BaseReceipt):
    def __init__(self, order, total_price, final_price, time_stamp):
        self.order = order
        self.total_price = total_price
        self.final_price = final_price
        self.time_stamp = time_stamp
        self.table_name = 'receipt'

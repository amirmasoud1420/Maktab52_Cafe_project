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
    def __init__(self, table, number, status, menu_items):
        self.table = table
        self.menu_items = menu_items  # [(menu_item,quantity),(menu_item,quantity),...]
        self.number = number
        self.status = status
        self.date_time_stamp = date.today()
        self.time_time_stamp = time(hour=datetime.now().hour, minute=datetime.now().minute, second=datetime.now().second)
        self.table_name = 'order'


class Receipt(BaseReceipt):
    def __init__(self, order, total_price, final_price):
        self.order = order
        self.total_price = total_price
        self.final_price = final_price
        self.date_time_stamp = date.today()
        self.time_time_stamp = time(hour=datetime.now().hour, minute=datetime.now().minute, second=datetime.now().second)
        self.table_name = 'receipt'

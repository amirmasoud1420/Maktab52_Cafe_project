from my_flask.app_import import *
from cafe.models import *
from cafe.managers import *
from datetime import timedelta
from cafe.utility import *


def page_content():
    if request.method == 'POST':
        name = request.form.get('name')
        if name == 'cashier_order_list':
            number = int(request.form.get('number'))
            status = int(request.form.get('status'))
            om = OrderManager()
            om.update(number, 'status', status)

            rm = ReceiptManager()
            if status == 3:
                order = om.read(number)
                receipt = Receipt(order, 10)
                rm.create(receipt)
            elif status == -1:
                order = om.read(number)
                receipt = Receipt(order, 0)
                rm.create(receipt)
            om.close()
            rm.close()
    else:
        name = request.args.get('name')
    if name == 'cashier_order_list':
        om = OrderManager()
        orders = om.read_all()
        om.close()
        new_orders = []
        cooking_orders = []
        served_orders = []
        paid_orders = []
        deleted_orders = []
        if not orders:
            orders = []
        else:
            for i in orders:
                if i.status == 0:
                    new_orders.append(i)
                elif i.status == 1:
                    cooking_orders.append(i)
                elif i.status == 2:
                    served_orders.append(i)
                elif i.status == 3:
                    paid_orders.append(i)
                elif i.status == -1:
                    deleted_orders.append(i)
        print(orders)
        return render_template(name + '.html', new_orders=new_orders, cooking_orders=cooking_orders,
                               served_orders=served_orders, paid_orders=paid_orders, deleted_orders=deleted_orders)
    if name == 'receipt':
        rm = ReceiptManager()
        receipts = rm.read_all()
        rm.close()
        new_receipts = get_news(receipts)
        paid_receipt = []
        deleted_receipt = []
        for i in receipts:
            if i.order.status == -1:
                deleted_receipt.append(i)
            elif i.order.status == 3:
                paid_receipt.append(i)
        paid_receipt = sort_receipt(paid_receipt)
        deleted_receipt = sort_receipt(deleted_receipt)
        return render_template('receipt.html', paid_receipt=paid_receipt, deleted_receipt=deleted_receipt,
                               new_receipts=new_receipts)
    return redirect(url_for('login'))

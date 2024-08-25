params = [
    {
        'title': 'Заказы',
        'table_name': 'orders',
        'columns': ('Id', 'Comment', 'Burn Date', 'Close Date', 'Client Id', 'Courier Id', 'Storage Id'),
        'sort': [str, str, str, int, int, int],
        'column_width': [110, 230, 300, 140, 140, 180, 180],
        'bd_columns': ['order_id', 'order_comment', 'order_burndate', 'order_closedate', 'client_id', 'courier_id', 'storage_id']
    },
    {
        'title': 'Продукты',
        'table_name': 'products',
        'columns': ('Id', 'Name', 'Weight', 'Burn Date', 'Out Date', 'Price'),
        'sort': [str, float, str, str, int],
        'column_width': [110, 280, 250, 180, 110, 170],
        'bd_columns': ['product_id', 'product_name', 'product_weight', 'product_burndate', 'product_outdate', 'product_prise']
    },
    {
        'title': 'Курьер',
        'table_name': 'courier',
        'columns': ('Id', 'Name', 'Phone', 'Status', 'Storage Id'),
        'sort': [str, str, str, int],
        'column_width': [90, 400, 200, 200, 70],
        'bd_columns': ['courier_id', 'courier_name', 'courier_phone', 'courier_status', 'storage_id']

    },
    {
        'title': 'Пакет',
        'table_name': 'packet',
        'columns': ('Id', 'Weight', 'Sum', 'Order Id'),
        'sort': [float, int, int],
        'column_width': [110, 100, 100, 100],
        'bd_columns': ['packet_id', 'packet_weight', 'packet_sum', 'order_id']

    },
    {
        'title': 'Продукты пакета',
        'table_name': 'packet_products',
        'columns': ('Packet Id', 'Product Count', 'Product Id', 'Storage Id'),
        'sort': [int, int, int],
        'column_width': [110, 100, 100, 100],
        'bd_columns': ['packet_id', 'product_count', 'product_id', 'storage_id']
    },
    {
        'title': 'Склады',
        'table_name': 'storages',
        'columns': ('Id', 'Storage Phone'),
        'sort': [str],
        'column_width': [110, 200],
        'bd_columns': ['storage_id', 'storage_phone']
    },
    {
        'title': 'Продукты склада',
        'table_name': 'storages_products',
        'columns': ('Storage Id', 'Product Id', 'Product Count'),
        'sort': [int, int],
        'column_width': [100, 100, 100],
        'bd_columns': ['storage_id', 'product_id', 'product_count']
    },
    {
        'title': 'Адрес клиента',
        'table_name': 'client_address',
        'columns': ('Client Id', 'Address Id'),
        'sort': [str],
        'column_width': [110, 110],
        'bd_columns': ['client_id', 'address_id']
    },
    {
        'title': 'Клиент',
        'table_name': 'client',
        'columns': ('Client Id', 'Client Phone'),
        'sort': [str],
        'column_width': [110, 200],
        'bd_columns': ['client_id', 'client_phone']
    },
    {
        'title': 'Адрес',
        'table_name': 'address',
        'columns': ('Id', 'Street', 'House', 'Entry', 'Floor', 'Flat', 'Delivery Time', 'Back Time', 'Storage Id'),
        'sort': [str, int, int, int, int, int, int, int],
        'column_width': [110, 200, 100, 100, 100, 100, 100, 100],
        'bd_columns': ['address_id', 'address_street', 'address_house', 'address_entry', 'address_floor', 'address_flat', 'address_deliverytime', 'address_backtime', 'storage_id']
    },
]
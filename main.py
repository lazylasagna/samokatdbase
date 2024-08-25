from customtkinter import *
from CTkTable import *
from tkinter import *
from tkinter import ttk
from PIL import ImageTk, Image
from req import *
import tkinter.messagebox as mb
from params import params
import warnings

warnings.filterwarnings("ignore")

app = CTk()
app.resizable(0, 0)
app.title("Самокат")

set_appearance_mode("light")
x, y = (app.winfo_screenwidth() // 2 - 1070 // 2) + 50, (app.winfo_screenheight() // 2 - 700 // 2)
app.geometry(f'{1070}x{700}+{x}+{y}')

color = '#ff335f'
col = '#fe4870'
bgcol = '#fe7190'
app.configure(fg_color=col)

tree = CTkTable(master=app)
ttktree = ttk.Treeview()
newbtn = CTkButton(master=app)

def on_entry_change(*args):
    filter_text = entry_var.get().lower()
    if filter_text != '':
        newvalues = [(dic['columns'])]
    else:
        newvalues = []
    for item in data:
        if any(str(i).lower().startswith(filter_text) for i in
               item):
            newvalues.append(item)
    tree.configure(values=newvalues)
    tree.values = newvalues
    for row in ttktree.get_children():
        ttktree.delete(row)
    for dat in tree.values[1:]:
        ttktree.insert("", END, values=dat)


global filter_id
filter_id = None


def schedule_filter(*args):
    global filter_id
    if filter_id is not None:
        app.after_cancel(filter_id)
    filter_id = app.after(1000, on_entry_change)


def button_click(dict):
    global title
    title.configure(text=dict['title'])
    for widget in table_frame.winfo_children():
        widget.destroy()
    create_table(dict)


def inp(*args):
    global dict
    global dic

    name = dic['table_name']
    column = dic['bd_columns'][args[0][0]['column']]
    id_ = tree.values[args[0][0]['row']][0]
    idn = dic['bd_columns'][0]

    toplevel_window = CTkToplevel()
    toplevel_window.title(f"Edit {dic['columns'][args[0][0]['column']].lower()}")
    x, y = (app.winfo_screenwidth() // 2 - 650 // 2) + 100, (app.winfo_screenheight() // 2 - 150 // 2)
    toplevel_window.geometry(f'{650}x{150}+{x}+{y}')
    toplevel_window.grab_set()
    main_view = CTkFrame(master=toplevel_window)
    main_view.pack(expand=True, fill=BOTH)
    entry = CTkEntry(master=main_view, border_color=color, border_width=1, width=400)
    entry.pack(pady=30)
    entry.insert(0, args[0][0]['value'])

    def update():
        value = entry.get()
        if update_by_name(name, column, value, id_, idn):
            toplevel_window.destroy()
            button_click(dic)

    def delete_row():
        confirmation = mb.askyesno("Подтверждение", "Вы уверены, что хотите удалить строку?")
        if not confirmation:
            return
        del_by_index(name, id_, idn)

    frame1 = CTkFrame(master=main_view, fg_color='transparent')
    frame1.pack()
    CTkButton(master=frame1, text="Edit", fg_color='#df7289', border_color=color, hover_color=color,
              border_width=2, width=110, command=update, height=27).pack(side='left', padx=20)
    CTkButton(master=frame1, text="Delete Row", fg_color='#df7289', border_color=color, hover_color=color,
              border_width=2, width=110, command=delete_row, height=27).pack(side='left', padx=20)
    CTkButton(master=frame1, text="Cancel", fg_color='#df7289', border_color=color, hover_color=color,
              border_width=2, width=110, command=toplevel_window.destroy, height=27).pack(side='left', padx=20)


def create_table(dict):
    global dic
    global data
    global sort
    global newbtn
    newbtn.destroy()
    rev = [False] * len(dict['columns'])

    if dict['title'] != 'Заказы':
        newbtn = CTkButton(master=title_frame, text="+", font=("Arial Black", 15), text_color="#fff", fg_color=col,
                           hover_color=color, width=40, command=new)
        newbtn.pack(padx=(15, 5), pady=(5, 0), anchor="nw", side="left", fill=None)

    def sort(col, reverse, key=str):
        m = [(ttktree.set(k, col), k) for k in ttktree.get_children()]
        try:
            m.sort(reverse=reverse, key=lambda t: key(t[0]))
        except Exception:
            delete = []
            for i in ttktree.get_children():
                if ttktree.item(i)['values'][col] in ['', ' ', 'None']:
                    delete.append({
                        'column': i,
                        'values': ttktree.item(i)['values']
                    })
            for i in delete:
                ttktree.delete(i['column'])
            m = [(ttktree.set(k, col), k) for k in ttktree.get_children()]
            m.sort(reverse=reverse, key=lambda t: key(t[0]))
            for i in delete:
                ttktree.insert('', 'end', values=i['values'])

        for index, (_, k) in enumerate(m):
            ttktree.move(k, "", index)
        rev[col] = not rev[col]
        ttktree.heading(col, command=lambda: sort(col, not reverse, key=key))

    columns = dict['columns'][1:]

    def p(dict, column):
        for row in ttktree.get_children():
            ttktree.delete(row)
        for data in tree.values[1:]:
            ttktree.insert("", END, values=data)
        sort(column, rev[column], dict['sort'][column])
        s = ttktree.get_children("")
        ss = [columns]
        for element in s:
            ss.append(ttktree.item(element)['values'])
        tree.configure(values=ss)

    table_data = [columns] + get_by_name(dict['table_name'], dict['bd_columns'])
    ttktree = ttk.Treeview(master=table_frame, columns=dict['columns'][1:], show="headings", selectmode="browse")
    for row in ttktree.get_children():
        ttktree.delete(row)
    for column in dict['columns'][1:]:
        ttktree.heading(column, text=column, command=lambda: sort(dict['columns'].index(column), False,
                                                                  key=dict['sort'][dict['columns'].index(column)]))
    for data in table_data[1:]:
        ttktree.insert("", END, values=data)
    global tree

    tree = CTkTable(master=table_frame, values=table_data, header_color='#fe95ac', hover_color="#df7289",
                    wraplength=220, anchor="W",
                    command=lambda *args: p(dict, args[0]['column']) if args[0]['row'] < 1 else inp(args))

    tree.edit_row(0, text_color="#fff", hover_color=color)
    for width in dict['column_width'][1:]:
        tree.edit_column(dict['column_width'][1:].index(width), width=width)
    tree.pack(expand=True)
    data = tree.values
    dic = dict
    data = tree.values
    # p(dict, 0)
    # tree.delete_column(0)
    if dic['title'] == 'Заказы':
        numlabel.configure(text=str(len(tree.values)))


def new():
    def add_to_bd(arr):
        values = [i.get() for i in arr]
        if add_by_name(dic['table_name'], dic['bd_columns'], values):
            toplevel_window.destroy()
            button_click(dic)

    global dict
    global dic
    dict = dic
    toplevel_window = CTkToplevel()
    toplevel_window.title(f"Add new row")
    x, y = (app.winfo_screenwidth() // 2 - 400 // 2) + 100, (
            app.winfo_screenheight() // 2 - (50 * len(dict['columns'][1:]) + 50) // 2)
    toplevel_window.geometry(f'{400}x{50 * len(dict['columns'][1:]) + 50}+{x}+{y}')
    toplevel_window.grab_set()
    main_view = CTkFrame(master=toplevel_window)
    main_view.pack_propagate(False)
    main_view.pack(fill=BOTH, expand=1)

    x = 25

    for column in dict['columns'][1:]:
        entry = CTkEntry(master=main_view, border_color=color, border_width=1, width=200, placeholder_text=column)
        entry.pack(pady=(x, 0))
        x = x % 15
    button = CTkButton(master=main_view, text="Add", fg_color='#df7289', border_color=color, hover_color=color,
                       border_width=2, width=100,
                       command=lambda arr=list(main_view.children.values())[1:]: add_to_bd(arr))
    button.pack(pady=10)


sidebar_frame = CTkFrame(app, fg_color="#fff", height=250, corner_radius=0)
sidebar_frame.pack(fill="x", anchor="n", side="top")

image_frame = CTkFrame(sidebar_frame, fg_color='#fff')
image_frame.pack(anchor='nw')

image = ImageTk.PhotoImage(
    Image.open(r'pic.png'))
label1 = CTkLabel(image_frame, image=image, text='', anchor='w', height=0)
label1.pack(anchor='nw', side='left', pady=10, padx=(10, 0))


def combobox_callback(*args):
    index = next((i for i, d in enumerate(params) if d.get('title') == args[0]), -1)
    button_click(params[index])


combobox = CTkComboBox(master=image_frame, button_color=col, button_hover_color=col, width=150,
                       values=[d['title'] for d in params],
                       command=lambda *args: combobox_callback(*args))
combobox.pack(padx=0, pady=15, anchor='nw')
combobox.set("Заказы")

main_view = CTkFrame(master=app, width=1070, height=700, corner_radius=0, fg_color=bgcol)
main_view.pack_propagate(False)
main_view.pack(side="left")

title_frame = CTkFrame(master=main_view, fg_color="transparent")
title_frame.pack(anchor="n", fill="x", padx=27, pady=(29, 0))

title2_frame = CTkFrame(master=main_view, fg_color="transparent")

title = CTkLabel(master=title_frame, text="Заказы", font=("Arial Black", 25), text_color='#fff')
title.pack(anchor="nw", side="left")


orders_metric = CTkFrame(master=title_frame, fg_color=col, width=200, height=63)
orders_metric.grid_propagate(0)
orders_metric.pack(anchor="ne", side='right', pady=0)

logitics_img_data = Image.open(r"logistics_icon.png")
logistics_img = CTkImage(light_image=logitics_img_data, dark_image=logitics_img_data, size=(43, 43))

CTkLabel(master=orders_metric, image=logistics_img, text="").grid(row=0, column=0, rowspan=2, padx=(12, 5), pady=10)

CTkLabel(master=orders_metric, text="Заказов:", text_color="#fff", font=("Arial Black", 15)).grid(row=0, column=1,
                                                                                                  sticky="sw")
numlabel = CTkLabel(master=orders_metric, text='0', text_color="#fff", font=("Arial Black", 15), justify="left")
numlabel.grid(row=1, column=1, sticky="nw", pady=0)

search_container = CTkFrame(master=main_view, height=50, fg_color="transparent")
search_container.pack(fill="x", padx=27, pady=0, side='top')

entry_var = StringVar()
entry_var.trace_add('write', lambda *args: schedule_filter())

entry = CTkEntry(master=search_container, width=305, placeholder_text="Поиск", border_color=color,
                 border_width=2, placeholder_text_color='black', textvariable=entry_var)
entry.pack(anchor='nw', pady=0, padx=(0, 0))

# newbtn = CTkButton(master=title_frame, text="+", font=("Arial Black", 15), text_color="#fff", fg_color=col,
#                    hover_color=color, width=40, command=new)
# newbtn.pack(padx=(15, 5), pady=(5, 0), anchor="nw", side="left", fill=None)

table_frame = CTkScrollableFrame(master=main_view, fg_color="transparent", scrollbar_button_color='#ffccd8',
                                 scrollbar_button_hover_color='#eaa9b8')
table_frame.pack(expand=True, fill="both", padx=27, pady=21)

create_table(params[0])

app.mainloop()

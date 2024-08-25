from contextlib import closing
import tkinter.messagebox as mb
import psycopg2
user = ''
password = ''
host = ''
dbname = ''

def get_by_name(name, columns):
    l = ''
    for column in columns[1:]:
        l += column + ', '
    with closing(psycopg2.connect(dbname=dbname, user=user,
                                  password=password, host=host)) as conn:
        with conn.cursor() as cursor:
            try:
                cursor.execute(f'SELECT {l[:-2]} FROM {name}')
                return cursor.fetchall()
            except Exception as e:
                print(e)


def add_by_name(name, columns, values):
    l = '%s, ' * len(values)
    s = ''
    i = 0
    for column in columns[1:]:
        if values[i] == '':
            values[i] = None
        i += 1
        s += column + ', '
    with closing(psycopg2.connect(dbname=dbname, user=user,
                                  password=password, host=host)) as conn:
        with conn.cursor() as cursor:
            try:
                cursor.execute(f'Insert Into {name}({s[:-2]}) '
                               f'VALUES ({l[:-2] + ')'}',
                               (values[:]))
                conn.commit()
                cursor.execute(f'SELECT * FROM {name}')
                result = cursor.fetchall()
                mb.showinfo('Успешно', 'Успешно добавлено')
                return result
            except Exception as e:
                # print(e)
                conn.rollback()
                mb.showerror("Ошибка", f'Произошла ошибка: {str(e)}')
                return False

def update_by_name(name, column, value, id, idn):
    with closing(psycopg2.connect(dbname=dbname, user=user,
                                  password=password, host=host)) as conn:
        with conn.cursor() as cursor:
            try:
                cursor.execute(f'Update {name} '
                               f"Set {column} = '{value}' "
                               f'Where {idn} = {id}')
                conn.commit()
                cursor.execute(f'SELECT * FROM {name}')
                result = cursor.fetchall()
                mb.showinfo('Успешно', 'Успешно изменено')
                return result
            except Exception as e:
                conn.rollback()
                mb.showerror("Ошибка", f'Произошла ошибка: {str(e)}')
                return False

def del_by_index(name, index, idn):
    with closing(psycopg2.connect(dbname=dbname, user=user,
                                  password=password, host=host)) as conn:
        with conn.cursor() as cursor:
            try:
                cursor.execute(f'Delete from {name} '
                               f'where {idn} = {index}')
                conn.commit()
                cursor.execute(f'SELECT * FROM {name}')
                result = cursor.fetchall()
                mb.showinfo('Успешно', 'Успешно удалено')
                return result
            except Exception as e:
                conn.rollback()
                mb.showerror("Ошибка", f'Произошла ошибка: {str(e)}')
                return False

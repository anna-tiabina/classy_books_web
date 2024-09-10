from flask import Flask
from flask import render_template
from flask import request

import sqlite3



app = Flask(__name__)

def data_extraction(ml_id):
    connection = sqlite3.connect('my_database.db')
    cursor = connection.cursor()
    if ml_id == 1:
        cursor.execute('SELECT book, link FROM Books WHERE id = 1')
    elif ml_id == 2:
        cursor.execute('SELECT book, link FROM Books WHERE id = 2')

    table_data = cursor.fetchall()
    connection.close()
    return table_data





@app.route('/')
def index():
    return render_template('index_2.html')

@app.route('/page2')
def page2():
    return render_template('page2.html')

@app.route('/contacts')
def contacts():
    return render_template('contacts.html')


@app.route('/page3', methods=['GET', 'POST'])
def page3():
    server_message = ''
    client_message = ''
    if request.method == 'POST':
        
        option = request.form.get('option')
        option1 = request.form.get("option1")
        f = open("answ.txt", "w")
        vector = str(option)+str(option1)
        f.write(vector)
        f.close()
	#choose book via ML: book_name = get_recommednded_book(vector)
        ml_id = 1
        book_data = data_extraction(ml_id)
        
	# go to the book's page:
        return result(book_data)
    return render_template('page3.html', message=server_message)


@app.route('/result/<book>') 
def result(book_data):
    for row in book_data:
        book_name = row[0]
        book_link = f"{row[1]}"
    return render_template('CP.html', book_link=book_link, book_name=book_name)





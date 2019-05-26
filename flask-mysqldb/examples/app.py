from flask import Flask
from flask import request
from flask import session
from flask import redirect
from flask import url_for
from flask import abort
from flask import render_template
from flask import flash
from flask_mysqldb import MySQL

app = Flask(__name__)
mysql = MySQL(app)


def get_db():
    return mysql.connection.cursor()


@app.route('/show_entries')
def show_entries():
    cur = get_db()
    cur.execute('select title, text from entries order by id desc')
    entries = [dict(title=row[0], text=row[1]) for row in cur.fetchall()]
    return render_template('show_entries.html', entries=entries)


@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        if request.form['username'] != app.config['USERNAME']:
            error = 'Invalid username'
        elif request.form['password'] != app.config['PASSWORD']:
            error = 'Invalid password'
        else:
            session['logged_in'] = True
            flash('You were logged in')
            return redirect(rul_for('show_entries'))
    return render_template('login.html', error=error)


@app.route('/add_entry', methods=['POST'])
def add_entry():
    cur = get_db()
    if not session.get('logged_in'):
        abort(401)

    title = str(request.form['title'])
    text = str(request.form['text'])
    print()
    cur.execute('insert into entries (title, text) values (%s, %s)', [title,
                                                                      text])
    mysql.connection.commit()
    flash('New entry was successfully posted')
    return redirect(url_for('show_entries'))


@app.route('/logout')
def logout():
    session.pop('logged_in', None)
    flash('You were logged out')
    return redirect(url_for('show_entries'))


if __name__ == '__main__':
    app.run(debug=True)


# main.py controller

from flask import Flask, redirect, request, url_for, render_template, jsonify
from db import *

app = Flask(__name__)

# Routes

@app.route('/')
def home():
    return render_template("index.html")

@app.route('/about')
def about():
    return render_template("about.html")    

@app.route('/users')
def users():
    users_data = get_users()
    return render_template('users.html', users=users_data)

@app.route('/icons')
def icons():
    icons_data = get_icons()
    return render_template('icons.html', icons=icons_data)

@app.route('/publications')
def publications():
    publications_data = get_publications()
    return render_template('publications.html', publications=publications_data)

@app.route('/user_interactions')
def user_interactions():
    interactions_data = get_user_interactions()
    return render_template('user_interactions.html', user_interactions=interactions_data)

@app.route('/search_filters')
def search_filters():
    filters_data = get_search_filters()
    return render_template('search_filters.html', search_filters=filters_data)

@app.route('/awards')
def awards():
    awards_data = get_awards()
    return render_template('awards.html', awards=awards_data)

@app.route('/display')
def display():
    songs = get_songs()
    return render_template('display.html', songs=songs)

@app.route('/insert_form')
def insert_form():
    return render_template('insert.html')


@app.route('/add', methods=['POST'])
def add():
    create(request.form['title'], request.form['artist'], request.form['genre'])
    return redirect(url_for('display'))

if __name__ == '__main__':
    app.run(debug=True)

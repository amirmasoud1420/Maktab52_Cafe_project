from flask import Flask, request, Response, render_template,redirect,url_for
import requests

app = Flask(__name__, template_folder='templates', static_folder='static')


@app.route('/')
def home():
    return render_template('landing_base_html.html')


# def page_content():
#     name = request.args.get('name')
#     return render_template(name + '.html')


# app.add_url_rule('/page_content', 'page_content', page_content)
# app.run()

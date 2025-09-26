from flask import Flask
from public import public
from admin import admin
from bank import bank





app=Flask(__name__)
app.secret_key="hello"


app.register_blueprint(public)
app.register_blueprint(admin,url_prefix="/admin")
app.register_blueprint(bank,url_prefix="/bank")



app.run(debug=True,port=5180)
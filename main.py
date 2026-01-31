from flask import Flask
from public import public
from admin import admin
from turf import turf
from user import user
# from api import api

app=Flask(__name__) 

app.secret_key="secretkey"

app.register_blueprint(public)
app.register_blueprint(admin,url_prefix="/admin")
app.register_blueprint(turf,url_prefix="/turf")
# app.register_blueprint(api,url_prefix="/api")
app.register_blueprint(user,url_prefix="/user")

app.run(debug=True,port=5016,host="0.0.0.0")
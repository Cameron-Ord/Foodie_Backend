#importing
import json
from flask import Flask,request, make_response, jsonify
import dbhelper, api_helper, dbcreds, uuid
app = Flask(__name__)


#----------------------/api/client----------------------#

try:
   @app.post('/api/client')
   #function gets called on api request
   def new_client():
      #calls the function in api_helper to loop through the information sent
         error=api_helper.check_endpoint_info(request.json, ['email', 'first_name', 'last_name', 'image_url', 'username', ]) 
         if(error !=None):
            return make_response(jsonify(error), 400)
         #calls the proceedure to insert sent information into the DB
         token = uuid.uuid4().hex
         results = dbhelper.run_proceedure('CALL new_client(?,?,?,?,?,?,?)', 
            [request.json.get('email'), request.json.get('first_name'), request.json.get('last_name'), request.json.get('image_url'), request.json.get('username'), request.json.get('password'), token])
         #returns results from db run_proceedure
         if(type(results) == list):
            return make_response(jsonify(results), 200)
         else:
            return make_response(jsonify('something has gone wrong'), 500)

except TypeError:
   print('Invalid entry, try again')
   
except: 
   print('something went wrong')
   
   
   
try:
   @app.get('/api/client')
   #function gets called on api request
   def get_client():
         error=api_helper.check_endpoint_info(request.args, ['client_id']) 
         if(error !=None):
            return make_response(jsonify(error), 400)
         #calls the procedure to retrieve information from the DB
         
         results = dbhelper.run_proceedure('CALL get_client(?)', [request.args.get('client_id')])
         #returns results from db run_procedure
         if(type(results) == list):
            return make_response(jsonify(results), 200)
         else:
            return make_response(jsonify('something has gone wrong'), 500)

except TypeError:
   print('Invalid entry, try again')
   
except: 
   print('something went wrong')
   
   
   #doesnt work yet
try:
   @app.patch('/api/client')
   #function gets called on api request
   def update_client():
      
         error=api_helper.check_endpoint_info(request.headers, ['token']) 
         if(error !=None):
            return make_response(jsonify(error), 400)
         #calls the procedure to retrieve information from the DB
         
         results = dbhelper.run_proceedure('CALL update_client(?,?,?,?,?,?,?)',
                                          [request.json.get('email'), request.json.get('first_name'), request.json.get('last_name'), request.json.get('image_url'), request.json.get('username'), request.json.get('password'), request.headers.get('token')])
         #returns results from db run_procedure
         
      
         if(type(results) == list):
            return make_response(jsonify(results), 200)
         else:
            return make_response(jsonify('something has gone wrong'), 500)

except TypeError:
   print('Invalid entry, try again')
   
except: 
   print('something went wrong')
   
try:
   @app.delete('/api/client')
   #function gets called on api request
   def delete_client():
      
         error=api_helper.check_endpoint_info(request.json, ['password']) 
         if(error !=None):
            return make_response(jsonify(error), 400)
         #calls the procedure to retrieve information from the DB
         
         error_2=api_helper.check_endpoint_info(request.headers, ['token']) 
         if(error_2 !=None):
            return make_response(jsonify(error_2), 400)
         
         results = dbhelper.run_proceedure('CALL delete_client(?,?)', [request.json.get('password'), request.headers.get('token')])
         #returns results from db run_procedure
         if(type(results) == list):
            return make_response(jsonify(results), 200)
         else:
            return make_response(jsonify('something has gone wrong'), 500)

except TypeError:
   print('Invalid entry, try again')
   
except: 
   print('something went wrong')
   
   
   
#--------------------/API/CLIENT-LOGIN--------------------#
   
try:
   @app.post('/api/client-login')
   #function gets called on api request
   def client_login():
      #calls the function in api_helper to loop through the information sent
         error=api_helper.check_endpoint_info(request.json, ['email','password']) 
         if(error !=None):
            return make_response(jsonify(error), 400)
         #calls the proceedure to insert sent information into the DB
         token = uuid.uuid4().hex
         results = dbhelper.run_proceedure('CALL client_login(?,?,?)', 
            [request.json.get('email'), request.json.get('password'), token])
         #returns results from db run_proceedure
         if(type(results) == list):
            return make_response(jsonify(results), 200)
         else:
            return make_response(jsonify('something has gone wrong'), 500)

except TypeError:
   print('Invalid entry, try again')
   
except: 
   print('something went wrong')
   
   
   
try:
   @app.delete('/api/client-login')
   #function gets called on api request
   def client_logout():

         error_2=api_helper.check_endpoint_info(request.headers, ['token']) 
         if(error_2 !=None):
            return make_response(jsonify(error_2), 400)
         
         results = dbhelper.run_proceedure('CALL client_logout(?)', [request.headers.get('token')])
         #returns results from db run_procedure
         if(type(results) == list):
            return make_response(jsonify(results), 200)
         else:
            return make_response(jsonify('something has gone wrong'), 500)

except TypeError:
   print('Invalid entry, try again')
   
except: 
   print('something went wrong')
   
   

if(dbcreds.production_mode == True):
   print()
   print('----Running in Production Mode----')
   print()
   import bjoern #type: ignore
   bjoern.run(app,'0.0.0.0', 5000)
else:
   from flask_cors import CORS
   CORS(app)
   print()
   print('----Running in Testing Mode----')
   print()
   app.run(debug=True)

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
   
   
#--------------------/API/RESTAURANT--------------------#
   
   
try:
   @app.get('/api/restaurant')
   #function gets called on api request
   def get_restaurant():
         error=api_helper.check_endpoint_info(request.args, ['restaurant_id']) 
         if(error !=None):
            return make_response(jsonify(error), 400)
         #calls the procedure to retrieve information from the DB
         
         results = dbhelper.run_proceedure('CALL get_restaurant(?)', [request.args.get('restaurant_id')])
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
   @app.post('/api/restaurant')
   #function gets called on api request
   def new_restaurant():
      #calls the function in api_helper to loop through the information sent
         error=api_helper.check_endpoint_info(request.json, ['email',
                                                             'password',
                                                             'name',
                                                             'address',
                                                             'phone_number',
                                                             'bio',
                                                             'city',
                                                             'profile_url',
                                                             'banner_url']) 
         if(error !=None):
            return make_response(jsonify(error), 400)
         #calls the proceedure to insert sent information into the DB
         token = uuid.uuid4().hex
         results = dbhelper.run_proceedure('CALL new_restaurant(?,?,?,?,?,?,?,?,?,?)', 
            [request.json.get('email'),
             request.json.get('password'),
             request.json.get('name'), 
             request.json.get('address'),
             request.json.get('phone_number'), 
             request.json.get('bio'),
             request.json.get('city'),
             request.json.get('profile_url'),
             request.json.get('banner_url'), 
             token])
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
   @app.patch('/api/restaurant')
   #function gets called on api request
   def update_restaurant():
      
         error=api_helper.check_endpoint_info(request.headers, ['token']) 
         if(error !=None):
            return make_response(jsonify(error), 400)
         #calls the procedure to retrieve information from the DB
         
         results = dbhelper.run_proceedure('CALL update_restaurant(?,?,?,?,?,?,?,?,?,?)',
                                          [request.json.get('email'),
                                           request.json.get('name'),
                                           request.json.get('address'),
                                           request.json.get('phone_number'),
                                           request.json.get('bio'),
                                           request.json.get('city'),
                                           request.json.get('profile_url'),
                                           request.json.get('banner_url'),
                                           request.json.get('password'),
                                           request.headers.get('token')])
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
   @app.delete('/api/restaurant')
   #function gets called on api request
   def delete_rest():
      
         error=api_helper.check_endpoint_info(request.json, ['password']) 
         if(error !=None):
            return make_response(jsonify(error), 400)
         #calls the procedure to retrieve information from the DB
         
         error_2=api_helper.check_endpoint_info(request.headers, ['token']) 
         if(error_2 !=None):
            return make_response(jsonify(error_2), 400)
         
         results = dbhelper.run_proceedure('CALL delete_restaurant(?,?)', [request.json.get('password'), request.headers.get('token')])
         #returns results from db run_procedure
         if(type(results) == list):
            return make_response(jsonify(results), 200)
         else:
            return make_response(jsonify('something has gone wrong'), 500)

except TypeError:
   print('Invalid entry, try again')
   
except: 
   print('something went wrong')
   
   
#--------------------/API/RESTAURANTS--------------------#

try:
   @app.get('/api/restaurants')
   #function gets called on api request
   def get_all_restaurants():
         
         results = dbhelper.run_proceedure('CALL get_all_restaurants', [])
         #returns results from db run_procedure
         if(type(results) == list):
            return make_response(jsonify(results), 200)
         else:
            return make_response(jsonify('something has gone wrong'), 500)

except TypeError:
   print('Invalid entry, try again')

except: 
   print('something went wrong')
   
#--------------------/API/RESTAURANT-LOGIN--------------------#

   
try:
   @app.delete('/api/restaurant-login')
   #function gets called on api request
   def rest_logout():

         error_2=api_helper.check_endpoint_info(request.headers, ['token']) 
         if(error_2 !=None):
            return make_response(jsonify(error_2), 400)
         
         results = dbhelper.run_proceedure('CALL restaurant_logout(?)', [request.headers.get('token')])
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
   @app.post('/api/restaurant-login')
   #function gets called on api request
   def rest_login():
      #calls the function in api_helper to loop through the information sent
         error=api_helper.check_endpoint_info(request.json, ['email','password']) 
         if(error !=None):
            return make_response(jsonify(error), 400)
         #calls the proceedure to insert sent information into the DB
         token = uuid.uuid4().hex
         results = dbhelper.run_proceedure('CALL restaurant_login(?,?,?)', 
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
   
   
   
#--------------------/API/MENU--------------------#



try:
   @app.post('/api/menu')

   def new_menu_item():

         error=api_helper.check_endpoint_info(request.json, 
                                              ['description', 'image_url', 'name', 'price', ]) 
         if(error !=None):
            return make_response(jsonify(error), 400)

         error_2=api_helper.check_endpoint_info(request.headers,['token' ]) 
         if(error_2 !=None):
            return make_response(jsonify(error_2), 400)


         results = dbhelper.run_proceedure('CALL new_menu_item(?,?,?,?,?)', 
            [request.json.get('description'), request.json.get('image_url'), request.json.get('name'), request.json.get('price'), request.headers.get('token')])


         if(type(results) == list):
            return make_response(jsonify(results), 200)
         else:
            return make_response(jsonify('something has gone wrong'), 500)

except TypeError:
   print('Invalid entry, try again')
   
except: 
   print('something went wrong')
   
try:
   @app.get('/api/menu')

   def get_menu():
         error=api_helper.check_endpoint_info(request.args, ['restaurant_id']) 
         if(error !=None):
            return make_response(jsonify(error), 400)

         
         results = dbhelper.run_proceedure('CALL get_menu_item(?)', [request.args.get('restaurant_id')])

         if(type(results) == list):
            return make_response(jsonify(results), 200)
         else:
            return make_response(jsonify('something has gone wrong'), 500)

except TypeError:
   print('Invalid entry, try again')
   
except: 
   print('something went wrong')
   

   
try:
   @app.patch('/api/menu')
   #function gets called on api request
   def update_menu_item():
      
         error=api_helper.check_endpoint_info(request.headers, ['token']) 
         if(error !=None):
            return make_response(jsonify(error), 400)
         #calls the procedure to retrieve information from the DB
               
         error=api_helper.check_endpoint_info(request.json, ['menu_id']) 
         if(error !=None):
            return make_response(jsonify(error), 400)
         #calls the procedure to retrieve information from the DB
         results = dbhelper.run_proceedure('CALL update_menu_item(?,?,?,?,?,?)',
                                          [request.json.get('description'),
                                           request.json.get('image_url'),
                                           request.json.get('name'),
                                           request.json.get('price'),
                                           request.json.get('menu_id'),
                                           request.headers.get('token')])
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
   @app.delete('/api/menu')

   def delete_menu_item():
      
         error=api_helper.check_endpoint_info(request.json, ['menu_id']) 
         if(error !=None):
            return make_response(jsonify(error), 400)

         error_2=api_helper.check_endpoint_info(request.headers, ['token']) 
         if(error_2 !=None):
            return make_response(jsonify(error_2), 400)
         
         results = dbhelper.run_proceedure('CALL delete_menu_item(?)', [request.json.get('menu_id')])

         if(type(results) == list):
            return make_response(jsonify(results), 200)
         else:
            return make_response(jsonify('something has gone wrong'), 500)

except TypeError:
   print('Invalid entry, try again')
   
except: 
   print('something went wrong')
   
   
#--------------------/API/CLIENT-ORDER--------------------#   




try:
   @app.post('/api/client-order')

   def client_post_order():

         error=api_helper.check_endpoint_info(request.json, 
                                              ['menu_items', 'restaurant_id' ]) 
         if(error !=None):
            return make_response(jsonify(error), 400)

         error_2=api_helper.check_endpoint_info(request.headers,['token' ]) 
         if(error_2 !=None):
            return make_response(jsonify(error_2), 400)
  

         results = dbhelper.run_proceedure('CALL client_post_order(?,?,?)', 
            [ request.json.get('restaurant_id'), str(request.json.get('menu_items')) ,request.headers.get('token')])


         if(type(results) == list):
            return make_response(jsonify(results), 200)
         else:
            return make_response(jsonify('something has gone wrong'), 500)

except TypeError:
   print('Invalid entry, try again')
   
except: 
   print('something went wrong')
   

try:
   @app.get('/api/client-order')

   def get_client_order():

         error_2=api_helper.check_endpoint_info(request.headers, ['token']) 
         if(error_2 !=None):
            return make_response(jsonify(error_2), 400)

         
         results = dbhelper.run_proceedure('CALL get_client_order(?,?,?)', [request.headers.get('token'), request.args.get('is_confirmed'), request.args.get('is_complete') ])

         if(type(results) == list):
            return make_response(jsonify(results), 200)
         else:
            return make_response(jsonify('something has gone wrong'), 500)

except TypeError:
   print('Invalid entry, try again')
   
except: 
   print('something went wrong')
   
   
#--------------------/API/RESTAURANT-ORDER--------------------#   

try:
   @app.patch('/api/restaurant-order')

   def restaurant_patch_order():

         error=api_helper.check_endpoint_info(request.json, 
                                              ['order_id']) 
         if(error !=None):
            return make_response(jsonify(error), 400)

         error_2=api_helper.check_endpoint_info(request.headers,['token']) 
         if(error_2 !=None):
            return make_response(jsonify(error_2), 400)

         results = dbhelper.run_proceedure('CALL restaurant_patch_order(?)', 
            [ request.json.get('order_id')])


         if(type(results) == list):
            return make_response(jsonify(results), 200)
         else:
            return make_response(jsonify('something has gone wrong'), 500)

except TypeError:
   print('Invalid entry, try again')
   
except: 
   print('something went wrong')
   

try:
   @app.get('/api/restaurant-order')

   def rest_get_client_order():

         error_2=api_helper.check_endpoint_info(request.headers, ['token']) 
         if(error_2 !=None):
            return make_response(jsonify(error_2), 400)

         
         results = dbhelper.run_proceedure('CALL rest_get_client_order(?,?,?)', [request.headers.get('token'), request.args.get('is_confirmed'), request.args.get('is_complete') ])

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

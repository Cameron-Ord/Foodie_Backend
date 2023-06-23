import json
from flask import Flask,request, make_response, jsonify
import dbhelper, api_helper, dbcreds, uuid
app = Flask(__name__)

@app.delete('/api/client')
#function gets called on api request
def delete_client():

    error=api_helper.check_endpoint_info(request.json, ['password']) 
    if(error !=None):
        return make_response(jsonify(error), 400)
        #calls the procedure to retrieve information from the DB
        
    error_2=api_helper.check_endpoint_info(request.headers, ['token']) 
    if(error_2 !=None):
        return make_response(jsonify(error), 400)
    
    results = dbhelper.run_proceedure('CALL delete_client(?,?)', [request.json.get('password'), request.headers.get('token')])
    #returns results from db run_procedure
    if(type(results) == list):
        return make_response(jsonify(results), 200)
    else:
        return make_response(jsonify('something has gone wrong'), 500)
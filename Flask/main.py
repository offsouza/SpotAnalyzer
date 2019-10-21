from flask import Flask, request, Response, jsonify, json, Blueprint

from model import *
import numpy as np
import jsonpickle
import cv2
import base64
from PIL import Image
from io import StringIO
import json


app = Flask(__name__)


@app.route('/analiser', methods=['POST'])
def test():
    global pred
    pred = {}
    r = request
    #print(r.data)
    #print(r.headers)
    user_file = r.files["file"]
    user_file.save("./teste.jpg")
    

    try: 
        pred = predicting("./teste.jpg")
    except:
        load()
        predicting("./teste.jpg")

    print("preds",pred)

    
                
    return jsonify({
                "status":"success",
                "prediction":'',
                
                
                })
    
    

@app.route('/')
def preds():
    
    data = json.load(open('./predicter.txt'))
    return jsonify(data)
                
@app.route('/asd')
def tester():
        load()
            
        
            

        response = "ta"

        response_pickled = jsonpickle.encode(response)

        return Response(response=response_pickled, status=200, mimetype="application/json")
    

if __name__ == '__main__':
   
    app.run(host='0.0.0.0', port=5000)

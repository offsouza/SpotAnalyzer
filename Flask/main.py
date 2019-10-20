from flask import Flask, request, Response, jsonify, json, Blueprint
mod = Blueprint('api',__name__,template_folder='templates')
from model import *
import numpy as np
import jsonpickle
import cv2
import base64
from PIL import Image
from io import StringIO
import json


app = Flask(__name__)
#analise = Analyze()
#model = analise.init()


#graph = None

@app.route('/analiser', methods=['POST'])
def test():
    global pred
    pred = {}
    r = request
    #print(r.data)
    #print(r.headers)
    user_file = r.files["file"]
    user_file.save("./teste.jpg")
    

    

    #image_name = r.headers["image"]
    # convert string of image data to uint8
    #nparr = np.fromstring(r.data, np.uint8)
    #nparr = base64.b64decode(r.data)
    #stream = StringIO(nparr)
    #img = Image.open(nparr)
    #print("###########",img.size)

    # decode image
    #img = cv2.imdecode(r, cv2.IMREAD_COLOR)
    
    #img = nparr
    #print(img.shape)
    #img.shape
    #img = cv2.resize(img, (224,224),interpolation = cv2.INTER_AREA)
    #img  = img.reshape(224,224,3)
    #print(img.shape)
    #img = nparr
    #img = analise.process_img(img)
    try: 
        pred = predicting("./teste.jpg")
    except:
        load()
        predicting("./teste.jpg")

    print("preds",pred)

    #response = {'pred_1':pred[0],'pred_2':pred[1],'pred_3':pred[2]
                #}
                
    return jsonify({
                "status":"success",
                "prediction":'',
                
                
                })
    #response = "#######################"
    #response_pickled = jsonpickle.encode(response)

    #return Response(response=response_pickled, status=200, mimetype="application/json")
    

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
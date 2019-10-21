from keras.models import load_model
from keras.preprocessing.image import load_img, img_to_array, array_to_img
#from keras import back
#from google.cloud import storage

#from flask import Flask, request, Response
import numpy as np
#import matplotlib.pyplot as plt
import tensorflow as tf

import os.path as file
#import collections
import json



#graph = tf.get_default_graph()
#global graph
#with graph.as_default():
import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

#storage_client = storage.Client.from_service_account_json('api.json')    
#bucket = storage_client.get_bucket('pesos')
#buchet = bucket.get_blob('./modelo.h5')
#blobs=bucket.list_blobs(prefix="", delimiter='/')


'''
for blob in blobs:

    
    if file.exists(blob.name):
        print("existe", blob.name)
    else:
        print('nao')
        blob.download_to_filename("./"+blob.name)'''

model = None


def load():
    global model
    model = load_model("modelo.h5")

    import time
    print("load")
    #time.sleep(5)
    print("load0")

    model.load_weights('./pesos.hdf5')

    #time.sleep(5)
    print("peso")

    global graph
    graph = tf.get_default_graph()



    #time.sleep(5)
    print("grafo")


    


def predicting(img):
    with graph.as_default():

       

        #model = load_model("modelo.h5")

        #model.load_weights('./pesos.hdf5')
        #sample_img_path = 'image.jpg'
        #sample_img = load_img(sample_img_path, target_size=(224,224))
        #img_tensor = self.process_img(img)
        img = load_img(img,target_size=(224,224))
        img = img_to_array(img)
        img_tensor = np.expand_dims(img, axis=0)
        img_tensor /= 255

        out = model.predict(img_tensor,verbose=0)
        print(out[0])
        out = out[0]
        dic = {'akiec':out[0], 'bcc':out[1], 'bkl':out[2], 'df':out[3], 'mel':out[4], 'nv':out[5], 'vasc':out[6]}
        #out = out.round()
        #out = out.round(3)
        lista = sort_dict(dic)



        #maxes = np.sort(out[0])
        #maxs = ["{:.3f}".format(x) for x in maxes[-3:]]

        #print(maxes)
        #print(maxs)
        #['akiec', 'bcc', 'bkl', 'df', 'mel', 'nv', 'vasc']

        return lista

def sort_dict(dic):

    od  = [(k, dic[k]) for k in sorted(dic, key=dic.get, reverse=True)]
    print(od)

    lista = {}
    i=0
    for k, v in od:
                if i ==3:
                    break

                v = round(v * 100,3)

                lista[k] = str(v)
                i+=1

    json.dump(lista, open(r'./predicter.txt', 'w'))
    print(lista)


    return lista
'''

dic Map _dicts = {
    "akiec": "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/cancer-da-pele/64/",
    "bcc": "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/cancer-da-pele/64/",
    "bkl": "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/nevos-displasicos/15/",
    "df": "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/dermatofibroma/77/",
    "mel": "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/cancer-da-pele/64/",
    "nv": "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/nevos-displasicos/15/",
    "vasc": "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/hemangioma/85/"
    "vasc2": "https://www.sbd.org.br/dermatologia/pele/doencas-e-problemas/granuloma-piogenico/50/"
  };



class Analyze():


    def init (self):
        K.clear_session()

        model = load_model("modelo.h5")

        model.load_weights('./pesos.hdf5')

        return model

    def process_img (self,img):
        img = img_to_array(img)
        img_tensor = np.expand_dims(img, axis=0)
        img_tensor /= 255

        return img_tensor

    def predicting(self,img, model):
        #sample_img_path = 'image.jpg'
        #sample_img = load_img(sample_img_path, target_size=(224,224))
        #img_tensor = self.process_img(img)
        img = img_to_array(img)
        img_tensor = np.expand_dims(img, axis=0)
        img_tensor /= 255

        out = model.predict(img_tensor,verbose=0)
        print(out[0])
        #out = out.round()
        #out = out.round(3)
        maxes = np.sort(out[0])
        print(maxes)
        print(["{:.2f}".format(x) for x in maxes[-3:]])

        return maxes[-1]
       



#a = Analyze()
#a.model()
#a.predict()

#sample_img_path = 'image.jpg'
#sample_img = load_img(sample_img_path, target_size=(224,224))
#sample_img_tensor = img_to_array(sample_img)
#sample_img_tensor = np.expand_dims(sample_img_tensor, axis=0)
#sample_img_tensor /= 255.
#print(sample_img_tensor.shape)
#plt.imshow(sample_img_tensor[0])# (1, 150, 150, 3)
#plt.show()


#print(model.summary())
'''
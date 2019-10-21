from keras.models import load_model
from keras.preprocessing.image import load_img, img_to_array, array_to_img

import numpy as np

import tensorflow as tf

import os.path as file

import json




import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'


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

       

        img = load_img(img,target_size=(224,224))
        img = img_to_array(img)
        img_tensor = np.expand_dims(img, axis=0)
        img_tensor /= 255

        out = model.predict(img_tensor,verbose=0)
        print(out[0])
        out = out[0]
        dic = {'akiec':out[0], 'bcc':out[1], 'bkl':out[2], 'df':out[3], 'mel':out[4], 'nv':out[5], 'vasc':out[6]}
        
        lista = sort_dict(dic)



       
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


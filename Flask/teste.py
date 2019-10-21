# coding: utf-8
'''from keras.models import load_model
from keras.preprocessing.image import load_img, img_to_array, array_to_img
#from keras import back
from google.cloud import storage
import os.path as file'''
import collections
import io
'''
#storage_client = storage.Client()
#https://console.cloud.google.com/storage/browser/pesos
storage_client = storage.Client.from_service_account_json('api.json')    
bucket = storage_client.get_bucket('pesos')
buchet = bucket.get_blob('./modelo.h5')
blobs=bucket.list_blobs(prefix="", delimiter='/')



for blob in blobs:

    
    if file.exists(blob.name):
        print("existe", blob.name)
    else:
        blob.download_to_filename("./"+blob.name)

'''
#model = load_model(blob)
dic = {'akiec':1, 'nv':2}


od  = [(k, dic[k]) for k in sorted(dic, key=dic.get, reverse=True)]
print(od)

lista = {}
i=0
for k, v in od:
            if i ==3:
                break
            
            lista[k] = v
            i+=1

print(lista)




#Bowen's disease (akiec), basal cell carcinoma (bcc),
# benign keratosis-like lesions (solar lentigines / seborrheic keratoses and lichen-planus like keratoses, bkl), 
#dermatofibroma (df), melanoma (mel),
# melanocytic nevi (nv) and vascular lesions (angiomas, angiokeratomas, pyogenic granulomas and hemorrhage, vasc).

import json
json.dump(lista, open(r'./predict.txt', 'w'))


a = json.load(io.open('./predict.txt'))
print(a)
#print(a['otavio'])

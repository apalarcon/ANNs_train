from keras import datasets, layers, models
import matplotlib.pyplot as plt
import keras as kr
import sys
from tensorflow.python.keras.callbacks import ModelCheckpoint
from pandas import DataFrame
import numpy as np
import os


#os.system("rm MODELS2/*")


def read_data(years_backward,pluv_name,fnames):
	
	varsdata=[]
	
	for fn in fnames:
		varsdata=np.append(varsdata,fn.lower())
	
	
	pluv=np.loadtxt("Data/"+pluv_name)
	year_begin=pluv[0,0]
	years=pluv[:,0]
	pluv=pluv[:,1:]
	
	
	year_end=years[-1]
	
	print(year_begin,year_end)
	
	for i,fname in enumerate(fnames):
		
		print("----------------------", fname)
		
		vars()[varsdata[i]]=np.loadtxt("Data/"+fname)
		iy=np.where(vars()[varsdata[i]][:,0]==year_begin)
		iy=int(iy[0])
		
		ie=np.where(vars()[varsdata[i]][:,0]==year_end)
		ie=int(ie[0])
	
	
		vars()[varsdata[i]]=vars()[varsdata[i]][iy:ie+1,:]
		
		vars()[varsdata[i]]	= vars()[varsdata[i]][:,1:]	
	
		
	
	data_in=np.empty((len(years)-years_backward,len(fnames)+1,12,years_backward))
	data_out=np.empty((len(years)-years_backward,12))
	
	
	
	
	for i in range(years_backward,len(years)):
		
		#print("--------------------",years[i])
		
		#ind=[i-5,i-4,i-3,i-2,i-1]
		
		ind=[i-1]
	
		for jj,j in enumerate(ind):		
			data=np.empty((len(fnames)+1,12))
			data[0,:]=pluv[j,:]
			for ki,fn in enumerate(varsdata):
				
				data[ki+1,:]=vars()[fn][j,:]
		
		
		
			
			data_in[i-years_backward,:,:,jj-1]=data
		
		
		data_out[i-years_backward,:]=pluv[i]
		
	return data_in,data_out


fnames=["AMO","Nino12","Nino3","Nino4","Nino34","sunspot","SOI","NAO","SST"]
years_backward=1
pluvnames=["pluv15","pluv10","pluv12","pluv166","pluv284","pluv293","pluv338","pluv340","pluv341","pluv342","pluv343","pluv441","pluv451","pluv456"]


shapes=0
for pluv_name in pluvnames:
    vars()[pluv_name+"-in"],vars()[pluv_name+"-out"]=read_data(years_backward,pluv_name,fnames)
    shapes=np.append(shapes,vars()[pluv_name+"-in"].shape[0])
    



dim=0
for i in range(1,len(shapes)+1):
    sdim=0
    for j in range(1,i):
        print(j,shapes[j])
        sdim=sdim+shapes[j]
    if sdim!=0:
        dim=np.append(dim,sdim)


data_in=np.empty((int(np.sum(shapes)),len(fnames)+1,12,years_backward))
data_out=np.empty((int(np.sum(shapes)),12))

for ii,pluv_name in enumerate(pluvnames):
    print(pluv_name,shapes[ii],shapes[ii+1])
    data_in[dim[ii]:dim[ii+1],:]=vars()[pluv_name+"-in"]
    data_out[dim[ii]:dim[ii+1],:]=vars()[pluv_name+"-out"]        



#data_in=data_in/data_in.max()

sh=data_in.shape[0]

train=int(0.85*sh)




print(data_in.shape)

sys.exit()


train_images= data_in[0:train,:]

train_labels=data_out[0:train,:]


test_images=data_in[train:,:]
test_labels=data_out[train:,:]


print(train_images.shape,train_labels.shape)






model = models.Sequential()
model.add(layers.Conv2D(32, (3, 3), activation='relu', input_shape=(len(fnames)+1, 12, years_backward)))
model.add(layers.MaxPooling2D((2, 2)))
model.add(layers.Conv2D(24, (3, 3), activation='relu'))
model.add(layers.MaxPooling2D((2, 2)))
model.add(layers.Flatten())
model.add(layers.Dense(32, activation='relu'))
model.add(layers.Dropout(0.2))
model.add(layers.Dense(12))


model.summary()






checkpoint = ModelCheckpoint("MODELS2/weights.{epoch:03d}-{val_loss:014.6f}.h5", verbose=1, monitor='val_loss',save_best_only="true", mode='auto')

model.compile(optimizer='adam',loss="mean_absolute_error", metrics=['accuracy'])

stats = model.fit(train_images, train_labels, epochs=9500, 
                    validation_data=(test_images, test_labels),callbacks=[checkpoint])


plt.figure(figsize=[8,6])
plt.plot(stats.history['loss'],'r-')
plt.plot(stats.history['val_loss'],'b-')
plt.legend(['Training loss', 'Validation Loss'])
plt.xlabel('Epochs ')
plt.ylabel('Loss')
plt.title('Loss Curves')
plt.savefig('Loss_train.png')

## Accuracy Curves
#plt.figure(figsize=[8,6])
#plt.plot(stats.history['mean_absolute_error'],'r-')
#plt.plot(stats.history['val_mean_absolute_error'],'b-')
#plt.legend(['Training MAE', 'Validation MAE'])
#plt.xlabel('Epochs ')
#plt.ylabel('MAE')
#plt.title('mean_absolute_error')
#plt.savefig('mean_absolute_error_train.png',dpi=300)

DataFrame(data=stats.history).to_csv("MODELS/history.csv", index=None)

plt.show()

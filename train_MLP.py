import keras
from keras.datasets import mnist
from keras.models import Sequential
from keras.layers import Dense
from keras.utils import to_categorical
import numpy as np
import sys
from tensorflow.python.keras.callbacks import ModelCheckpoint
import matplotlib.pylab as plt
from keras.layers import Input, Dense, Dropout, Flatten

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

num_classes=120


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

train=int(0.9*sh)




print(train)



X_train1= data_in[0:train,:]

Y_train=data_out[0:train,:]


X_test1=data_in[train:,:]
Y_test=data_out[train:,:]


print(Y_train.shape)


X_train=np.empty((X_train1.shape[0],X_train1.shape[1]*X_train1.shape[2]))
X_test=np.empty((X_test1.shape[0],X_test1.shape[1]*X_test1.shape[2]))

print(X_train.shape)

for i in range(0,X_train.shape[0]):
    X_train[i,:]=X_train1[i,:,:,0].flatten()
for i in range(0,X_test.shape[0]):
    X_test[i,:]=X_test1[i,:,:,0].flatten()


print(X_train.shape)



# Set the input shape
input_shape = (120,)
print(f'Feature shape: {input_shape}')

# Create the model
model = Sequential()
model.add(Dense(1, input_shape=input_shape, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(32, activation='relu'))
model.add(Dropout(0.5))
#number of features on the output
model.add(Dense(12, activation='relu'))


model.summary()





# Configure the model and start training
checkpoint = ModelCheckpoint("MODELS/weights.{epoch:03d}-{val_loss:014.6f}.h5", verbose=1, monitor='val_loss',save_best_only="true", mode='auto')
model.compile(loss='mean_absolute_error', optimizer='adam', metrics=['accuracy'])
stats = model.fit(X_train, Y_train, epochs=5000, batch_size=90, verbose=1, validation_split=0.15,callbacks=[checkpoint])

# Test the model after training
test_results = model.evaluate(X_test, Y_test, verbose=1)
print(f'Test results - Loss: {test_results[0]} - Accuracy: {test_results[1]}%') 


plt.figure(figsize=[8,6])
plt.plot(stats.history['loss'],'r-')
plt.plot(stats.history['val_loss'],'b-')
plt.legend(['Training loss', 'Validation Loss'])
plt.xlabel('Epochs ')
plt.ylabel('Loss')
plt.title('Loss Curves')
plt.savefig('Loss_train.png')
plt.show()

@author: onurkarayalcin
"""

import csv
import numpy as np
import matplotlib as ml
from matplotlib import pyplot as plt
from scipy import optimize

data1 = '/Users/onurkarayalcin/Desktop/machine_learning_assign/machine-learning-ex1/ex1/ex1data1.txt'
raw_data1 = open(data1,'rt');
reader1 = csv.reader(raw_data1);
k1 = list(reader1);
mydata1 = np.array(k1).astype('float64');

tr_mydata1 = np.transpose(mydata1) #get transpose of the array
x = tr_mydata1[0]
y = tr_mydata1[1]
plt.plot(x, y, 'ro')

m = np.size(tr_mydata1[0]) #to get how many elements are included in a raw of the matrix
ones1 = np.ones((97,1))  # it generates 97 copy of ones in an array
mydata2 = np.hstack((np.ones((97,1)),np.array(k1)))
X = mydata2[:,:2].astype('float64') # astype('...') have to be used to regularize the data type

#####Cost Function#####
def computeCost(X, y, theta1 = np.zeros(2,1)):
J = 0 # initialize cost function
b = X.dot(theta1)
J = np.sum(np.square(b-y))/(2*m)
return(J)

computeCost(X,y) #computes cost function around 32.05

#####Gradient Descent #####

def gradientDes(X, y, theta1=np.zeros(2,1), alpha=0.01, num_iters=3000):
    J_zero = np.zeros(num_iters)
#this part gives information about how changing the cost function curve
#with infinitesimal steps (alpha=0.01) 
#alpha constant could not be so big and so small to get good solution  
    for iter in np.arange(num_iters):
        b = X.dot(theta1)
        theta1 = theta1 - alpha*(1/m)*(X.dot(b-y))
        J_zero[iter] = computeCost(X, y, theta1)
    return(theta1, J_zero)

#### Minimization of Cost ####

theta1 , Cost_J = gradientDescent(X, y)
print('theta1: ',theta1.ravel())

plt.plot(Cost_J)
plt.ylabel('Cost J')
plt.xlabel('Iterations'); 

#theta1 computation gives around [-3.61, 1.12] vector in order to make cost 
#function minimized

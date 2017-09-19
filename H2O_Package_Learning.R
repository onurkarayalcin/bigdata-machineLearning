#In this algortihm, H2O package is used. 
#The package has some neural network and machine learning algoritms in it.
#The codes are included as libraries 
#After interfacing H2O with programming language like R or Python, it can be recall as a library

library(h2o)  #import H2O package after installation 
h2o.init(ip = "localhost", port = 54321, startH2O = TRUE,nthreads = -1)#it has just some adjustents as default

#there is a content dataset in the package which is called iris about flowers
irisPath = system.file("extdata", ".../djkewkkw.csv", package = "h2o")
iris.hex = h2o.uploadFile(path = irisPath, destination_frame = "iris.hex")
iris.data.frame<- as.data.frame(iris.hex)
summary(iris.data.frame)
#it is imported as a data frame

iris.hex <- as.h2o(iris)
iris.hex <- h2o.assign(iris.hex,"myiris.hex")

#The dataset can be divided as below
iris.splits <- h2o.splitFrame(iris.hex,c(0.6,0.2))
iris.splits[[1]]

#it is the most important part since validation, training and testing of dataset are performed in this part
temp_model <- h2o.deeplearning(x = c(2,3,4,5),
                               y = 1,
                               training_frame = iris.splits[[1]],
                               validation_frame = iris.splits[[2]],
                               nfolds = 0,
                               hidden = c(1e3,1e3,1e3),# there is three hidden layer and each of them has 3 neuron units.
                               epochs = 100
                               )
temp_model@

pred <- h2o.predict(temp_model,iris.splits[[3]]) #Here, h2o.predict command makes prediction after the learning process
mypredictins <- as.data.frame(pred)
mypredictins
results <- data.frame() #it gives predictions

#PREDICTIONS PERFORMED ACCORDING TO "sepal.lenght" PARAMETER IN DATASET 

######################## REAL and PREDICTED DATASETS ############################################################
#mypredictions
1 4.902943
2  4.602156
3  4.653477
4  4.983107
5  4.653363
6  5.098124
7  4.908102
8  4.947621
9  4.676617
10 5.183437
11 4.722086
12 5.997973
13 6.857299
14 6.217654
15 6.526008
16 6.136724
17 6.021747
18 6.928661
19 6.462827
20 6.853119
21 6.737444
22 5.295691
23 6.316270
24 6.076473
25 7.274737
26 7.077543
27 7.067850
28 7.579438
29 6.823405
30 6.305572
31 6.908710
32 7.255773
33 7.405136
34 7.095418
35 7.052148
36 6.751450

#Real Dataset
1            5.1
2            4.9
3            4.7
4            4.6
5            5.0
6            5.4
7            4.6
8            5.0
9            4.4
10           4.9
11           5.4
12           4.8
13           4.8
14           4.3
15           5.8
16           5.7
17           5.4
18           5.1
19           5.7
20           5.1
21           5.4
22           5.1
23           4.6
24           5.1
25           4.8
26           5.0
27           5.0
28           5.2
29           5.2
30           4.7
31           4.8
32           5.4
33           5.2
34           5.5
35           4.9
36           5.0

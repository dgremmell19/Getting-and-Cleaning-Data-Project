#**Code Book for Getting and Cleaning Data Project**

###**Purpose**

To list the descriptive names for the variables and data included through various stages in the course project. 

###**Feature Selection**

In the run_analysis.R code, these headers are applied to the columns of cooresponding data in the test_x_test and the train_y_test data sets.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

1. tBodyAcc-XYZ
2. tGravityAcc-XYZ
3. tBodyAccJerk-XYZ
4. tBodyGyro-XYZ
5. tBodyGyroJerk-XYZ
6. tBodyAccMag
7. tGravityAccMag
8. tBodyAccJerkMag
9. tBodyGyroMag
10. tBodyGyroJerkMag
11. fBodyAcc-XYZ
12. fBodyAccJerk-XYZ
13. fBodyGyro-XYZ
14. fBodyAccMag
15. fBodyAccJerkMag
16. fBodyGyroMag
17. fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

1. mean(): Mean value
2. std(): Standard deviation
3. mad(): Median absolute deviation 
4. max(): Largest value in array
5. min(): Smallest value in array
6. sma(): Signal magnitude area
7. energy(): Energy measure. Sum of the squares divided by the number of values. 
8. iqr(): Interquartile range 
9. entropy(): Signal entropy
10. arCoeff(): Autorregresion coefficients with Burg order equal to 4
11. correlation(): correlation coefficient between two signals
12. maxInds(): index of the frequency component with largest magnitude
13. meanFreq(): Weighted average of the frequency components to obtain a mean frequency
14. skewness(): skewness of the frequency domain signal 
15. kurtosis(): kurtosis of the frequency domain signal 
16. bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
17. angle(): Angle between to vectors.

These 3 axial signal names and variables are combined to form the column names of the data set before filtering. 

###**Subject Info**

**TestSubject** - There are 30 subjects in the tests assigned numbers 1:30. Each number cooresponds to a person.
This is contained in the tidydata set under the column "TestSubject". 

###**Activity Types**

Activity types are contained in column "ActivityType" of tidydata.txt final data output. There are six activity types:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

The original data set contained activity ID's from 1:6. These were replaced in the final data set with the descriptive
activity type and moved to column 2 to show the relationship between the subject and activity type.  

###**Tidy Data Output**

This data is data because it contains the elements of a tidy data set including each observation being in a row. Variables
each have their own column and are named with descriptive headings. There are also no missing values. For the purpose of this
project only the mean and standard deviation columns were extracted. Columns with measures such as meanFreq were assumed to be
measures of the mean and not actually representing the mean itself and are therefore excluded.  

This file output contains the following columns (taken from those above):

1. TestSubject                 
2. ActivityType

The following are aggregated mean calculated fields performed by the run_analysis.R code. One measure per TestSubject~ActivityType combination. 
                
3. tBodyAcc-mean()-X          
4. tBodyAcc-mean()-Y
5. tBodyAcc-mean()-Z
6. tBodyAcc-std()-X           
7. tBodyAcc-std()-Y            
8. tBodyAcc-std()-Z            
9. tGravityAcc-mean()-X       
10. tGravityAcc-mean()-Y        
11. tGravityAcc-mean()-Z        
12. tGravityAcc-std()-X        
13. tGravityAcc-std()-Y         
14. tGravityAcc-std()-Z         
15. tBodyAccJerk-mean()-X      
16. tBodyAccJerk-mean()-Y       
17. tBodyAccJerk-mean()-Z       
18. tBodyAccJerk-std()-X       
19. tBodyAccJerk-std()-Y        
20. tBodyAccJerk-std()-Z        
21. tBodyGyro-mean()-X         
22. tBodyGyro-mean()-Y          
23. tBodyGyro-mean()-Z          
24. tBodyGyro-std()-X          
25. tBodyGyro-std()-Y           
26. tBodyGyro-std()-Z           
27. tBodyGyroJerk-mean()-X     
28. tBodyGyroJerk-mean()-Y      
29. tBodyGyroJerk-mean()-Z      
30. tBodyGyroJerk-std()-X      
31. tBodyGyroJerk-std()-Y       
32. tBodyGyroJerk-std()-Z       
33. tBodyAccMag-mean()         
34. tBodyAccMag-std()           
35. tGravityAccMag-mean()       
36. tGravityAccMag-std()       
37. tBodyAccJerkMag-mean()      
38. tBodyAccJerkMag-std()
39. tBodyGyroMag-mean()        
40. tBodyGyroMag-std()          
41. tBodyGyroJerkMag-mean()     
42. tBodyGyroJerkMag-std()     
43. fBodyAcc-mean()-X           
44. fBodyAcc-mean()-Y           
45. fBodyAcc-mean()-Z          
46. fBodyAcc-std()-X            
47. fBodyAcc-std()-Y            
48. fBodyAcc-std()-Z           
49. fBodyAccJerk-mean()-X       
50. fBodyAccJerk-mean()-Y       
51. fBodyAccJerk-mean()-Z      
52. fBodyAccJerk-std()-X        
53. fBodyAccJerk-std()-Y        
54. fBodyAccJerk-std()-Z       
55. fBodyGyro-mean()-X          
56. fBodyGyro-mean()-Y          
57. fBodyGyro-mean()-Z         
58. fBodyGyro-std()-X           
59. fBodyGyro-std()-Y           
60. fBodyGyro-std()-Z          
61. fBodyAccMag-mean()          
62. fBodyAccMag-std()           
63. fBodyBodyAccJerkMag-mean() 
64. fBodyBodyAccJerkMag-std()   
65. fBodyBodyGyroMag-mean()     
66. fBodyBodyGyroMag-std()    
67. fBodyBodyGyroJerkMag-mean() 
68. fBodyBodyGyroJerkMag-std()
---
title: "Descriptions and Measurements of the Tidy Dataset for the Getting and Cleaning Data course on Coursera"
output: html_document
---


## Introduction
This tidy data set is required by the course project of Getting and Cleanning Data on Coursera <https://class.coursera.org/getdata-009/human_grading>.

The purpose of the project is to demonstrate your ability to collect, work with, and clean a data set. 

The original data set represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

## Data Collection Description
The purpose of the collection and processing of the tidy data set is to provide data on the average of all mean and std data for every subject and every activity from the original Samsung data set.

The steps to prepare the tidy data set are:

<ol>
<li>The original Samsung data set for the project can be downloaded here:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
</li>
<li>The R script file can be used to process the Samsung data set and get the required tidy data set can be found here:
<https://github.com/kornwilliams/GettingAndCleaningDataProject/blob/master/run_analysis.R>
</li>
<li>The Samsung data zip file should be unzipped to the working directory of R session</li>
<li>The functions in the R script file should be loaded into R. One way of doing this is to use the source function in R</li>
<li>The analysis function in the R script should be called, and the tidy data set will be saved on disk:
```
data = analysis(dirPath = "directory path of Samsung data", outputFilePath = "destination path of the tidy data set file")
```
</li>
</ol>
The analysis function processes the Samsung data as required by the course project:
<ol>
<li> Read in the feature names of the Samsung data set</li>
<li> Read in the activity labels of the Samsung data set</li>
<li> Read in the test and train date set of the Samsung data set, use the activity labels to name the activities in both data set, use the feature names to name the columns in both data set</li>
<li> Merge the test and train data set together</li>
<li> Extracts only the measurements on the mean and standard deviation for each measurement</li>
<li> Create a tidy data set by calculating the average of each variable for each activity and each subject</li>
<li> Save the tidy data set on disk and return it as function result</li>
</ol>

Specific description of the R script file and its functions can be found here:
<https://github.com/kornwilliams/GettingAndCleaningDataProject/blob/master/README.md>

## Variable Description
The features selected for the original Samsung data set come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
<ol>
<li>tBodyAcc-XYZ</li>
<li>tGravityAcc-XYZ</li>
<li>tBodyAccJerk-XYZ</li>
<li>tBodyGyro-XYZ</li>
<li>tBodyGyroJerk-XYZ</li>
<li>tBodyAccMag</li>
<li>tGravityAccMag</li>
<li>tBodyAccJerkMag</li>
<li>tBodyGyroMag</li>
<li>tBodyGyroJerkMag</li>
<li>fBodyAcc-XYZ</li>
<li>fBodyAccJerk-XYZ</li>
<li>fBodyGyro-XYZ</li>
<li>fBodyAccMag</li>
<li>fBodyAccJerkMag</li>
<li>fBodyGyroMag</li>
<li>fBodyGyroJerkMag</li>
</ol>
As required by the course project, the set of variables that were estimated from these signals are: 
<ol>
<li>mean(): Mean value</li>
<li>std(): Standard deviation</li>
</ol>

<table>
<caption align = "center" ><strong>Table.1 Variable Description</strong></caption>
<tbody>
<tr><td><em> Variable Name </em></td><td><em> Position </em></td><td><em> Explatation </em></td></tr>
<tr><td width = "20%">Subject</td><td width = "10%">1</td><td width = "70%">An id number identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.</td></tr>
<tr><td>Activity</td><td>2</td><td>Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist</td></tr>
<tr><td>tBodyAcc-mean()-X</td><td>3</td><td>Average of the mean value of the body acceleration signal in X direction</td></tr>
<tr><td>tBodyAcc-mean()-Y</td><td>4</td><td>Average of the mean value of the body acceleration signal in Y direction</td></tr>
<tr><td>tBodyAcc-mean()-Z</td><td>5</td><td>Average of the mean value of the body acceleration signal in Z direction</td></tr>

<tr><td>tBodyAcc-std()-X</td><td>6</td><td>Average of the standard deviation of the body acceleration signal in X direction</td></tr>
<tr><td>tBodyAcc-std()-Y</td><td>7</td><td>Average of the standard deviation of the body acceleration signal in Y direction</td></tr>
<tr><td>tBodyAcc-std()-Z</td><td>8</td><td>Average of the standard deviation of the body acceleration signal in Z direction</td></tr>


<tr><td>tGravityAcc-mean()-X</td><td>9</td><td>Average of the mean value of the gravity acceleration signal in X direction</td></tr>
<tr><td>tGravityAcc-mean()-Y</td><td>10</td><td>Average of the mean value of the gravity acceleration signal in Y direction</td></tr>
<tr><td>tGravityAcc-mean()-Z</td><td>11</td><td>Average of the mean value of the gravity acceleration signal in Z direction</td></tr>

<tr><td>tGravityAcc-std()-X</td><td>12</td><td>Average of the standard deviation of the gravity acceleration signal in X direction</td></tr>
<tr><td>tGravityAcc-std()-Y</td><td>13</td><td>Average of the standard deviation of the gravity acceleration signal in Y direction</td></tr>
<tr><td>tGravityAcc-std()-Z</td><td>14</td><td>Average of the standard deviation of the gravity acceleration signal in Z direction</td></tr>


<tr><td>tBodyAccJerk-mean()-X</td><td>15</td><td>Average of the mean value of the body acceleration jerk signal in X direction</td></tr>
<tr><td>tBodyAccJerk-mean()-Y</td><td>16</td><td>Average of the mean value of the body acceleration jerk signal in Y direction</td></tr>
<tr><td>tBodyAccJerk-mean()-Z</td><td>17</td><td>Average of the mean value of the body acceleration jerk signal in Z direction</td></tr>

<tr><td>tBodyAccJerk-std()-X</td><td>18</td><td>Average of the standard deviation of the body acceleration jerk signal in X direction</td></tr>
<tr><td>tBodyAccJerk-std()-Y</td><td>19</td><td>Average of the standard deviation of the body acceleration jerk signal in Y direction</td></tr>
<tr><td>tBodyAccJerk-std()-Z</td><td>20</td><td>Average of the standard deviation of the body acceleration jerk signal in Z direction</td></tr>

<tr><td>tBodyGyro-mean()-X</td><td>21</td><td>Average of the mean value of the body gyroscope signal in X direction</td></tr>
<tr><td>tBodyGyro-mean()-Y</td><td>22</td><td>Average of the mean value of the body gyroscope signal in Y direction</td></tr>
<tr><td>tBodyGyro-mean()-Z</td><td>23</td><td>Average of the mean value of the body gyroscope signal in Z direction</td></tr>

<tr><td>tBodyGyro-std()-X</td><td>24</td><td>Average of the standard deviation of the body gyroscope signal in X direction</td></tr>
<tr><td>tBodyGyro-std()-Y</td><td>25</td><td>Average of the standard deviation of the body gyroscope signal in Y direction</td></tr>
<tr><td>tBodyGyro-std()-Z</td><td>26</td><td>Average of the standard deviation of the body gyroscope signal in Z direction</td></tr>


<tr><td>tBodyGyroJerk-mean()-X</td><td>27</td><td>Average of the mean value of the body gyroscope jerk signal in X direction</td></tr>
<tr><td>tBodyGyroJerk-mean()-Y</td><td>28</td><td>Average of the mean value of the body gyroscope jerk signal in Y direction</td></tr>
<tr><td>tBodyGyroJerk-mean()-Z</td><td>29</td><td>Average of the mean value of the body gyroscope jerk signal in Z direction</td></tr>

<tr><td>tBodyGyroJerk-std()-X</td><td>30</td><td>Average of the standard deviation of the body gyroscope jerk signal in X direction</td></tr>
<tr><td>tBodyGyroJerk-std()-Y</td><td>31</td><td>Average of the standard deviation of the body gyroscope jerk signal in Y direction</td></tr>
<tr><td>tBodyGyroJerk-std()-Z</td><td>32</td><td>Average of the standard deviation of the body gyroscope jerk signal in Z direction</td></tr>

<tr><td>tBodyAccMag-mean()-X</td><td>33</td><td>Average of the mean value of the magnitude of the body acceleration signal</td></tr>
<tr><td>tBodyAccMag-std()-X</td><td>34</td><td>Average of the standard deviation of the magnitude of the body acceleration signal</td></tr>
</tbody>
 
<tr><td>tGravityAccMag-mean()-X</td><td>35</td><td>Average of the mean value of the magnitude of the gravity acceleration signal</td></tr>
<tr><td>tGravityAccMag-std()-X</td><td>36</td><td>Average of the standard deviation of the magnitude of the gravity acceleration signal</td></tr>

<tr><td>tBodyAccJerkMag-mean()-X</td><td>37</td><td>Average of the mean value of the magnitude of the gravity acceleration jerk signal</td></tr>
<tr><td>tBodyAccJerkMag-std()-X</td><td>38</td><td>Average of the standard deviation of the magnitude of the gravity acceleration jerk signal</td></tr>

<tr><td>tBodyGyroMag-mean()-X</td><td>39</td><td>Average of the mean value of the magnitude of the body gyroscope signal</td></tr>
<tr><td>tBodyGyroMag-std()-X</td><td>40</td><td>Average of the standard deviation of the magnitude of the body gyroscope signal</td></tr>

<tr><td>tBodyGyroJerkMag-mean()-X</td><td>41</td><td>Average of the mean value of the magnitude of the body gyroscope jerk signal</td></tr>
<tr><td>tBodyGyroJerkMag-std()-X</td><td>42</td><td>Average of the standard deviation of the magnitude of the body gyroscope jerk signal</td></tr>

<tr><td>fBodyAcc-mean()-X</td><td>43</td><td>Average of the mean value of the frequency domain signal of the body acceleration in X direction</td></tr>
<tr><td>fBodyAcc-mean()-Y</td><td>44</td><td>Average of the mean value of the frequency domain signal of the body acceleration in Y direction</td></tr>
<tr><td>fBodyAcc-mean()-Z</td><td>45</td><td>Average of the mean value of the frequency domain signal of the body acceleration in Z direction</td></tr>

<tr><td>fBodyAcc-std()-X</td><td>46</td><td>Average of the standard deviation of the frequency domain signal of the body acceleration in X direction</td></tr>
<tr><td>fBodyAcc-std()-Y</td><td>47</td><td>Average of the standard deviation of the frequency domain signal of the body acceleration in Y direction</td></tr>
<tr><td>fBodyAcc-std()-Z</td><td>48</td><td>Average of the standard deviation of the frequency domain signal of the body acceleration in Z direction</td></tr>


<tr><td>fBodyAccJerk-mean()-X</td><td>49</td><td>Average of the mean value of the frequency domain signal of the jerk body acceleration in X direction</td></tr>
<tr><td>fBodyAccJerk-mean()-Y</td><td>50</td><td>Average of the mean value of the frequency domain signal of the jerk body acceleration in Y direction</td></tr>
<tr><td>fBodyAccJerk-mean()-Z</td><td>51</td><td>Average of the mean value of the frequency domain signal of the jerk body acceleration in Z direction</td></tr>

<tr><td>fBodyAccJerk-std()-X</td><td>52</td><td>Average of the standard deviation of the frequency domain signal of the jerk body acceleration in X direction</td></tr>
<tr><td>fBodyAccJerk-std()-Y</td><td>53</td><td>Average of the standard deviation of the frequency domain signal of the jerk body acceleration in Y direction</td></tr>
<tr><td>fBodyAccJerk-std()-Z</td><td>54</td><td>Average of the standard deviation of the frequency domain signal of the jerk body acceleration in Z direction</td></tr>


<tr><td>fBodyGyro-mean()-X</td><td>55</td><td>Average of the mean value of the frequency domain signal of the body gyroscope in X direction</td></tr>
<tr><td>fBodyGyro-mean()-Y</td><td>56</td><td>Average of the mean value of the frequency domain signal of the body gyroscope in Y direction</td></tr>
<tr><td>fBodyGyro-mean()-Z</td><td>57</td><td>Average of the mean value of the frequency domain signal of the body gyroscope in Z direction</td></tr>

<tr><td>fBodyGyro-std()-X</td><td>58</td><td>Average of the standard deviation of the frequency domain signal of the body gyroscope in X direction</td></tr>
<tr><td>fBodyGyro-std()-Y</td><td>59</td><td>Average of the standard deviation of the frequency domain signal of the body gyroscope in Y direction</td></tr>
<tr><td>fBodyGyro-std()-Z</td><td>60</td><td>Average of the standard deviation of the frequency domain signal of the body gyroscope in Z direction</td></tr>

<tr><td>fBodyAccMag-mean()</td><td>61</td><td>Average of the mean value of the magnitute of the frequency domain signal of the body acceleration</td></tr>
<tr><td>fBodyAccMag-std()</td><td>62</td><td>Average of the standard deviation of the magnitute of the frequency domain signal of the body acceleration</td></tr>


<tr><td>fBodyBodyGyroMag-mean()</td><td>63</td><td>Average of the mean value of the magnitute of the frequency domain signal of the jerk body acceleration</td></tr>
<tr><td>fBodyBodyAccJerkMag-std()</td><td>64</td><td>Average of the standard deviation of the magnitute of the frequency domain signal of the jerk body acceleration</td></tr>


<tr><td>fBodyBodyGyroMag-mean()</td><td>65</td><td>Average of the mean value of the magnitute of the frequency domain signal of the body gyroscope</td></tr>
<tr><td>fBodyAccMag-std()</td><td>66</td><td>Average of the standard deviation of the magnitute of the frequency domain signal of the body gyroscope</td></tr>


<tr><td>fBodyBodyGyroJerkMag-mean()</td><td>67</td><td>Average of the mean value of the magnitute of the frequency domain signal of the jerk body gyroscope</td></tr>
<tr><td>fBodyBodyGyroJerkMag-std()</td><td>68</td><td>Average of the standard deviation of the magnitute of the frequency domain signal of the jerk body gyroscope</td></tr>

</tbody>
</tbody>
 
</table>
# Exploratory data analysis
Exploratory data analysis (EDA) is a term for certain kinds of initial analysis and findings done with data sets, usually early on in an analytical process. Some experts describe it as “taking a peek” at the data to understand more about what it represents and how to apply it. Exploratory data analysis is often a precursor to other kinds of work with statistics and data.

Here we are going to learn EDA analysis in two most common platforms- **_Python_** and **_SAS_**.

It will be easier to understand EDA in both platforms by simultaneously comparing the functions.
Steps in EDA:

1.	After importing the file in the environment, first step is to peek at how the dataset looks like. This can be achieved by-
   - a.	**Python**
      - df.head(10)
   - b.	**SAS**			
      - proc print data = df (obs = 10); run;

2.	Okay, so we have got our first look at the dataset, now it’s time to understand structure of the dataset. By structure here we want to know the number of rows in dataset, along with column names and types.
This can be achieved by-
- a.	**Python** 		
  - df.shape – _it will give us number of rows and columns_
  - df.info() – _it will give us column names and its type_
- b.	**SAS**			
  - proc contents data = df; run;

3.	Now following this, we can look at numeric distribution of all the numeric features present in the dataset.
This can be achieved by-
a.	Python- 		
df.describe()
df.isnull().sum() – to find out no.of missing records
b.	SAS-			
proc means data = df N NMISS MIN P25 MEAN MEDIAN P75 P95 MAX;
var _NUMERIC_;
run;
4.	We have looked at the numeric distribution. Now its time to look at the categorical distribution.
This can be achieved by-
a.	Python- 		
df.value_counts()
b.	SAS-			
proc freq data = df;
var features;
run;

5.	Sometimes we come across dataset, where numeric features have missing values. These can be treated by filling the missing values with zero.
This can be achieved by-
a.	Python- 		
> We change any blanks to 0 and use our regex function to remove anything that isn't a number (or negative number which is changed to 0)

for col in column_name:
    df[col] = df[col].fillna("0")
    df[col] = df[col].apply(lambda x: float(re.compile('[^0-9eE.]').sub('', x)) if len(x)>0 else 0)
b.	SAS-			
Data df;
Set df;

ARRAY MISSING_TO_ZERO _NUMERIC_;                                                                                      
DO OVER MISSING_TO_ZERO;                                                                                              
MISSING_TO_ZERO = SUM( MISSING_TO_ZERO , 0);                                                                    
END;    	

Run;

6.	Correlation is also one of the important aspects to look for when we are exploring the features in dataset. 
This can be achieved by-
a.	Python- 		
corr_matrix["feature"].sort_values(ascending=False)
b.	SAS-			
proc corr data=df;
run;


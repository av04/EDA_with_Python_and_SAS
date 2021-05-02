
/* import the file */

PROC IMPORT
		OUT = df
		DATAFILE = 'enter localtion with file name here'
		DBMS = CSV;
		GETNAMES = YES;
RUN;

/* Steps in EDA */

/* 1. Printing Dataset */
/* After importing the file in the environment, first step is to peek at how the dataset looks like. */

proc print data = df (obs = 10);
run;

/* 2. Data Structure */
/* Okay, so we have got our first look at the dataset, now it’s time to understand structure of the dataset. */
/* By structure here we want to know the number of rows in dataset, along with column names and types. */

proc contents data = df;
run;

/* 3. Numeric Features Distribution */
/* Now following this, we can look at numeric distribution of all the numeric features present in the dataset. */

proc means data = df N NMISS MIN P25 MEAN MEDIAN P75 P95 MAX;
var NUMERIC;
run;

/* 4. Categorical Features Distribution */
/* We have looked at the numeric distribution. Now its time to look at the categorical distribution. */

proc freq data = df;
var features;
run;

/* 5. Fill Missing Numerics with Zero */
/* Sometimes we come across dataset, where numeric features have missing values. These can be treated by filling the missing values with zero. */

data df;
set df;

ARRAY MISSING_TO_ZERO NUMERIC;
DO OVER MISSING_TO_ZERO;
MISSING_TO_ZERO = SUM( MISSING_TO_ZERO , 0);
END;

run;

/* 6. Finding Correlation */
/* Correlation is also one of the important aspects to look for when we are exploring the features in dataset. */

proc corr data=df;
run;

/* 7. Finding Skewness and Kurtosis */
/* Finding Skewness and Kurtosis of numeric features also gives us idea about how that numeric feature looks like. */

proc means data = df skew kurt;
var numeric;
run;

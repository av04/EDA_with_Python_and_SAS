# Import the libraries

import pandas as pd
import numpy as np

#import the file

df = pd.read_csv('data.csv')

# Steps in EDA

# 1. Printing Dataset
# After importing the file in the environment, first step is to peek at how the dataset looks like.

df.head(10)

# 2. Data Structure
# Okay, so we have got our first look at the dataset, now it’s time to understand structure of the dataset. 
# By structure here we want to know the number of rows in dataset, along with column names and types.

df.shape # it will give us number of rows and columns
df.info() # it will give us column names and its type

# 3. Numeric Features Distribution
# Now following this, we can look at numeric distribution of all the numeric features present in the dataset. 

df.describe()
df.isnull().sum() # to find out no.of missing records

# 4. Categorical Features Distribution
# We have looked at the numeric distribution. Now its time to look at the categorical distribution. 

df.value_counts()

# 5. Fill Missing Numerics with Zero
# Sometimes we come across dataset, where numeric features have missing values. These can be treated by filling the missing values with zero.

df[col] = df[col].fillna("0")
df[col] = df[col].apply(lambda x: float(re.compile('[^0-9eE.]').sub('', x)) if len(x)>0 else 0)

# 6. Finding Correlation
# Correlation is also one of the important aspects to look for when we are exploring the features in dataset.

corr_matrix["feature"].sort_values(ascending=False)

# 7. Finding Skewness and Kurtosis
# Finding Skewness and Kurtosis of numeric features also gives us idea about how that numeric feature looks like.

df["feature"].skew()
df["feature"].kurtosis()

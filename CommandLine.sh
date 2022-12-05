#!/bin/bash
#In this Command Line we used "pydf" through the simple command "pip install pydf" 


# 1) Which location has the maximum number of purchases been made?
echo "The location with the max number of purchases is:" 
cat bank_transactions.csv | p.df 'df[["CustLocation","TransactionID"]].groupby("CustLocation").count()' 'df.sort_values(by="TransactionID",ascending=False).head(1)' 'df.reset_index()' -o table

# 2) In the dataset provided, did females spend more than males, or vice versa?
echo "In the provided dataset, the males spend more,in fact:"
cat bank_transactions.csv | p.df 'df[["TransactionAmount (INR)","CustGender"]].groupby("CustGender").count()' 'df.sort_values(by="TransactionAmount (INR)",ascending=False).head()' 'df.reset_index()' -o table

# 3) Report the customer with the highest average transaction amount in the dataset:
echo "The customer with the highest average T.A.(INR) in the dataset is:"
cat bank_transactions.csv | p.df 'df[["CustomerID","TransactionAmount (INR)"]].groupby("CustomerID").agg(np.mean)' 'df.sort_values(by="TransactionAmount (INR)",ascending=False).head(1)' 'df.reset_index()' -o table 


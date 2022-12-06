#!/bin/bash
#In this Command Line we used "datamash" for 1), "pydf" for 2) and "AWK" for 3):


# 1) Which location has the maximum number of purchases been made?
echo "1) The location with the max number of purchases is:"
awk 'BEGIN{FS= ","; OFS = "\t"}
NR==1 {print "CustomerID","TransactionAmount (INR)"}' bank_transactions.csv
datamash -t, -s groupby 5 count 1 < bank_transactions.csv  | sort -t, -k 2 -nr | head -1

printf "\n"

# 2) In the dataset provided, did females spend more than males, or vice versa?
echo "2) In the provided dataset, the males spend more,in fact:"
cat bank_transactions.csv | p.df 'df[["TransactionAmount (INR)","CustGender"]].groupby("CustGender").count()' 'df.sort_values(by="TransactionAmount (INR)",ascending=False).head()' 'df.reset_index()' -o table

printf "\n"

# 3) Report the customer with the highest average transaction amount in the dataset:
echo "3) The customer with the highest average T.A.(EUR) in the dataset is:
CustomerId AVG_TA"
awk -F, '{ListCustomer[$2]+=$9; count[$2]+=1} END{for (Id in ListCustomer){print Id , (ListCustomer[Id]/count[Id])/86.3077,"EUR"}}' bank_transactions.csv | sort -n -k 2  | tail -1



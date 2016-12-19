#W201 Storing and Retrieving Data
##Exercise 2 - Deployment
#######Carlos Castro

##Overview

Here we describe the steps to deploy and run your own version of the application.

For a general architecture and repository files walk-through, refer to /docs/Architecture.pdf.

##AMI

1. Using Amazon EC2, get a large instance using the UCB MIDS W205 EX2-FULL AMI
2. Attach an EBS volume to the AMI. Mount it in /data

##Installing Dependencies

1. *Postgres:* To set up Postgres, run the script setup_ucb_complete_plus_postgres.sh, which can be found under /deployment/setup_ucb_complete_plus_postgres.sh. An example way of running the script is below, however you should replace */dev/xvdf* with the location where you mounted your EBS volume.

`chmod +x ./setup_ucb_complete_plus_postgres.sh`
`./setup_ucb_complete_plus_postgres.sh */dev/xvdf*`

2. *Tweepy:* Install Tweepy through the following command:

`pip install tweepy`

3. *Psycopg2*: Install the Python client libraries for Postgres running the following command:

`pip install psycopg2`

##Setup

The last step before copying the application, is to create the postgres database. For that, execute:

`psql -U postgres -c "CREATE DATABASE \"Tcount\""`

##Copying Application

Copy the entire exercise_2 directory to your AMI, in a folder where the w205 user has execute access.

##Running Application

###Tweeter Word Counting

To run the Tweeter word counting application, navigate to /exercise_2/tweetwordcount/ and run the following command:

`streamparse run`

###Serving Scripts

####Final Results

To run the final results, navigate to /exercise_2/serving_scripts and run either of the following:

1. `python finalresults.py`
2. `python finalresults.py _<word of interest>_`

Where the first one will output all the words and their respective counts sorted by word descending, and the second call will return the count for the word you indicate in the _<word of interest>_ placeholder.

####Histogram

To run the histogram script, call the histogram application with a lower bound and an upper bound, and the script will return the words with counts within the specified bounds and their counts. The script can be invoked as follows:

`python histogram.py <lower bound>,<upper bound>`

For example:

`python histogram.py 2,10`
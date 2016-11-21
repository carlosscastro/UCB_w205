
import psycopg2
import sys

#We expect 2 arguments, the program to execute and 2 numbers separated by comma. for example ["histogram.py", "10,100"]
if len(sys.argv) == 2:
    
    #Split the bounds of the histogram, hoping to obtain an array with the lower and upper bound, such as ["10", "100"]
    argument = sys.argv[1].split(',')

    if not argument or len(argument) != 2: 
        print ("Arguments don't match the expected format. Usage:\n")
        print ("python histogram.py <lower bound>,<upper bound>\n")
        exit()
    try: 
        #Verify that the numbers are integers, throw an error otherwise
        int(argument[0])
        int(argument[1])
    except ValueError:
        print ("Arguments don't match the expected format. Lower bound and upper bound should be positive integers. Usage:\n")
        print ("python histogram.py <lower bound>,<upper bound>\n")
        exit()

    #Connect to the database and obtain a cursor
    conn = psycopg2.connect(database="Tcount", user="postgres", password="pass", host="localhost", port="5432")
    cur = conn.cursor()	
    
    #Obtain the words where count is between our lower and upper bounds as requested by the user
    cur.execute("SELECT * from Tweetwordcount where count >= %s and count <= %s order by count desc", (argument[0],argument[1]))
    records = cur.fetchall()
	
    if not records:
        print ("No records were found for the specified word\n")
        exit()
    else:
        #Print the records
        for rec in records:
            s = "(" + rec[0] + ", " + repr(rec[1]) + ")\n"
            print s

#Incorrect parameters, show help to the user
else:
    print ("Unsupported number of parameters. Call format:\n")
    print ("python histogram.py <lower bound>,<upper bound>\n")
    print ("Call example:\n")
    print ("python histogram.py 3,8\n")

conn.close()

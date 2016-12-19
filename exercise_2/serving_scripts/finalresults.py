
import psycopg2
import sys

#Connect to the database
conn = psycopg2.connect(database="Tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

#We expect 2 arguments: the script name and the [optional] word to filter. Examples: (no filter) ["finalresults.py"]. (filter word 'hello'): ["finalresults.py", "hello"]

#If the user specified a filter, we search the count for the specified word in the database
if len(sys.argv) == 2:
    cur.execute("SELECT * from Tweetwordcount where word = %s;", (sys.argv[1],))
    records = cur.fetchall()
	
    if not records:
        print ("No records were found for the specified word\n")
    else:
        s = "Total number of occurrences of \"" + sys.argv[1] + "\": " + repr(records[0][1]) + "\n"
        print s

#If the user did not specify a filter, we retrieve all words and their counts, ordered by word ascending
elif len(sys.argv) == 1:
    cur.execute("SELECT * from Tweetwordcount order by word asc")
    records = cur.fetchall()

    if not records:
        print ("No records were found")
    else:
        for rec in records:
            s = "(" + rec[0] + ", " + repr(rec[1]) + ")\n"
            print s

else:
    print ("Unsupported number of parameters. Call examples:\n")
    print ("python finalresults.py <word> #Returns the occurence count for a given word\n")
    print ("python finalresults.py        #Returns the occurence count for all words sorted ascending alphabetically\n")

conn.close()

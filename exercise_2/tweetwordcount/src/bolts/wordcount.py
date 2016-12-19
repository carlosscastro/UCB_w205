from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt

import psycopg2

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
        self.conn = psycopg2.connect(database="Tcount", user="postgres", password="pass", host="localhost", port="5432")

        cur = self.conn.cursor()       

    def process(self, tup):
        word = tup.values[0]
		
        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount 
        # Table name: Tweetwordcount 
        # you need to create both the database and the table in advance.
        

        # Increment the local count
        self.counts[word] += 1
        self.emit([word, self.counts[word]])

        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, self.counts[word]))
        
        #Unfortunately, the version of Postgres in the instances does not yet support atomic "UPSERT" command. So, we query the database,
        #if the word is already in the database we do an update, and otherwise we do an insert.
        cur = self.conn.cursor()		
        cur.execute("SELECT word, count from Tweetwordcount where word = %s", (word,));
        records = cur.fetchall()
		
        if not records:
            cur.execute("INSERT INTO Tweetwordcount (word, count) VALUES (%s, %s)", (word, self.counts[word]))
        else:
            cur.execute("update Tweetwordcount set count = count + 1 where word = %s", (word,));


        self.conn.commit()
		
		
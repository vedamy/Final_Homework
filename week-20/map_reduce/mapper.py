#!/usr/bin/env python

# import sys because we need to read and write data to STDIN and STDOUT
import sys

# reading entire line from STDIN (standard input)
for line in sys.stdin:
	# to remove leading and trailing whitespace
	line = line.strip()

	# split the line into words
	words = line.split()

	# process each word and assign a value of 1 to each word
	for word in words:
		print(word +"\t1")
	
	
	






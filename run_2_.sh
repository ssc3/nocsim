#! /bin/bash
rm NoximOutput1
	for k in xy westfirst northlast negativefirst oddeven fullyadaptive
		do
		for l in random transpose1 transpose2 bitreversal butterfly shuffle
			do
			for i in 5 10 15 19
				do
				for j in 5 10 15 19
					do
					echo $i $j $k>>NoximOutput1
					./noxim -dimx $i -dimy $j -routing $k >> NoximOutput1 
					done
				done
			done
		done	


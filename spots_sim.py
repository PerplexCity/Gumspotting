import random
from random import randint
import csv

writer = csv.writer(open('spotsim.csv', 'wb'))

spots =[["posx", "posy", "radius"]]

#200,000 pedestrians per week by 260 weeks (5 years)
for i in range(52000000):
	# 1 in a million probability!
	gum = randint(1,1000000)
	if gum == 1:
		#gives any new spot random x,y position and radius
		spots.append([random.uniform(0,10), random.uniform(0,10), random.uniform(0,5)])


for spot in spots:
	writer.writerow(spot)





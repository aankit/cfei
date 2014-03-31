import sys, random, math

nfile = open(sys.argv[1])
vfile = open(sys.argv[2])
afile = open(sys.argv[3])
nouns = [noun.strip() for noun in nfile] 
verbs = [verb.strip() for verb in vfile] 
adjs = [adj.strip() for adj in afile]

absurdity_growth_rate = .5
lines = 10
vowels = ['a', 'e', 'i' , 'o', 'u']

def theWords(c, ll):
	#instantiate list to return
	theList = list()
	#start choosing by choosing a list to pick from
	chooser = random.randint(0,2)
	words = list()
	if chooser == 0:
		 words = nouns
	elif chooser == 1:
		 words= verbs
	elif chooser == 2:
		 words = adjs
	start = random.randint(0, len(words))
	for num in range(start, len(words)):
		w = words[num]
		#iterate over the letters in the word and get the vowel positions
		vowelPos = [p for p, l in enumerate(w) if l in vowels]
		#add up the distance between the vowels
		if len(vowelPos) > 1:
			vdist = 0
			for i in range(1,len(vowelPos)):
				vdist += vowelPos[i]-vowelPos[i-1]
			#if the distance divided by the number of vowels is greater than the concentration, word qualifies
			if math.floor(vdist/len(vowelPos)) == c and len(theList) < ll:
				theList.append(w)
	return theList

#vowel concentration function
def concentration(line):
	c = math.floor(pow(line, absurdity_growth_rate))
	return c

#line length function
def length_of_line(line):
	l = math.ceil(pow(line, 0.7))
	return l


for l in range(lines):
	c = concentration(l)
	ll = length_of_line(l)+1
	print " ".join(theWords(c, ll))



import random

def simulation(AC=13, str_mod=3, bab=8, damage=8, crit=19, crit_mult=2, pa=False):
	mult = 1
	roll = random.randint(1, 20)
	if roll == 1:
		print "Natural one, automatic failure"
		return 0
	elif roll >= crit:
		print "Crit threat"
		roll2 = random.randint(1,20)
		if simulation(AC, str_mod, bab, damage, crit, crit_mult, pa) > 0:
			mult = crit_mult
	if (roll + str_mod >= AC or roll == 20) and pa:
		print "{} damage".format((random.randint(1, damage) + str_mod + bab) * mult)
		return damage + str_mod + bab
	elif (roll + bab + str_mod >= AC or roll == 20) and not pa:
		print "{} damage".format((random.randint(1, damage) + str_mod) * mult)
		return damage + str_mod
	else:
		print "Miss!"
		return 0
no_pa = 0
pa = 0
trials = 1000
for i in range(0,trials):
    no_pa += simulation()
    pa += simulation(pa=True)
print "Total: {0} with power attack, {1} without.".format(pa, no_pa)

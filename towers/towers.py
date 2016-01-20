def towers(disk, source=1, spare=2, dest=3):
	if disk == 1:

		print ("Move ring from %d to %d" % (source, dest))
	else:
		towers(disk - 1, source, dest, spare)
		print ("Move ring from %d to %d" % (source, dest))
		towers(disk - 1, spare, source, dest)

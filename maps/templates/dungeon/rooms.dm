/datum/map_template/dungeon
	name = null
	mappaths = null
	template_flags = TEMPLATE_FLAG_ALLOW_DUPLICATES
	var/cost = 0
	var/id = null // For blacklisting purposes, all ruins need an id

	var/description = "Nowhere" //used for hidden stashes

	var/prefix = "maps/templates/dungeon/"
	var/suffixes = null

/datum/map_template/dungeon/New()
	if(!name && id)
		name = id

	if (suffixes)
		mappaths = list()
		for (var/suffix in suffixes)
			mappaths += (prefix + suffix)

	..()


/datum/map_template/dungeon/room001
	name = "Room 001"
	id = "r001"
	description = "A generic room."
	suffixes = list("room001.dmm")

/datum/map_template/dungeon/room002
	name = "Room 002"
	id = "r002"
	description = "A slightly less generic room."
	suffixes = list("room002.dmm")

/datum/map_template/dungeon/room003
	name = "Room 003"
	id = "r003"
	description = "Winding passages."
	suffixes = list("room003.dmm")


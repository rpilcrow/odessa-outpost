// Suit slot
/datum/gear/suit
	display_name = "apron"
	path = /obj/item/clothing/suit/apron
	slot = slot_wear_suit
	sort_category = "Suits and Overwear"
	cost = 1

/datum/gear/suit/bomber
	display_name = "bomber jacket"
	path = /obj/item/clothing/suit/storage/toggle/bomber

/datum/gear/suit/kimono
	display_name = "kimono"
	path = /obj/item/clothing/suit/kimono

/datum/gear/suit/leather_jacket
	display_name = "leather jacket selection"
	path = /obj/item/clothing/suit/storage/leather_jacket
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/suit/puffer
	display_name = "puffer selection"
	path = /obj/item/clothing/suit/storage/puffer
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/suit/hazard_vest
	display_name = "hazard vest"
	path = /obj/item/clothing/suit/storage/hazardvest

/datum/gear/suit/hoodies
	display_name = "hoodie selection"
	path = /obj/item/clothing/suit/storage/toggle/hoodie
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/suit/labcoat
	display_name = "labcoat"
	path = /obj/item/clothing/suit/storage/toggle/labcoat

/datum/gear/suit/poncho
	display_name = "poncho selection"
	path = /obj/item/clothing/suit/poncho
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/suit/flannel
	display_name = "flannel shirt selection"
	path = /obj/item/clothing/suit/storage/flannel
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/suit/varsity
	display_name = "varsity jacket selection"
	path = /obj/item/clothing/suit/varsity
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/suit/miljacket
	display_name = "military jacket selection"
	path = /obj/item/clothing/suit/storage/miljacket
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/suit/shirts
	display_name = "shirt selection"
	path = /obj/item/clothing/suit/shirt
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/suit/cloakselect
	display_name = "cloak selection"
	path = /obj/item/clothing/suit/hooded/cloak/simple
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/suit/cloakcaptain
	display_name = "cloak, captain"
	path = /obj/item/clothing/suit/hooded/cloak/job/captain
	allowed_roles = list("Captain")
	sort_category = "Faction: Command"

/datum/gear/suit/cloakfo
	display_name = "cloak, first officer"
	path = /obj/item/clothing/suit/hooded/cloak/job/fo
	allowed_roles = list("First Officer")
	sort_category = "Faction: Command"

/datum/gear/suit/cloakmeo
	display_name = "cloak, expedition overseer"
	path = /obj/item/clothing/suit/hooded/cloak/job/meo
	allowed_roles = list("Moebius Expedition Overseer")
	sort_category = "Faction: Moebius"

/datum/gear/suit/cloakmbo
	display_name = "cloak, biolab officer"
	path = /obj/item/clothing/suit/hooded/cloak/job/mbo
	allowed_roles = list("Moebius Biolab Officer")
	sort_category = "Faction: Moebius"

/datum/gear/suit/cloakgm
	display_name = "cloak, guild merchant"
	path = /obj/item/clothing/suit/hooded/cloak/job/gm
	allowed_roles = list("Guild Merchant")
	sort_category = "Faction: Guild"

/datum/gear/suit/cloakihc
	display_name = "cloak, ironhammer commander"
	path = /obj/item/clothing/suit/hooded/cloak/job/ihc
	allowed_roles = list("Ironhammer Commander")
	sort_category = "Faction: Ironhammer"

/datum/gear/suit/cloakte
	display_name = "cloak, technomancer exultant"
	path = /obj/item/clothing/suit/hooded/cloak/job/te
	allowed_roles = list("Technomancer Exultant")
	sort_category = "Faction: Technomancer"

/datum/gear/suit/cloakservice
	display_name = "cloak, service"
	path = /obj/item/clothing/suit/hooded/cloak/job/service
	allowed_roles = list("Gardener","Chef","Bartender","Actor","Janitor")

/datum/gear/suit/cloakguild
	display_name = "cloak, guild"
	path = /obj/item/clothing/suit/hooded/cloak/job/guild
	allowed_roles = list("Guild Technician","Guild Merchant")
	sort_category = "Faction: Guild"

/datum/gear/suit/cloakmining
	display_name = "cloak, guild miner"
	path = /obj/item/clothing/suit/hooded/cloak/job/mining
	allowed_roles = list("Guild Miner")
	sort_category = "Faction: Guild"

/datum/gear/suit/cloakmedical
	display_name = "cloak, moebius medical"
	path = /obj/item/clothing/suit/hooded/cloak/job/medical
	allowed_roles = list("Moebius Doctor","Moebius Biolab Officer","Moebius Chemist","Moebius Paramedic")
	sort_category = "Faction: Moebius"

/datum/gear/suit/cloakscience
	display_name = "cloak, moebius research"
	path = /obj/item/clothing/suit/hooded/cloak/job/science
	allowed_roles = list("Moebius Expedition Overseer","Moebius Scientist","Moebius Roboticist")
	sort_category = "Faction: Moebius"

/datum/gear/suit/cloaktechnomancer
	display_name = "cloak, technomancer"
	path = /obj/item/clothing/suit/hooded/cloak/job/technomancer
	allowed_roles = list("Technomancer","Technomancer Exultant")
	sort_category = "Faction: Technomancer"

/datum/gear/suit/cloakironhammer
	display_name = "cloak, ironhammer"
	path = /obj/item/clothing/suit/hooded/cloak/job/ironhammer
	allowed_roles = list("Ironhammer Operative","Ironhammer Commander","Ironhammer Gunnery Sergeant", "Ironhammer Inspector", "Ironhammer Medical Specialist")
	sort_category = "Faction: Ironhammer"

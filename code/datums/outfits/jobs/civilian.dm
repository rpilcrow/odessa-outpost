/decl/hierarchy/outfit/job/assistant
	name = OUTFIT_JOB_NAME("Assistant")
	suit = /obj/item/clothing/suit/storage/ass_jacket
	uniform = /obj/item/clothing/under/rank/assistant

/decl/hierarchy/outfit/job/service
	l_ear = /obj/item/device/radio/headset/headset_service
	hierarchy_type = /decl/hierarchy/outfit/job/service

/decl/hierarchy/outfit/job/service/bartender
	name = OUTFIT_JOB_NAME("Bartender")
	uniform = /obj/item/clothing/under/rank/bartender
	pda_type = /obj/item/modular_computer/pda
	backpack_contents = list(/obj/item/ammo_casing/shotgun/beanbag = 4)


/decl/hierarchy/outfit/job/service/chef
	name = OUTFIT_JOB_NAME("Chef")
	uniform = /obj/item/clothing/under/rank/chef
	suit = /obj/item/clothing/suit/rank/chef
	head = /obj/item/clothing/head/rank/chef
	id_type = /obj/item/weapon/card/id/ltgrey
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/service/gardener
	name = OUTFIT_JOB_NAME("Gardener")
	uniform = /obj/item/clothing/under/rank/hydroponics
	suit = /obj/item/clothing/suit/apron
	gloves = /obj/item/clothing/gloves/botanic_leather
	r_pocket = /obj/item/device/scanner/analyzer/plant_analyzer
	id_type = /obj/item/weapon/card/id/hydro
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/service/gardener/New()
	..()
	//backpack_overrides[/decl/backpack_outfit/backpack]      = /obj/item/weapon/storage/backpack/hydroponics;
	//backpack_overrides[/decl/backpack_outfit/satchel]       = /obj/item/weapon/storage/backpack/satchel/hyd;


/decl/hierarchy/outfit/job/service/janitor
	name = OUTFIT_JOB_NAME("Janitor")
	uniform = /obj/item/clothing/under/rank/janitor
	pda_type = /obj/item/modular_computer/pda

/decl/hierarchy/outfit/job/service/actor/clown
	name = OUTFIT_JOB_NAME("Clown")
	uniform = /obj/item/clothing/under/costume/job/clown
	shoes = /obj/item/clothing/shoes/costume/job/clown
	mask = /obj/item/clothing/mask/costume/job/clown
	l_pocket = /obj/item/weapon/bikehorn
	backpack_contents = list(/obj/item/weapon/bananapeel = 1, /obj/item/weapon/storage/fancy/crayons = 1, /obj/item/toy/weapon/waterflower = 1, /obj/item/weapon/stamp/clown = 1)

/decl/hierarchy/outfit/job/service/actor/clown/New()
	..()
	backpack_overrides[/decl/backpack_outfit/backpack] = /obj/item/weapon/storage/backpack/clown
	backpack_overrides[/decl/backpack_outfit/satchel] = /obj/item/weapon/storage/backpack/satchel/norm


/decl/hierarchy/outfit/job/service/actor/clown/post_equip(var/mob/living/carbon/human/H)
	..()
	H.mutations.Add(CLUMSY)
/obj/random/traps/high_chance
	icon_state = "trap-red-hight"
	spawn_nothing_percentage = 33

/obj/random/traps/item_to_spawn() //override to add spikes
	var/list/possible_traps = list(/obj/structure/wire_splicing = 1,
	/obj/item/device/assembly/mousetrap/armed = 0.8,
	/obj/item/weapon/beartrap/armed = 0.30,
	/obj/item/weapon/beartrap/makeshift/armed = 0.45,
	/obj/structure/spikes/short = 0.45)

	//Check that its possible to spawn the chosen trap at this location
	while (possible_traps.len)
		var/trap = pickweight(possible_traps)
		if (can_spawn_trap(loc, trap))
			return trap
		else
			possible_traps -= trap




/obj/random/mob/synth
	name = "random synth"
	icon_state = "hostilemob-red"
	alpha = 128

/obj/random/mob/synth/item_to_spawn()
	return pickweight(list(/mob/living/carbon/superior_animal/synth = 9,
				/mob/living/carbon/superior_animal/synth/shooter = 4,
				/mob/living/carbon/superior_animal/synth/striker = 2,
				/mob/living/carbon/superior_animal/synth/shooter/stun = 1,))

/obj/random/mob/synth/low_chance
	name = "low chance random synth"
	icon_state = "hostilemob-red-low"
	spawn_nothing_percentage = 60

/obj/random/cluster/synth
	name = "cluster of synths"
	icon_state = "hostilemob-red-cluster"
	alpha = 128
	min_amount = 1
	max_amount = 3
	spread_range = 1

/obj/random/cluster/synth/item_to_spawn()
	return /obj/random/mob/synth

/obj/random/cluster/synth/low_chance
	name = "low chance cluster of synths"
	icon_state = "hostilemob-red-cluster-low"
	spawn_nothing_percentage = 60

/obj/random/mob/boss
	name = "random boss mob"
	icon_state = "artifact-red"
	alpha = 128

/obj/random/mob/boss/item_to_spawn()
	return pickweight(list(/mob/living/carbon/superior_animal/synth/boss = 1))


GLOBAL_LIST_INIT(unique_items, list(/obj/item/weapon/tool/shovel/ravedigger = 4,
		/obj/item/weapon/gun/energy/laser/pblaster = 4,
		/obj/item/weapon/tool/shovel/robust = 1,
		/obj/item/weapon/tool/shovel/spade/maingauche = 1,
		/obj/item/heartcontainer = 1,
		/obj/item/weapon/gun/energy/laser/pblaster = 0.5,
		/obj/item/weapon/gun/energy/laser/sawnoff = 0.5,
		/obj/item/weapon/gun/energy/prism = 0.5))

//		/obj/item/weapon/gun/energy/pulse/cassad/gold = 0.5,

//for special items that could be considered unique or artifacts
/obj/random/unique
	name = "random unique item"
	icon_state = "artifact-blue"
	alpha = 128

/obj/random/unique/item_to_spawn()
	if(isemptylist(GLOB.unique_items))
		return /obj/item/weapon/reagent_containers/food/snacks/breakfast
	return pickweight_n_take(GLOB.unique_items)

/obj/random/unique/low_chance
	name = "random rare unique item"
	icon_state = "artifact-blue-low"
	spawn_nothing_percentage = 60
/*
//only the rarest items
/obj/random/unique/rare
	name = "random rare unique item"
	icon_state = "artifact-blue-officer"

/obj/random/unique/rare/item_to_spawn()
	return pickweight(list(/obj/item/weapon/tool/shovel/robust = 1,
				/obj/item/weapon/tool/shovel/spade/maingauche = 1))

/obj/random/unique/rare/low_chance
	name = "random rare unique item"
	icon_state = "artifact-blue-officer-low"
	spawn_nothing_percentage = 60
*/
/obj/random/tool/item_to_spawn()
	return pickweight(list(/obj/random/pack/rare = 2,
				/obj/item/weapon/tool/screwdriver = 8,
				/obj/item/weapon/tool/screwdriver/electric = 2,
				/obj/item/weapon/tool/screwdriver/combi_driver = 1,
				/obj/item/weapon/tool/wirecutters = 8,
				/obj/item/weapon/tool/wirecutters/armature = 2,
				/obj/item/weapon/tool/weldingtool = 8,
				/obj/item/weapon/tool/weldingtool/advanced = 2,
				/obj/item/weapon/tool/omnitool = 0.5,
				/obj/item/weapon/tool/crowbar = 12,
				/obj/item/weapon/tool/crowbar/pneumatic = 2,
				/obj/item/weapon/tool/wrench = 8,
				/obj/item/weapon/tool/wrench/big_wrench = 2,
				/obj/item/weapon/tool/saw = 8,
				/obj/item/weapon/tool/saw/circular = 2,
				/obj/item/weapon/tool/saw/advanced_circular = 1,
				/obj/item/weapon/tool/saw/chain = 0.5,
				/obj/item/weapon/tool/shovel = 5,
				/obj/item/weapon/tool/shovel/spade = 2.5,
				/obj/item/weapon/tool/pickaxe = 2,
				/obj/item/weapon/tool/pickaxe/jackhammer = 1,
				/obj/item/weapon/tool/pickaxe/drill = 1,
				/obj/item/weapon/tool/pickaxe/diamonddrill = 0.5,
				/obj/item/weapon/tool/pickaxe/excavation = 1,
				/obj/item/weapon/tool/tape_roll = 12,
				/obj/item/weapon/tool/tape_roll/fiber = 2,
				/obj/item/weapon/storage/belt/utility = 5,
				/obj/item/weapon/storage/belt/utility/full = 1,
				/obj/item/clothing/gloves/insulated/cheap = 5,
				/obj/item/clothing/gloves/insulated = 2,
				/obj/item/clothing/head/welding = 5,
				/obj/item/weapon/extinguisher = 5,
				/obj/item/device/t_scanner = 2,
				/obj/item/device/export_scanner = 2,
				/obj/item/device/antibody_scanner = 1,
				/obj/item/device/destTagger = 1,
				/obj/item/device/scanner/analyzer/plant_analyzer = 1,
				/obj/item/weapon/autopsy_scanner = 1,
				/obj/item/device/scanner/healthanalyzer = 3,
				/obj/item/device/scanner/mass_spectrometer = 1,
				/obj/item/device/robotanalyzer = 1,
				/obj/item/device/gps = 3,
				/obj/item/device/scanner/analyzer = 2,
				/obj/item/stack/cable_coil = 5,
				/obj/item/weapon/weldpack/canister = 2,
				/obj/item/weapon/packageWrap = 1,
				/obj/item/device/flash = 2,
				/obj/item/weapon/mop = 5,
				/obj/item/weapon/inflatable_dispenser = 3,
				/obj/item/weapon/grenade/chem_grenade/cleaner = 2,
				/obj/item/device/lighting/toggleable/flashlight = 10,
				/obj/item/weapon/tank/jetpack/carbondioxide = 1.5,
				/obj/item/weapon/tank/jetpack/oxygen = 1,
				/obj/item/weapon/storage/makeshift_grinder = 2,
				/obj/item/device/makeshift_electrolyser = 1,
				/obj/item/device/makeshift_centrifuge = 1,
				/obj/item/robot_parts/robot_component/jetpack = 0.75,
				/obj/item/weapon/tool/shovel/ravedigger = 1,
				/obj/item/weapon/tool/weapon/handaxe = 2,
				/obj/item/weapon/tool/saw/machete = 2))

/obj/random/tool/advanced/item_to_spawn()
	return pickweight(list(
				/obj/item/weapon/tool/screwdriver/combi_driver = 3,
				/obj/item/weapon/tool/wirecutters/armature = 3,
				/obj/item/weapon/tool/omnitool = 2,
				/obj/item/weapon/tool/crowbar/pneumatic = 3,
				/obj/item/weapon/tool/wrench/big_wrench = 3,
				/obj/item/weapon/tool/weldingtool/advanced = 3,
				/obj/item/weapon/tool/saw/advanced_circular = 2,
				/obj/item/weapon/tool/saw/chain = 1,
				/obj/item/weapon/tool/pickaxe/diamonddrill = 2,
				/obj/item/weapon/tool/tape_roll/fiber = 2,
				/obj/item/weapon/tool/tape_roll/flextape = 1,
				/obj/item/weapon/material/twohanded/fireaxe = 1,
				/obj/item/weapon/tool/shovel/ravedigger = 1,
				/obj/item/weapon/tool/shovel/robust = 0.5,
				/obj/item/weapon/tool/shovel/spade/maingauche = 0.5))

/obj/random/knife/item_to_spawn()
	return pickweight(list(/obj/item/weapon/material/butterfly = 1,
				/obj/item/weapon/material/butterfly/switchblade = 2,
				/obj/item/weapon/material/knife = 1,
				/obj/item/weapon/material/knife/boot = 0.5,
				/obj/item/weapon/material/knife/hook = 2,
				/obj/item/weapon/material/knife/ritual = 0.5,
				/obj/item/weapon/material/knife/butch = 2,
				/obj/item/weapon/tool/shovel/spade/maingauche = 0.5))


/obj/random/lowkeyrandom/item_to_spawn()
	return pickweight(list(
				/obj/item/weapon/storage/box/shotgunammo/beanbags = 1,
				/obj/item/weapon/storage/box/matches = 3,
				/obj/item/stack/material/cardboard = 2,
				/obj/item/weapon/cell/large = 3,
				/obj/item/weapon/cell/medium = 6,
				/obj/item/weapon/cell/small = 7,
				/obj/item/stack/medical/bruise_pack = 3,
				/obj/item/bodybag/cryobag = 2,
				/obj/item/weapon/reagent_containers/syringe/inaprovaline = 2,
				/obj/item/weapon/cigbutt = 4,
				/obj/item/device/t_scanner = 2,
				/obj/random/voidsuit/damaged = 3,
				/obj/item/device/scanner/analyzer = 2,
				/obj/item/device/scanner/healthanalyzer = 2,
				/obj/item/weapon/storage/belt/utility/full = 6,
				/obj/item/weapon/storage/belt/medical = 6,
				/obj/item/weapon/storage/belt/security = 6,
				/obj/item/weapon/tool/pickaxe = 3,
				/obj/item/weapon/pen = 3,
				/obj/item/weapon/storage/box/donkpockets = 3,
				/obj/item/weapon/locator = 2,
				/obj/item/weapon/dice = 3,
				/obj/item/weapon/clipboard = 2,
				/obj/item/weapon/airlock_electronics = 3,
				/obj/item/weapon/weldpack = 3,
				/obj/item/weapon/soap = 2,
				/obj/item/weedkiller/triclopyr = 4,
				/obj/item/weedkiller = 4,
				/obj/item/weedkiller/lindane = 4,
				/obj/item/weedkiller/D24 = 4,
				/obj/item/weapon/phone = 3,
				/obj/item/weapon/cane = 2,
				/obj/item/weapon/cane/concealed = 1,
				/obj/item/weapon/staff/broom = 2,
				/obj/item/weapon/circuitboard/apc = 1,
				/obj/item/weapon/tool/shovel = 1,
				/obj/item/weapon/folder = 2,
				/obj/item/weapon/folder/blue = 2,
				/obj/item/weapon/folder/red = 2,
				/obj/item/weapon/folder/yellow = 2,
				/obj/item/weapon/folder/white = 2,
				/obj/item/weapon/paper_bin = 2,
				/obj/item/device/flash = 2,
				/obj/item/device/camera_film = 4,
				/obj/item/device/radio = 3,
				/obj/item/device/debugger = 1,
				/obj/item/device/aicard = 1,
				/obj/item/weapon/storage/box/botanydisk = 2,
				/obj/item/weapon/storage/box/ids = 2,
				/obj/item/weapon/storage/briefcase/crimekit = 2,
				/obj/item/weapon/storage/box/drinkingglasses = 2,
				/obj/item/weapon/hatton_magazine = 2,
				/obj/item/weapon/hand_labeler = 2,
				/obj/item/weapon/tool/bonesetter = 2,
				/obj/item/weapon/tool/scalpel = 2,
				/obj/item/weapon/tool/surgicaldrill = 2,
				/obj/item/weapon/tool/cautery = 2,
				/obj/item/weapon/tool/retractor = 2,
				/obj/item/weapon/tool/saw/circular = 2,
				/obj/item/weapon/mop = 3,
				/obj/item/weapon/lipstick/jade = 3,
				/obj/item/weapon/inflatable_dispenser = 2,
				/obj/item/weapon/grenade/chem_grenade/cleaner = 2,
				/obj/item/weapon/smes_coil = 2,
				/obj/item/weapon/tank/anesthetic = 2,
				/obj/item/weapon/tank/nitrogen = 2,
				/obj/item/clothing/mask/balaclava = 3,
				/obj/item/clothing/mask/gas = 3,
				/obj/item/clothing/head/ushanka = 2,
				/obj/item/clothing/head/welding = 1,
				/obj/item/clothing/gloves/insulated/cheap = 3,
				/obj/item/clothing/gloves/insulated = 2,
				/obj/item/clothing/head/soft/blue = 2,
				/obj/item/clothing/head/soft/green = 2,
				/obj/item/clothing/head/soft/grey = 2,
				/obj/item/device/taperecorder = 2,
				/obj/item/weapon/storage/briefcase = 2,
				/obj/item/weapon/storage/secure/briefcase = 2,
				/obj/item/device/binoculars = 2,
				/obj/item/taperoll = 1,
				/obj/item/toy/weapon/crossbow = 1,
				/obj/item/toy/weapon/cultsword = 1,
				/obj/item/weapon/reagent_containers/food/drinks/bottle/small/beer = 1,
				/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka = 1,
				/obj/item/weapon/circuitboard/communications = 1,
				/obj/item/weapon/circuitboard/broken = 2,
				/obj/item/weapon/airlock_electronics = 1,
				/obj/item/rig_module/maneuvering_jets = 1,
				/obj/item/rig_module/device/drill = 1,
				/obj/item/clothing/glasses/powered/meson = 1,
				/obj/item/clothing/glasses/powered/night = 1,
				/obj/item/weapon/computer_hardware/card_slot = 2,
				/obj/item/weapon/computer_hardware/hard_drive = 2,
				/obj/item/weapon/computer_hardware/network_card = 2,
				/obj/item/weapon/computer_hardware/processor_unit = 2,
				/obj/item/weapon/computer_hardware/tesla_link = 2,
				/obj/item/weapon/stock_parts/console_screen = 2,
				/obj/item/weapon/stock_parts/capacitor = 2,
				/obj/item/weapon/stock_parts/manipulator = 2,
				/obj/item/weapon/stock_parts/matter_bin = 2,
				/obj/item/weapon/stock_parts/micro_laser = 2,
				/obj/item/weapon/stock_parts/scanning_module = 2,
				/obj/item/weapon/stock_parts/subspace/amplifier = 1,
				/obj/item/weapon/stock_parts/subspace/analyzer = 1,
				/obj/item/weapon/stock_parts/subspace/ansible = 1,
				/obj/item/weapon/stock_parts/subspace/crystal = 1,
				/obj/item/weapon/stock_parts/subspace/filter = 1,
				/obj/item/weapon/stock_parts/subspace/transmitter = 1,
				/obj/item/weapon/stock_parts/subspace/treatment = 1,
				/obj/item/weapon/aiModule/reset = 1,
				/obj/item/weapon/circuitboard/autolathe = 1,
				/obj/item/ammo_magazine/cl32/rubber = 1,
				/obj/item/ammo_magazine/cl32 = 1,
				/obj/item/ammo_magazine/sl357 = 1,
				/obj/item/ammo_magazine/sl38 = 1,
				/obj/item/ammo_magazine/sl38/rubber = 1,
				/obj/item/weapon/flamethrower = 1,
				/obj/item/weapon/gun/projectile/mk58 = 1,
				/obj/item/weapon/gun/projectile/giskard = 1,
				/obj/item/weapon/gun/projectile/revolver/deckard = 1,
				/obj/item/weapon/gun/projectile/revolver/detective = 1,
				/obj/item/clothing/accessory/badge/marshal = 0.1, //Antag item
				/obj/item/stash_spawner = 12,
				/obj/item/weapon/tool/shovel/ravedigger = 2,
				/obj/item/weapon/tool/shovel/robust = 1,
				/obj/item/weapon/tool/shovel/spade/maingauche = 1,
				/obj/item/weapon/tool/weapon/handaxe = 1,
				/obj/item/weapon/tool/weapon/sword = 0.1,
				/obj/item/weapon/tool/saw/machete = 0.5,
				/obj/item/weapon/gun/launcher/crossbow = 0.5))

/obj/random/gun_normal/item_to_spawn()
	return pickweight(list(/obj/item/weapon/gun/projectile/lamia = 2,\
				/obj/item/weapon/gun/projectile/automatic/idaho = 1,\
				/obj/item/weapon/gun/projectile/automatic/atreides = 1,\
				/obj/item/weapon/gun/projectile/deagle = 2,\
				/obj/item/weapon/gun/projectile/shotgun/pump/gladstone = 2,\
				/obj/item/weapon/gun/projectile/colt = 4,\
				/obj/item/weapon/gun/projectile/revolver/consul = 4,\
				/obj/item/weapon/gun/projectile/revolver = 4,\
				/obj/item/weapon/gun/projectile/automatic/IH_heavyrifle = 1,\
				/obj/item/weapon/gun/projectile/IH_sidearm = 2,\
				/obj/item/weapon/gun/projectile/automatic/IH_machinepistol = 2,\
				/obj/item/weapon/gun/projectile/automatic/IH_smg = 1,
				/obj/item/weapon/gun/launcher/crossbow = 1))
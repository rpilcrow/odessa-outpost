



/datum/gear/weapons
	display_name = "MELEE: Stun Baton"
	path = /obj/item/weapon/melee/baton
	sort_category = "Weapons"
	cost = 3

//	allowed_roles //Roles that can spawn with this item.

/datum/gear/weapons/bigwrench
	display_name = "MELEE (TOOL): Big Wrench"
	path = /obj/item/weapon/tool/wrench/big_wrench
/datum/gear/weapons/circsaw
	display_name = "MELEE (TOOL): Circular Saw"
	path = /obj/item/weapon/tool/saw/circular
/datum/gear/weapons/shovel
	display_name = "MELEE (TOOL): Familiar Shovel"
	path = /obj/item/weapon/tool/shovel/familiar
/datum/gear/weapons/handaxe
	display_name = "MELEE (TOOL): Hand Axe"
	path = /obj/item/weapon/tool/weapon/handaxe
/datum/gear/weapons/pick
	display_name = "MELEE (TOOL): Pickaxe"
	path = /obj/item/weapon/tool/pickaxe

/datum/gear/weapons/bbat
	display_name = "MELEE: Baseball Bat"
	path = /obj/item/weapon/material/twohanded/baseballbat
///datum/gear/weapons/gspear
//	display_name = "MELEE: Glass Spear"
//	path = /obj/item/weapon/material/twohanded/spear
/datum/gear/weapons/butterfly
	display_name = "MELEE: Butterfly Knife"
	path = /obj/item/weapon/material/butterfly
/datum/gear/weapons/butcher
	display_name = "MELEE: Butcher's Cleaver"
	path = /obj/item/weapon/material/knife/butch
/datum/gear/weapons/hatchet
	display_name = "MELEE: Hatchet"
	path = /obj/item/weapon/material/hatchet
/datum/gear/weapons/tacknife
	display_name = "MELEE: Tactical Knife"
	path = /obj/item/weapon/material/hatchet/tacknife

/datum/gear/weapons/soap
	display_name = "MELEE: Soap"
	path = /obj/item/weapon/soap
//	flags = GEAR_HAS_TYPE_SELECTION



/datum/gear/guns
	display_name = "PISTOL: FS HG .32 \"Giskard\""
	path = /obj/item/weapon/gun/projectile/giskard
	sort_category = "Weapons"
	cost = 6

/datum/gear/guns/mk58
	display_name = "PISTOL: NT HG .45 \"Mk58\""
	path = /obj/item/weapon/gun/projectile/mk58
	flags = GEAR_HAS_TYPE_SELECTION
/datum/gear/guns/paco
	display_name = "PISTOL: FS HG \"Paco\""
	path = /obj/item/weapon/gun/projectile/IH_sidearm
/datum/gear/guns/olivaw
	display_name = "PISTOL: FS HG .32 \"Olivaw\""
	path = /obj/item/weapon/gun/projectile/olivaw
/datum/gear/guns/clarissa
	display_name = "PISTOL: FS HG 9x19 \"Clarissa\""
	path = /obj/item/weapon/gun/projectile/clarissa

/datum/gear/guns/molly
	display_name = "PISTOL: FS MP 9x19 \"Molly\""
	path = /obj/item/weapon/gun/projectile/automatic/IH_machinepistol
	cost = 10

/datum/gear/guns/havelock
	display_name = "REVOLVER: FS REV .38 \"Havelock\""
	path = /obj/item/weapon/gun/projectile/revolver/detective

/datum/gear/guns/miller
	display_name = "REVOLVER: FS REV .357 \"Miller\""
	path = /obj/item/weapon/gun/projectile/revolver
	cost = 10
/datum/gear/guns/deckard
	display_name = "REVOLVER: FS REV .44 \"Deckard\""
	path = /obj/item/weapon/gun/projectile/revolver/deckard
	cost = 10

/datum/gear/guns/doublebarrel
	display_name = "SHOTGUN: Double-Barrel"
	path = /obj/item/weapon/gun/projectile/shotgun/doublebarrel

/datum/gear/guns/pumpshot
	display_name = "SHOTGUN: NT SG \"Regulator 1000\""
	path = /obj/item/weapon/gun/projectile/shotgun/pump
	cost = 10
/datum/gear/guns/martin
	display_name = "PISTOL (EN): FS PDW E \"Martin\""
	path = /obj/item/weapon/gun/energy/gun/martin
	cost = 10
/datum/gear/guns/crossbow
	display_name = "SNIPER: Powered Crossbow"
	path = /obj/item/weapon/gun/launcher/crossbow
	cost = 10





/////overrides

/datum/gear/accessory/holster
	allowed_roles = null//list("Ironhammer Commander","Ironhammer Gunnery Sergeant","Ironhammer Inspector","Ironhammer Medical Specialist","Ironhammer Operative","First Officer","Captain")
	sort_category = "Weapons"

/datum/gear/uniform/detcorporate
	allowed_roles = list("Dungeoneer","Field Medic","Armorer","Expedition Leader","Expedition Lieutenant")
	sort_category = "Faction: Dungeoneer"

/datum/gear/uniform/scrubs
	allowed_roles = list("Doctor","Field Medic")
	sort_category = "Faction: Medical"


/datum/gear/eyes/sciencegoggles
	display_name = "science goggles"
	path = /obj/item/clothing/glasses/powered/science
	allowed_roles = list("Scientist")
	sort_category = "Faction: Medical"

/datum/gear/eyes/security
	display_name = "security HUD"
	path = /obj/item/clothing/glasses/hud/security
	allowed_roles = list("Dungeoneer","Field Medic","Armorer","Expedition Leader","Expedition Lieutenant")
	sort_category = "Faction: Dungeoneer"


/datum/gear/head/beret/bsec_officer
	display_name = "beret, operative"
	path = /obj/item/clothing/head/sec/navy/officer
	allowed_roles = null//list("Ironhammer Operative")
	sort_category = "Faction: Dungeoneer"

/datum/gear/head/beret/bsec_warden
	allowed_roles = null//list("Armorer")
	sort_category = "Faction: Dungeoneer"

/datum/gear/head/beret/bsec_hos
	allowed_roles = list("Expedition Leader","Expedition Lieutenant")
	sort_category = "Faction: Dungeoneer"

/datum/gear/head/engineering
	sort_category = "Faction: Engineer"
	allowed_roles = list("Engineer")

/datum/gear/head/surgical
	allowed_roles = list("Doctor","Field Medic")
	sort_category = "Faction: Medical"

/datum/gear/head/corp
	display_name = "cap, inspector"
	path = /obj/item/clothing/head/seccorp
	allowed_roles = null
	sort_category = "Faction: Ironhammer"

/datum/gear/head/sec
	allowed_roles = list("Dungeoneer","Field Medic","Armorer","Expedition Leader","Expedition Lieutenant")
	sort_category = "Faction: Dungeoneer"






/datum/gear/suit/cloakcaptain
	display_name = "cloak, captain"
	path = /obj/item/clothing/suit/hooded/cloak/job/captain
	allowed_roles = null
	sort_category = "Faction: Command"

/datum/gear/suit/cloakfo
	display_name = "cloak, first officer"
	path = /obj/item/clothing/suit/hooded/cloak/job/fo
	allowed_roles = null
	sort_category = "Faction: Command"

/datum/gear/suit/cloakmeo
	display_name = "cloak, expedition overseer"
	path = /obj/item/clothing/suit/hooded/cloak/job/meo
	allowed_roles = null
	sort_category = "Faction: Medical"

/datum/gear/suit/cloakmbo
	display_name = "cloak, biolab officer"
	path = /obj/item/clothing/suit/hooded/cloak/job/mbo
	allowed_roles = null
	sort_category = "Faction: Medical"

/datum/gear/suit/cloakgm
	display_name = "cloak, guild merchant"
	path = /obj/item/clothing/suit/hooded/cloak/job/gm
	allowed_roles = null
	sort_category = "Faction: Dungeoneer"

/datum/gear/suit/cloakihc
	display_name = "cloak, ironhammer commander"
	path = /obj/item/clothing/suit/hooded/cloak/job/ihc
	allowed_roles = null
	sort_category = "Faction: Dungeoneer"

/datum/gear/suit/cloakte
	display_name = "cloak, technomancer exultant"
	path = /obj/item/clothing/suit/hooded/cloak/job/te
	allowed_roles = null
	sort_category = "Faction: Engineer"

/datum/gear/suit/cloakservice
	display_name = "cloak, service"
	path = /obj/item/clothing/suit/hooded/cloak/job/service
	allowed_roles = null

/datum/gear/suit/cloakguild
	display_name = "cloak, guild"
	path = /obj/item/clothing/suit/hooded/cloak/job/guild
	allowed_roles = null
	sort_category = "Faction: Dungeoneer"

/datum/gear/suit/cloakmining
	display_name = "cloak, guild miner"
	path = /obj/item/clothing/suit/hooded/cloak/job/mining
	allowed_roles = null
	sort_category = "Faction: Dungeoneer"

/datum/gear/suit/cloakmedical
	display_name = "cloak, moebius medical"
	path = /obj/item/clothing/suit/hooded/cloak/job/medical
	allowed_roles = null
	sort_category = "Faction: Medical"

/datum/gear/suit/cloakscience
	display_name = "cloak, moebius research"
	path = /obj/item/clothing/suit/hooded/cloak/job/science
	allowed_roles = null
	sort_category = "Faction: Medical"

/datum/gear/suit/cloaktechnomancer
	display_name = "cloak, technomancer"
	path = /obj/item/clothing/suit/hooded/cloak/job/technomancer
	allowed_roles = null
	sort_category = "Faction: Engineer"

/datum/gear/suit/cloakironhammer
	display_name = "cloak, ironhammer"
	path = /obj/item/clothing/suit/hooded/cloak/job/ironhammer
	allowed_roles = null
	sort_category = "Faction: Dungeoneer"
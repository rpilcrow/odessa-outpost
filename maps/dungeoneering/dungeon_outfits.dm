/decl/hierarchy/outfit/job/security/ihoper
	name = OUTFIT_JOB_NAME("Dungeoneer")
	l_pocket = /obj/item/device/flash
	uniform = /obj/item/clothing/under/rank/security
	suit = null///obj/item/clothing/suit/armor/vest/security
	mask = null///obj/item/clothing/mask/balaclava/tactical
	glasses = null///obj/item/clothing/glasses/sechud/tactical
	head = null///obj/item/clothing/head/helmet
	gloves = null///obj/item/clothing/gloves/stungloves
	backpack_contents = list(/obj/item/weapon/handcuffs = 1, /obj/item/device/lighting/toggleable/flashlight/seclite = 1, /obj/item/weapon/cell/small/high = 2)

/decl/hierarchy/outfit/job/security/gunserg
	name = OUTFIT_JOB_NAME("Armorer")
	uniform = /obj/item/clothing/under/rank/warden
	suit = null ///obj/item/clothing/suit/armor/vest/security
	head = /obj/item/clothing/head/sec/navy/warden
	glasses = null///obj/item/clothing/glasses/sechud/tactical
	l_pocket = /obj/item/device/flash
	gloves = null///obj/item/clothing/gloves/stungloves
	backpack_contents = list(/obj/item/weapon/handcuffs = 1, /obj/item/device/lighting/toggleable/flashlight/seclite = 1, /obj/item/weapon/cell/small/high = 2, /obj/item/weapon/gun/energy/gun/martin = 1)


/decl/hierarchy/outfit/job/hop
	name = OUTFIT_JOB_NAME("Expedition Lieutenant")
	uniform = /obj/item/clothing/under/rank/first_officer
	suit = /obj/item/clothing/suit/armor/vest
	l_ear = /obj/item/device/radio/headset/heads/captain
	shoes = /obj/item/clothing/shoes/reinforced
	gloves = /obj/item/clothing/gloves/thick
	id_type = /obj/item/weapon/card/id/hop
	pda_type = /obj/item/modular_computer/pda/heads/hop
	backpack_contents = list(/obj/item/weapon/storage/box/ids = 1)



/obj/structure/closet/secure_closet/personal/security
	name = "Dungeoneer locker"
	req_access = list(access_hop)
	access_occupy = list(access_brig)
	icon_state = "sec"

/obj/structure/closet/secure_closet/personal/security/populate_contents()
	new /obj/item/weapon/storage/backpack/security(src)
	new /obj/item/weapon/storage/backpack/satchel/sec(src)
	new /obj/item/device/radio/headset/headset_sec(src)
	new /obj/item/weapon/storage/belt/security(src)
//	new /obj/item/clothing/mask/gas/ihs(src)
//	new /obj/item/clothing/glasses/sechud/tactical(src)
//	new /obj/item/ammo_magazine/sol65/rubber(src)
//	new /obj/item/ammo_magazine/sol65/rubber(src)
//	new /obj/item/weapon/gun/projectile/automatic/sol/rds(src)
//	new /obj/item/ammo_magazine/a10mm/rubber(src)
//	new /obj/item/ammo_magazine/a10mm/rubber(src)
//	new	/obj/item/weapon/gun/projectile/IH_sidearm(src)
	new /obj/item/weapon/storage/pouch/pistol_holster(src)
	new /obj/item/weapon/storage/pouch/baton_holster(src)
	new /obj/item/weapon/tool/tape_roll()
/*	var/randweapon = /obj/item/weapon/melee/baton
	if(prob(75))
		randweapon = pick(/obj/item/weapon/melee/baton,
		/obj/item/weapon/tool/shovel,
		/obj/item/weapon/tool/wrench/big_wrench,
		/obj/item/weapon/tool/saw/circular,
		/obj/item/weapon/material/twohanded/baseballbat,
		/obj/item/weapon/material/twohanded/spear,
		/obj/item/weapon/material/butterfly,
		/obj/item/weapon/material/knife/butch,
		/obj/item/weapon/material/hatchet,
		/obj/item/weapon/material/hatchet/tacknife,
		/obj/item/weapon/tool/pickaxe)
	else
		randweapon = pick(/obj/item/weapon/gun/projectile/giskard,
		/obj/item/weapon/gun/projectile/mk58,
		/obj/item/weapon/gun/projectile/IH_sidearm,
		/obj/item/weapon/gun/projectile/revolver/detective,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/weapon/gun/projectile/shotgun/doublebarrel,
		/obj/item/weapon/gun/projectile/shotgun/pump/combat,
		/obj/item/weapon/gun/energy/gun/martin,
		/obj/item/weapon/soap)
	new randweapon (src)*/

/obj/structure/closet/secure_closet/medspec
	name = "Field Medic locker"
	req_access = list(access_medspec)
	icon_state = "sec"

/obj/structure/closet/secure_closet/medspec/populate_contents()
//	new /obj/item/clothing/glasses/sechud/tactical(src)
//	new /obj/item/clothing/mask/gas/ihs(src)
//	new /obj/item/taperoll/police(src)
	new /obj/item/clothing/under/rank/medspec(src)
	new /obj/item/device/radio/headset/headset_sec(src)
	new /obj/item/weapon/storage/belt/security(src)
	new /obj/item/clothing/shoes/reinforced(src)
//	new /obj/item/clothing/gloves/stungloves(src)
	new /obj/item/weapon/cell/medium/high(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/medspec(src)
//	new /obj/item/ammo_magazine/smg9mm/rubber(src)
//	new /obj/item/weapon/gun/projectile/automatic/IH_machinepistol(src)
	new /obj/item/weapon/storage/pouch/pistol_holster(src)
	new /obj/item/weapon/storage/pouch/baton_holster(src)
	new /obj/item/weapon/tool/tape_roll()
//	var/randweapon = /obj/item/weapon/melee/baton
/*	if(prob(75))
		randweapon = pick(/obj/item/weapon/melee/baton,
		/obj/item/weapon/tool/wrench/big_wrench,
		/obj/item/weapon/tool/saw/circular,
		/obj/item/weapon/material/twohanded/baseballbat,
		/obj/item/weapon/material/twohanded/spear,
		/obj/item/weapon/material/butterfly,
		/obj/item/weapon/material/knife/butch,
		/obj/item/weapon/material/hatchet/tacknife,
		/obj/item/weapon/tool/scalpel,
		/obj/item/weapon/tool/scalpel/advanced,
		/obj/item/weapon/tool/scalpel/laser,
		/obj/item/weapon/tool/pickaxe)
	else
		randweapon = pick(/obj/item/weapon/gun/projectile/giskard,
		/obj/item/weapon/gun/projectile/mk58,
		/obj/item/weapon/gun/projectile/IH_sidearm,
		/obj/item/weapon/gun/projectile/revolver/detective,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/weapon/gun/projectile/shotgun/doublebarrel,
		/obj/item/weapon/gun/projectile/shotgun/pump/combat,
		/obj/item/weapon/gun/energy/gun/martin,
		/obj/item/weapon/soap)
	new randweapon (src)*/
//	new /obj/item/weapon/storage/briefcase/crimekit(src)

/obj/structure/closet/secure_closet/warden
	name = "Armorer locker"
	req_access = list(access_armory)
	icon_state = "warden"

/obj/structure/closet/secure_closet/warden/populate_contents()
	new /obj/item/weapon/storage/backpack/security(src)
	new /obj/item/weapon/storage/backpack/satchel/sec(src)
	new /obj/item/clothing/under/rank/warden(src)
//	new /obj/item/clothing/head/sec/navy/warden(src)
	new /obj/item/device/radio/headset/headset_sec(src)
//	new /obj/item/clothing/glasses/sechud/tactical(src)
	new /obj/item/weapon/storage/belt/security(src)
//	new /obj/item/clothing/mask/gas/ihs(src)
	new /obj/item/weapon/storage/box/teargas(src)
	new /obj/item/weapon/storage/box/flashbangs(src)
//	new /obj/item/ammo_magazine/a10mm/rubber(src)
//	new /obj/item/ammo_magazine/a10mm/rubber(src)
//	new	/obj/item/weapon/gun/projectile/IH_sidearm(src)
//	new /obj/item/ammo_magazine/sol65/rubber(src)
//	new /obj/item/ammo_magazine/sol65/rubber(src)
//	new /obj/item/weapon/gun/projectile/automatic/sol/rds(src)
//	new /obj/item/weapon/storage/box/holobadge(src)
//	new /obj/item/clothing/accessory/badge/warden(src)
	new /obj/item/weapon/storage/pouch/pistol_holster(src)
	new /obj/item/weapon/storage/pouch/baton_holster(src)
//	var/randweapon = /obj/item/weapon/melee/baton
/*	if(prob(33))
		randweapon = pick(/obj/item/weapon/melee/baton,
		/obj/item/weapon/tool/shovel,
		/obj/item/weapon/tool/wrench/big_wrench,
		/obj/item/weapon/tool/saw/circular,
		/obj/item/weapon/material/twohanded/baseballbat,
		/obj/item/weapon/material/twohanded/spear,
		/obj/item/weapon/material/butterfly,
		/obj/item/weapon/material/knife/butch,
		/obj/item/weapon/material/hatchet,
		/obj/item/weapon/material/hatchet/tacknife,
		/obj/item/weapon/tool/pickaxe)
	else
		randweapon = pick(/obj/item/weapon/gun/projectile/giskard,
		/obj/item/weapon/gun/projectile/mk58,
		/obj/item/weapon/gun/projectile/IH_sidearm,
		/obj/item/weapon/gun/projectile/revolver/detective,
		/obj/item/weapon/gun/projectile/revolver,
		/obj/item/weapon/gun/projectile/shotgun/doublebarrel,
		/obj/item/weapon/gun/projectile/shotgun/pump/combat,
		/obj/item/weapon/gun/energy/gun/martin,
		/obj/item/weapon/soap)
	new randweapon (src)*/
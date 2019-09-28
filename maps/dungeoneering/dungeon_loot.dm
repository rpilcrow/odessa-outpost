////////////////////////////////////////
//////////////general loot//////////////

/obj/item/weapon/reagent_containers/food/snacks/breakfast
	name = "breakfast"
	desc = "Looks like there's no more loot to give."
	price_tag = 0
	icon = 'icons/obj/dungeon_item.dmi'
	icon_state = "breakfast"
	filling_color = "#FFFFEE"
	bitesize = 1
	center_of_mass = list("x"=15, "y"=15)
	nutriment_amt = 1
	nutriment_desc = list("stale milk" = 10)

/obj/item/heartcontainer
	name = "heart container"
	desc = ""
	icon = 'icons/obj/dungeon_item.dmi'
	icon_state = "heartcontainer"
	item_state = ""
	w_class = ITEM_SIZE_SMALL
	force = 0
	matter = list(MATERIAL_GOLD = 4, MATERIAL_GLASS = 4)
	matter_reagents = list("tricordrazine" = 100)

/obj/item/heartcontainer/attack_self(mob/user)
	if(ishuman(user))
		var/mob/living/L = user
		L.visible_message(SPAN_NOTICE("[user] uses \the [src]."),SPAN_NOTICE("You use \the [src] and feel more lively."))
		playsound(L, 'sound/ambience/ambicha3.ogg', 75, 1)
		L.maxHealth += 20
		L.heal_overall_damage(20,20)
		L.remove_from_mob(src)
		loc = null
		qdel(src)

////////////////////////////////////////
//////////////////guns//////////////////

/obj/item/weapon/gun/energy/laser/sawnoff
	name = "NT SLG \"Shortfall\""
	desc = "\"NeoTheology\" brand laser carbine, a variant of the 'Lightfall' with a shortened barrel, bayonet, and no stock."
	icon = 'icons/obj/dungeon_item.dmi'
	icon_state = "sawnoff"
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	matter = list(MATERIAL_PLASTEEL = 22, MATERIAL_WOOD = 4, MATERIAL_SILVER = 5)
	projectile_type = /obj/item/projectile/beam/midlaser/less

/obj/item/projectile/beam/midlaser/less
	damage = 20

/obj/item/weapon/gun/energy/pulse/cassad/gold
	name = "FS PR \"Cassad Gold\""
	desc = "\"Frozen Star\" brand energy assault rifle, capable of prolonged combat. This one has been extensively modified and painted gold."
	icon = 'icons/obj/dungeon_item.dmi'
	icon_state = "cassad-gold"
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_PLASTIC = 8, MATERIAL_GOLD = 6, MATERIAL_URANIUM = 6)
	sel_mode = 1
	fire_delay = 10

	firemodes = list(
		list(mode_name="DESTROY", projectile_type=/obj/item/projectile/beam/pulse, fire_sound='sound/weapons/pulse.ogg', fire_delay=null, charge_cost=null, icon="destroy"),
	)


/obj/item/weapon/gun/energy/laser/pblaster
	name = "PR LG \"Strife\""
	desc = "The Perimeter \"Strife\", a compact laser blaster that carries all the power of a full laser carbine."
	icon = 'icons/obj/dungeon_item.dmi'
	icon_state = "blaster"
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_WEAK
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_WOOD = 4, MATERIAL_SILVER = 5, MATERIAL_URANIUM = 5)
	projectile_type = /obj/item/projectile/beam/midlaser/pblaster

/obj/item/projectile/beam/midlaser/pblaster
	muzzle_type = /obj/effect/projectile/laser_blue/muzzle
	tracer_type = /obj/effect/projectile/laser_blue/tracer
	impact_type = /obj/effect/projectile/laser_blue/impact

/obj/item/weapon/gun/energy/prism
	name = "Redemption"
	desc = "Ascend."
	icon = 'icons/obj/dungeon_item.dmi'
	icon_state = "prism"
	item_state = "laser"
	fire_sound = 'sound/weapons/Laser.ogg'
//	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_NORMAL
	origin_tech = list(TECH_COMBAT = 7, TECH_MAGNET = 7, TECH_PLASMA = 7)
	price_tag = 7777
	self_recharge = 1
	charge_meter = 0
	charge_cost = 50
	matter = list(MATERIAL_DIAMOND = 7, MATERIAL_PLASMA = 7, MATERIAL_SILVER = 7)
	projectile_type = /obj/item/projectile/beam/rainbow

/obj/item/projectile/beam/rainbow
	damage = 20
	armor_penetration = 10
	muzzle_type = /obj/effect/projectile/rainbow/muzzle
	tracer_type = /obj/effect/projectile/rainbow/tracer
	impact_type = /obj/effect/projectile/rainbow/impact

/obj/effect/projectile/rainbow
	icon = 'icons/effects/projectiles_dungeon.dmi'

///obj/effect/projectile/rainbow/activate(kill_delay = 3)
//	color = pick("#ffaaaa","#aaffaa","#aaaaff","#ffffaa","#ffaaff","#aaffff")
//	return ..(kill_delay)

/obj/effect/projectile/rainbow/tracer
	icon_state = "rainbow"

/obj/effect/projectile/rainbow/muzzle
	icon_state = "m_rainbow"

/obj/effect/projectile/rainbow/impact
	icon_state = "i_rainbow"

////////////////////////////////////////
/////////////////shovels////////////////

/obj/item/weapon/tool/shovel/familiar
	name = "familiar shovel"
	desc = "A well-used shovel with a honed edge. There are many shovels in the world just like it, but this one is yours."
	icon = 'icons/obj/dungeon_item.dmi'
	icon_state = "familiarshovel"
	item_state = "shovel"
	force = WEAPON_FORCE_DANGEROUS

/obj/item/weapon/tool/shovel/robust
	name = "knightly shovel"
	desc = "For preaching the tenets of shovelry."
	icon = 'icons/obj/dungeon_item.dmi'
	icon_state = "shovelry"
	item_state = "shovel"
	force = WEAPON_FORCE_ROBUST
	attack_verb = list("bashed", "bludgeoned", "smashed", "whacked","slashed","shoveled")

/obj/item/weapon/tool/shovel/spade/maingauche
	name = "parrying digger"
	desc = "A small tool for digging, moving dirt, and turning aside the blades of evildoers."
	icon = 'icons/obj/dungeon_item.dmi'
	icon_state = "maingauche"
	item_state = "spade"
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_NORMAL
	attack_verb = list("bashed", "bludgeoned", "smashed", "whacked","slashed","shoveled")

/obj/item/weapon/tool/shovel/spade/maingauche/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(default_parry_check(user, attacker, damage_source) && prob(33))
		user.visible_message(SPAN_DANGER("\The [user] parries [attack_text] with \the [src]!"))
		playsound(user.loc, 'sound/weapons/punchmiss.ogg', 50, 1)
		return 1
	return 0


/*
	flags = CONDUCT
	slot_flags = SLOT_BELT

	throwforce = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 1, TECH_ENGINEERING = 1)
	matter = list(MATERIAL_STEEL = 5)
	attack_verb = list("bashed", "bludgeoned", "thrashed", "whacked")
	sharp = FALSE
	edge = TRUE
	tool_qualities = list(QUALITY_SHOVELING = 30, QUALITY_DIGGING = 30, QUALITY_EXCAVATION = 10)*/

/obj/item/weapon/tool/shovel/ravedigger
	name = "ravedigger"
	desc = "Some arcane process has combined a shovel and a glowstick, and it lights up when you smack things with it."
	icon = 'icons/obj/dungeon_item.dmi'
	icon_state = "ravedigger"
	item_state = "shovel"
	force = WEAPON_FORCE_DANGEROUS
	var/rave_glowing = 0
	var/brightness_on = 4
	glow_color = "#78fec0"
	tool_qualities = list(QUALITY_SHOVELING = 25, QUALITY_DIGGING = 25, QUALITY_EXCAVATION = 10)

/obj/item/weapon/tool/shovel/ravedigger/resolve_attackby(atom/A, mob/user, params)
	. = ..()
	if(isBroken)
		return
	if(. && loc == user)
		start_glowing()

/obj/item/weapon/tool/shovel/ravedigger/proc/start_glowing()
	if(!rave_glowing)
		START_PROCESSING(SSobj, src)
	rave_glowing = min(rave_glowing+force,60)
	update_icon()

/obj/item/weapon/tool/shovel/ravedigger/Process()
	rave_glowing = max(rave_glowing-1,0)
	if(!rave_glowing)
		update_icon()
		STOP_PROCESSING(SSobj, src)

/obj/item/weapon/tool/shovel/ravedigger/update_icon()
	. = ..()
	if(rave_glowing)
		overlays += "ravedigger-on"
		set_light(l_range = brightness_on, l_power = 1.3, l_color = glow_color)
	else
		set_light(l_range = 0, l_power = 0, l_color = glow_color)

/obj/item/weapon/tool/shovel/ravedigger/examine(mob/user)
	..()
	if(rave_glowing)
		to_chat(user,SPAN_NOTICE("It is glowing [rave_glowing > 30 ? "brightly" : "dimly"]."))


////////////////////////////////////////
/////////////////weapons////////////////

/obj/item/weapon/tool/weapon
	name = "weapon"
	desc = "A dungeon weapon."
	icon = 'icons/obj/dungeon_item.dmi'
	icon_state = "weapon"
	item_state = "claymore"
	sharp = TRUE
	edge = TRUE
	flags = CONDUCT
	force = WEAPON_FORCE_DANGEROUS
	attack_verb = list("attacked", "slashed", "cut")
	origin_tech = list(TECH_ENGINEERING = 1)
	matter = list(MATERIAL_STEEL = 4)
	worksound = WORKSOUND_HARD_SLASH
	w_class = ITEM_SIZE_NORMAL
	throw_speed = WEAPON_FORCE_WEAK
	throw_range = 5
	embed_mult = 0 //embedding is janky as fuck. for now, no.

/obj/item/weapon/tool/weapon/sword
	name = "Longsword"
	desc = "A basic blade."
	icon_state = "sword"
	force = WEAPON_FORCE_ROBUST
	tool_qualities = list(QUALITY_CUTTING = 10, QUALITY_WIRE_CUTTING = 10)

/obj/item/weapon/tool/weapon/handaxe
	name = "hand axe"
	desc = "A small tool designed for chopping, but can be put to use for other purposes."
	icon_state = "axe"
	item_state = "hatchet"
	attack_verb = list("attacked", "slashed", "chopped", "hacked", "cut")
	tool_qualities = list(QUALITY_CUTTING = 10, QUALITY_WIRE_CUTTING = 10)


////////////////////////////////////////
//////////////other tools///////////////

/obj/item/weapon/tool/saw/machete
	name = "billed machete"
	desc = "A billed machete with a saw blade, that can be used to pry and saw in a pinch."
	icon = 'icons/obj/dungeon_item.dmi'
	icon_state = "sawchete"
	force = WEAPON_FORCE_DANGEROUS
	attack_verb = list("attacked", "slashed", "sawed", "cut")
	tool_qualities = list(QUALITY_SAWING = 25, QUALITY_CUTTING = 20, QUALITY_WIRE_CUTTING = 20, QUALITY_PRYING = 20, QUALITY_DIGGING = 10)
	embed_mult = 0.5

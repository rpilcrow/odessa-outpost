/obj/structure/spikes //a cross between beartraps and shards
	name = "spike trap"
	desc = "A set of nasty-looking spikes."
	icon = 'icons/obj/dungeon.dmi'
	icon_state = "spikes"
	gender = PLURAL

	var/base_damage = 15
	var/min_size = 5
	var/list/aware_mobs = list()
	var/list/last_stabs = list()
	var/target_zone
	var/stab_sound = 'sound/weapons/slice.ogg'

/obj/structure/spikes/proc/attack_mob(mob/living/L)
	if (!L || L.mob_size < min_size)
		return

	if("\ref[L]" in last_stabs)
		if(last_stabs["\ref[L]"] > world.time) //prevent abuse through repeatedly pulling a mob onto spikes
			return
	else
		last_stabs |= "\ref[L]"

	last_stabs["\ref[L]"] = world.time+15 //0.75 stab/sec

	if(L.lying)
		target_zone = ran_zone()
	else
		target_zone = pick("l_leg", "r_leg")

	//armour
	if( L.damage_through_armor(base_damage, BRUTE, target_zone, ARMOR_MELEE, used_weapon = src) )
		shake_camera(L, 2, 1)
		L.Stun(1)
		L.visible_message(
			"<span class='danger'>[L] is stabbed by \the [src]!</span>",
			"<span class='danger'>You are stabbed by \the [src]!</span>",
			"<b>You hear a stab!</b>"
			)
		playsound(src, stab_sound, 100, 1,10,10)
	else
		L.visible_message(
			"<span class='warning'>[L] is stabbed by \the [src].</span>",
			"<span class='warning'>You are stabbed by \the [src], and your armor protects you.</span>",
			"<b>You hear a muffled stab!</b>"
			)
		playsound(src, 'sound/weapons/Genhit.ogg', 25, 1)
	return 1

//	to_chat(L, "<span class='danger'>You step in \the [src]!</span>")


	//If the victim is nonhuman and has no client, start processing.
//	if (!ishuman(L) && !L.client)
//		START_PROCESSING(SSobj, src)

/obj/structure/spikes/update_icon()
	..()
	if(last_stabs.len)
		icon_state = "[initial(icon_state)]-bloody"
	else
		icon_state = initial(icon_state)


/obj/structure/spikes/attackby(obj/item/C, mob/living/user)
	if (C.has_quality(QUALITY_WIRE_CUTTING))
		user.visible_message("<span class='notice'>[user] cuts \the [src] with their [C].</span>")
		new /obj/item/stack/rods (loc, rand(1,2))
		new /obj/item/weapon/material/shard/shrapnel(loc)
		qdel(src)
		return
	.=..()


/obj/structure/spikes/short
	name = "short spikes"
	desc = "A set of nasty-looking spikes that pose a hazard when walked across."
	icon_state = "spikes-short"
	var/integrity = 100

/obj/structure/spikes/short/Crossed(AM as mob|obj)
	if(isliving(AM))
		var/mob/living/L = AM
		if(("\ref[L]" in aware_mobs) && MOVING_DELIBERATELY(L))
			return ..()
		attack_mob(L)
		update_icon()
	//	to_chat(world, "Spikes at [x],[y],[z] stabbed [AM]")

/obj/structure/spikes/short/examine(mob/user)
	..()
	if(isliving(user))
		if(!("\ref[user]" in aware_mobs))
			to_chat(user, SPAN_NOTICE("You're aware of this trap, now. You won't step in it when walking carefully."))
			aware_mobs |= "\ref[user]"
		to_chat(user,SPAN_NOTICE("It's [integrity]% intact."))

/obj/structure/spikes/short/attack_mob(mob/living/L)
	. = ..(L)
	if(.)
		integrity -= rand(base_damage,base_damage*4)
		if(integrity < 0)
			playsound(src, 'sound/effects/snap.ogg', 25, 1)
			visible_message("<span class='warning'>\The [src] break!</span>")
			if(prob(25))
				new /obj/item/stack/rods (loc, 1)
			new /obj/item/weapon/material/shard/shrapnel(loc)
			qdel(src)

/obj/structure/spikes/long
	name = "long spikes"
	desc = "A set of nasty-looking spikes that only pose a hazard if fallen upon."
	icon_state = "spikes"
	base_damage = 30

/obj/structure/spikes/long/fallen_on(atom/movable/mover)
	if(istype(mover,/mob/living))
		attack_mob(mover)
		update_icon()
	//	to_chat(world, "Spikes at [x],[y],[z] stabbed [mover]")



/datum/craft_recipe/dungeon_spikes_l
	name = "Long Spikes"
	result = /obj/structure/spikes/long
	time = WORKTIME_INSTANT
	steps = list(
		list(/obj/item/stack/rods, 5),
		list(QUALITY_WIRE_CUTTING, 20, "time" = WORKTIME_SLOW)
	)
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	related_stats = list(STAT_MEC)

/datum/craft_recipe/dungeon_spikes_s
	name = "Short Spikes"
	result = /obj/structure/spikes/short
	time = WORKTIME_INSTANT
	steps = list(
		list(/obj/item/stack/rods, 4),
		list(QUALITY_WIRE_CUTTING, 20, "time" = WORKTIME_SLOW)
	)
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	related_stats = list(STAT_MEC)
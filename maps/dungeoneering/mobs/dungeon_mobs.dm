//////////////////////////////////////////////
////////////////////IMP///////////////////////
//////////////////////////////////////////////
// Standard drone.

/mob/living/carbon/superior_animal/synth
	name = "Demon Frame"
	desc = "A bipedal drone with a rogue intelligence."

	mob_size = MOB_MEDIUM //MOB_MINISCULE MOB_TINY MOB_SMALL MOB_MEDIUM MOB_LARGE

	icon = 'icons/mob/dungeon.dmi'
	icon_state = "synth1"

	randpixel = 3 //Mob may be offset randomly on both axes by this much

	overkill_gib = 17 //0 to disable, gib when at maxhealth*2 brute loss and hit with at least overkill_gib brute damage
	overkill_dust = 20 //0 to disable, dust when at maxhealth*2 fire loss and hit with at least overkill_dust fire damage, or from 2*max_bodytemperature

	emote_see = list("whirrs.","beeps.","clicks.") //chat emotes
	speak_chance = 2 //percentage chance of speaking a line from 'emote_see'

	contaminant_immunity = 1 //if 1, mob is immune to harmful contaminants in air (plasma), skin contact, does not relate to breathing
	cold_protection = 1 //0 to 1 value, which corresponds to the percentage of protection, affects only bodytemperature
	breath_required_type = 0 //0 to disable, oxyloss if absent in sufficient quantity
	breath_poison_type = 0 //0 to disable, toxloss if present in sufficient quantity
	min_breath_required_type = 0 //minimum portion of gas in a single breath
	min_breath_poison_type = 0 //minimum portion of gas in a single breath

	min_air_pressure = 0 //below this, brute damage is dealt
	max_air_pressure = 300 //above this, brute damage is dealt
	min_bodytemperature = 50 //below this, burn damage is dealt
	max_bodytemperature = 360 //above this, burn damage is dealt

	maxHealth = 30
	health = 30

	deathmessage = "shuts down."
	attacktext = "cut"
	attack_sound = 'sound/weapons/spiderlunge.ogg'
	attack_sound_chance = 33
	attack_sound_volume = 20

	meat_type = /obj/item/stack/material/steel/random //obj/item/stack/material/plasteel/random
	meat_amount = 1

	melee_damage_lower = 3
	melee_damage_upper = 12

	can_burrow = FALSE

	faction = "hksynth"

/mob/living/carbon/superior_animal/synth/findTarget()
	. = ..()
	if(.)
		visible_emote("focuses on [.]!")
//		playsound(src, 'sound/voice/insect_battle_screeching.ogg', 30, 1, -3)

/mob/living/carbon/superior_animal/synth/gib()
	..("gibbed-r",0)
	gibs(loc, null, /obj/effect/gibspawner/robot)

/mob/living/carbon/superior_animal/synth/dust()
	..("dust-r", /obj/item/remains/robot)

/mob/living/carbon/superior_animal/synth/death(gibbed)
	. = ..(gibbed)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(5, 1, src)
	s.start()


/mob/living/carbon/superior_animal/synth/proc/telegraph()


//////////////////////////////////////////////
//////////////////LUCIFER/////////////////////
//////////////////////////////////////////////
// Flying laser drone.

/mob/living/carbon/superior_animal/synth/shooter
	name = "Lucifer Frame"
	desc = "A flying drone with a rogue intelligence, armed with a laser."
	icon_state = "synth4"
	var/shoot_target
	var/projectiletype = /obj/item/projectile/beam//pulse
	var/ideal_dist = 3

/mob/living/carbon/superior_animal/synth/shooter/stun
	name = "T-Type Lucifer Frame"
	desc = "A flying drone with a rogue intelligence, armed with an electrotaser."
	icon_state = "synth4-T"
	projectiletype = /obj/item/projectile/beam/stun
	attacktext = "hit"
	melee_damage_upper = 6

/mob/living/carbon/superior_animal/synth/shooter/special_ai_handling()
	if(target_mob)
		if(get_dist(src,target_mob) < ideal_dist)
			step_away(src,target_mob)
		else if(get_dist(src,target_mob) > ideal_dist)
			step_to(src,target_mob)

	if(shoot_target)
		if(destroy_surroundings)
			destroySurroundings()
		prepareAttackOnTarget()
		return 1

	if(stance == HOSTILE_STANCE_ATTACK)
		if(destroy_surroundings)
			destroySurroundings()

		stop_automated_movement = 1
		stance = HOSTILE_STANCE_ATTACKING
//		if(prob(50))
//			step_to(src,target_mob)
//		else
//			step(src,pick(cardinal))

//			set_glide_size(DELAY2GLIDESIZE(move_to_delay))
//			walk_to(src, target_mob, 1, move_to_delay)
		return 1
	return 0

/mob/living/carbon/superior_animal/synth/shooter/prepareAttackOnTarget()
	stop_automated_movement = 1

	if(!shoot_target)

		if (!target_mob || !isValidAttackTarget(target_mob))
			loseTarget()
			return

		if (!(target_mob in getPotentialTargets()))
			loseTarget()
			return

	//if(!shoot_target)
		if(!Adjacent(target_mob) || prob(50))
			shoot_target = get_turf(target_mob)
			telegraph()
			return


	attemptAttackOnTarget()


/mob/living/carbon/superior_animal/synth/shooter/loseTarget()
	. = ..()
	shoot_target = null
	if(stat != DEAD)
		target_mob = findTarget()

/mob/living/carbon/superior_animal/synth/shooter/death()
	. = ..()
	shoot_target = null

/mob/living/carbon/superior_animal/synth/shooter/attemptAttackOnTarget()
	if(shoot_target)
		return rangedAttack(shoot_target)
	if (!Adjacent(target_mob))
		return

	return UnarmedAttack(target_mob,1)

/mob/living/carbon/superior_animal/synth/shooter/telegraph()
	playsound(shoot_target, 'sound/weapons/flash.ogg', attack_sound_volume, 1)
	new /obj/effect/temp_visual/targetzone (shoot_target)

/mob/living/carbon/superior_animal/synth/shooter/proc/rangedAttack(var/atom/A)
	// gun stuff here
	if(!A)
		shoot_target = null
		return
	dir = get_dir(src,A)
	var/obj/item/projectile/P = new projectiletype(loc)
	playsound(loc,'sound/weapons/lasercannonfire.ogg',100,1)
	if(!P)
		shoot_target = null
		return

	if(target_mob)

		var/def_zone = get_exposed_defense_zone(target_mob)

		if(target_mob in A)
			P.launch(target_mob, def_zone)
		else
			P.launch(A, def_zone)

		if(!isValidAttackTarget(target_mob) || !(target_mob in getPotentialTargets()))
			loseTarget()
			return

		shoot_target = get_turf(target_mob)
		telegraph()
	else
		P.launch(A, ran_zone())
		loseTarget()



/mob/living/carbon/superior_animal/synth/shooter/can_fall(turf/below, turf/simulated/open/dest = src.loc)
	if ((stat != CONSCIOUS) || !canmove || resting || lying)
		return ..()
	return FALSE


//////////////////////////////////////////////
///////////////////AZAZEL/////////////////////
//////////////////////////////////////////////
// Heavy 'tank type' drone.
// TODO: charge rush, self-destruct


/mob/living/carbon/superior_animal/synth/striker
	name = "Azazel Frame"
	desc = "A heavy bipedal drone with a rogue intelligence, designed for heavy lifting and deconstruction."
	icon_state = "synth2"
	maxHealth = 60
	health = 60
	meat_type = /obj/item/stack/material/steel/random //obj/item/stack/material/plasteel/random

//////////////////////////////////////////////
//////////////////SOLOMON/////////////////////
//////////////////////////////////////////////
// Factory-type drone.
// TODO: Escape AI, drone fabrication
/*
/mob/living/carbon/superior_animal/synth/constructor
	name = "Solomon Frame"
	desc = "A bipedal drone with a rogue intelligence."
	meat_type = /obj/item/stack/material/plasteel/random
	var/produce_type = /mob/living/carbon/superior_animal/synth
*/




//////////////////////////////////////////////
//////////////////effects/////////////////////
//////////////////////////////////////////////



/obj/effect/temp_visual/targetzone
	icon_state = "reticule"
	icon = 'icons/effects/dungeoneff.dmi'
	duration = 10 //in deciseconds
	randomdir = FALSE

/obj/effect/temp_visual/targetzone/Move()
	new /obj/effect/temp_visual/targetfollower(loc)
	. = ..()

/obj/effect/temp_visual/targetzone/Bump()
	..()
	walk(src,0)

/obj/effect/temp_visual/targetfollower
	icon_state = "follower"
	icon = 'icons/effects/dungeoneff.dmi'
	duration = 10 //in deciseconds
	randomdir = FALSE

/obj/effect/temp_visual/targetzone/rush
	icon_state = "cultfloor" //temp
	icon = 'icons/effects/dungeoneff.dmi'
//////////////////////////////////////////////
//////////////////THAUMIEL////////////////////
//////////////////////////////////////////////
// Heavy eradicator drone.
// TODO: Eight-way multilaser, scatter laser ,single-target shoot, charge rush, self-destruct


/mob/living/carbon/superior_animal/synth/boss
	name = "Thaumiel Frame"
	desc = "A highly-advanced drone with a rogue intelligence, armed to the gills with weaponry, and protected by a high-grade shield. Facing one on your own is inadvisable."
	icon_state = "synth3" //TODO: new icon
	maxHealth = 1000
	health = 1000
	meat_type = /obj/item/stack/material/plasteel/random
	meat_amount = 3
	wander = 0
	anchored = TRUE
	var/attack_mode = 0
	var/attack_target
	var/projectiletype = /obj/item/projectile/beam
	var/rage = 0 //ticks up as long as it has a target, and ensures it keeps attacking even if it doesn't have a target

/mob/living/carbon/superior_animal/synth/boss/special_ai_handling()

	if(target_mob)
		rage = min(10,rage+1)
		if(!(target_mob in getPotentialTargets()) && !isValidAttackTarget(target_mob))
			loseTarget()
			target_mob = findTarget()
	else
		rage = max(0,rage-1)
		if(!rage)
			loseTarget()

	if(stance == HOSTILE_STANCE_ATTACK || rage)
		stop_automated_movement = 1
		stance = HOSTILE_STANCE_ATTACKING

	if(stance == HOSTILE_STANCE_ATTACKING)
		if(destroy_surroundings)
			destroySurroundings()

		if(attack_mode)
			switch(attack_mode)
				if(1)
					multilaser()
				if(2)
					shoot_everyone()
				if(3)
					shoot_everyone()

		if(prob(66)) //move -after- attacking, but before setting a new telegraph
			dir = pick(cardinal)
			if(!istype(get_step(src,dir),/turf/simulated/open))
				step(src,dir)

		if(get_attack_mode())
			telegraph()
		return 1
	return 0


/mob/living/carbon/superior_animal/synth/boss/proc/get_attack_mode()
	if(target_mob || rage)
		if(target_mob)
			attack_mode = pick(1,2,3)
		else
			attack_mode = pick(1,2)
	else
		attack_mode = 0
		loseTarget()
	return attack_mode

/mob/living/carbon/superior_animal/synth/boss/telegraph()
	switch(attack_mode)
		if(1)
			playsound(src, 'sound/weapons/flash.ogg', attack_sound_volume, 1)
			var/obj/effect/E
			var/falsedir = SOUTH
			for(var/i = 1 to 8)
				E = new /obj/effect/temp_visual/targetzone(loc)
				walk(E,falsedir,1)
				falsedir = turn(falsedir,45)

		if(2)
			attack_target = list()

			var/maxproj = 12
			for(var/mob/living/M in getPotentialTargets())
				if(isValidAttackTarget(M))
					attack_target += get_turf(M)
					new /obj/effect/temp_visual/targetzone(get_turf(M))
					maxproj--
				if(maxproj <= 0)
					break

			if(maxproj)
				var/list/obliterate = list()
				for(var/turf/T in view(6,src))
					if(T.density) continue
					if(T in view(1,src)) continue
					obliterate |= T
				if(obliterate.len)
					var/turf/T
					for(var/i = 1 to maxproj)
						T = pick_n_take(obliterate)
						if(T)
							attack_target |= T
							new /obj/effect/temp_visual/targetzone(T)
				clearlist(obliterate)

		if(3)
			attack_target = list()
			var/maxproj = 5
			for(var/turf/T in shuffle(view(2,target_mob)))
				if((T in view(7,src)) && get_dist(src,T) > 1)
					attack_target |= T
					maxproj--
					new /obj/effect/temp_visual/targetzone(T)
					if(!maxproj) break


		if(4)
			playsound(src, 'sound/weapons/flash.ogg', attack_sound_volume, 1) //TODO: ALTERNATE SOUND
			attack_target = get_turf(target_mob)
			var/obj/effect/E = new /obj/effect/temp_visual/targetzone/rush(attack_target)
			E.dir = get_dir(src,attack_target)


/mob/living/carbon/superior_animal/synth/boss/proc/rushdown()
	if(get_attack_mode())
		telegraph()

/mob/living/carbon/superior_animal/synth/boss/proc/shoot_everyone()
	if(islist(attack_target))
		var/obj/item/projectile/P
		var/mob/living/L
		playsound(loc,'sound/weapons/lasercannonfire.ogg',100,1)
		for(var/atom/A in attack_target)
			P = new projectiletype(loc)
			L = locate(/mob/living) in A
			if(L)
				P.launch(L,get_exposed_defense_zone(L))
				L = null
			else
				P.launch(A,ran_zone())
		clearlist(attack_target)
		attack_target = null
		sleep(2)

/mob/living/carbon/superior_animal/synth/boss/proc/multilaser()
	var/obj/item/projectile/P
	var/falsedir = pick(cardinal)
	for(var/i = 1 to 8)
		P = new projectiletype(loc)
		dir = falsedir
		P.launch(get_step(src,falsedir),ran_zone())
		//P.launch(get_edge_target_turf(src, falsedir), ran_zone())
		playsound(loc,'sound/weapons/lasercannonfire.ogg',66,1)
		falsedir = turn(falsedir,45)
		sleep(1)


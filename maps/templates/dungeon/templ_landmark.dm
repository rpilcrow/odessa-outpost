var/list/templ_landmarks = list()

/obj/template_landmark
	name = "template landmark"
	icon = 'icons/misc/landmarks.dmi'
	alpha = 64 //Or else they cover half of the map
	anchored = TRUE
	unacidable = TRUE
	simulated = FALSE
	invisibility = 101
	layer = MID_LANDMARK_LAYER
	var/room_id = 0


/obj/template_landmark/New()
	..()
	templ_landmarks += src
	room_id = templ_landmarks.len

/obj/template_landmark/proc/get_template()
	var/datum/map_template/dungeon/template = SSmapping.dungeon_templates[safepick(SSmapping.dungeon_templates)]

	var/turf/T = get_turf(src)
	if(!T)
		testing("Could not find turf at [x], [y], [z]")
		return 0

	var/list/room_atoms = list()

	room_atoms = template.load(T, centered = TRUE)
	if(room_atoms.len)
		testing("Placed a map template ([template.name]) at [x], [y], [z].")
	else
		testing("Failed to place map template at [x], [y], [z].")
		return 0

	assign_ids(room_atoms)

//	do_gendoors(room_atoms)

	return room_atoms.len

/obj/template_landmark/proc/assign_ids(var/list/room_atoms)
	for(var/obj/landmark/dungeon_room/D in room_atoms)
		D.room_id = room_id

/*
/obj/template_landmark/proc/do_gendoors(var/list/room_atoms)
	var/list/quikdoors = list()

	for(var/obj/landmark/dynamic_door/dungeon/D in room_atoms)
		D.room_id = room_id
		quikdoors |= D

	quikdoors = shuffle(quikdoors)

	var/numdoors = quikdoors.len

	for(var/obj/landmark/dynamic_door/dungeon/D in quikdoors)
		quikdoors -= D
		if(numdoors == 0)
			continue
		if(D.genDoor())
			numdoors--

*/

/obj/template_landmark/Destroy()
	landmarks_list -= src
	return ..()




/obj/landmark/random_door
	name = "random door"
	icon = 'icons/misc/dyndoor.dmi'
	icon_state = "dyndoor"
	var/walltype = /turf/simulated/wall/r_wall
	var/change_chance = 50

/obj/landmark/random_door/New()
	..()
	if(prob(change_chance))
		genWall()

/obj/landmark/random_door/proc/genWall()
	var/turf/T = get_turf(src)
	if(!T) return 0

	var/obj/machinery/door/D = locate(/obj/machinery/door) in T
	if(D)
		qdel(D)
		. = 1

	T.ChangeTurf(walltype)






/obj/landmark/dungeon_room
	var/room_id = 0
	var/lnd_id = 0




/obj/landmark/dungeon_room/dynamic_door
	name = "dynamic door"
	icon = 'icons/misc/dyndoor.dmi'
	icon_state = "dyndoor"
	var/walltype = /turf/simulated/wall/r_wall

/obj/landmark/dungeon_room/dynamic_door/proc/genDoor() //in hindsight this name is deceptive. this should be called obliterateDoor() or genWall()
	var/turf/T = get_turf(src)
	if(!T) return 0

	var/obj/machinery/door/D = locate(/obj/machinery/door) in T
	if(D)
		qdel(D)
		. = 1

	T.ChangeTurf(walltype)



/obj/landmark/dynamic_del
	name = "dynamic del"
	icon = 'icons/misc/dyndoor.dmi'
	icon_state = "del"
	var/dtype = /obj/machinery/door
	var/room_id = 0
	var/door_id = 0

/obj/landmark/dynamic_del/proc/getDel()
	for(var/A in get_turf(src))
		if(istype(A,dtype))
			qdel(A)
	qdel(src)
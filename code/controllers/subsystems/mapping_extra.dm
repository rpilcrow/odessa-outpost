SUBSYSTEM_DEF(mapping)
	name = "Mapping"
	init_order = INIT_ORDER_MAPPING
	flags = SS_NO_FIRE
	var/list/map_templates = list()
	var/list/dungeon_templates = list()

/datum/controller/subsystem/mapping/Initialize(start_timeofday)

	if(config.generate_asteroid)
		// These values determine the specific area that the map is applied to.
		// Because we do not use Bay's default map, we check the config file to see if custom parameters are needed, so we need to avoid hardcoding.
		if(maps_data.asteroid_leves)
			for(var/z_level in maps_data.asteroid_leves)
				if(!isnum(z_level))
					// If it's still not a number, we probably got fed some nonsense string.
					admin_notice("<span class='danger'>Error: ASTEROID_Z_LEVELS config wasn't given a number.</span>")
				// Now for the actual map generating.  This occurs for every z-level defined in the config.
				new /datum/random_map/automata/cave_system(null, 1, 1, z_level, 300, 300)
				// Let's add ore too.
				new /datum/random_map/noise/ore(null, 1, 1, z_level, 64, 64)
		else
			admin_notice("<span class='danger'>Error: No asteroid z-levels defined in config!</span>")

	if(config.use_overmap)
		if(!maps_data.overmap_z)
			build_overmap()
		else
			testing("Overmap already exist in maps_data for [maps_data.overmap_z].")
	else
		testing("Overmap generation disabled in config.")

	preloadTemplates(path = "maps/templates/tmpl/")

	var/list/dungeon_atoms = list()
	dungeon_atoms = build_dungeons()
	if(dungeon_atoms.len)
		finalize_dungeons()
	return ..()

/datum/controller/subsystem/mapping/proc/build_dungeons()
	testing("Building dungeons...")
	var/count = 0
	var/acount = 0
	for(var/obj/template_landmark/T in templ_landmarks)
		if(T.get_template())
			count++
		else
			acount++
		CHECK_TICK
	testing("Generated [count] dungeon rooms, [acount] failed.")



/datum/controller/subsystem/mapping/proc/finalize_dungeons()
/*
	var/list/quikdoors = list()

	for(var/obj/landmark/dynamic_door/dungeon/D in dungeon_atoms)
		quikdoors |= D
		D.genDoors()

	for(var/obj/landmark/dynamic_door/dungeon/D in quikdoors)
		qdel(D)
*/
	return 1

/datum/controller/subsystem/mapping/proc/build_overmap()
	testing("Building overmap...")
	world.maxz++
	maps_data.overmap_z = world.maxz
	var/list/turfs = list()
	for (var/square in block(locate(1,1,maps_data.overmap_z), locate(maps_data.overmap_size, maps_data.overmap_size, maps_data.overmap_z)))
		var/turf/T = square
		if(T.x == maps_data.overmap_size || T.y == maps_data.overmap_size)
			T = T.ChangeTurf(/turf/unsimulated/map/edge)
		else
			T = T.ChangeTurf(/turf/unsimulated/map/)
		turfs += T
		CHECK_TICK

	var/area/overmap/A = new
	A.contents.Add(turfs)

	maps_data.sealed_levels |= maps_data.overmap_z
	testing("Overmap build complete.")

/datum/controller/subsystem/mapping/Recover()
	flags |= SS_NO_INIT

/hook/roundstart/proc/init_overmap_events()
	if (config.use_overmap)
		if (maps_data.overmap_z)
			testing("Creating overmap events...")
			var/t1 = world.tick_usage
			overmap_event_handler.create_events(maps_data.overmap_z, maps_data.overmap_size, maps_data.overmap_event_areas)
			testing("Overmap events created in [(world.tick_usage-t1)*0.01*world.tick_lag] seconds")
		else
			testing("Overmap failed to create events.")
			return FALSE
	return TRUE


/datum/controller/subsystem/mapping/proc/preloadTemplates(path = "maps/templates/tmpl/") //see master controller setup
	var/list/filelist = flist(path)
	for(var/map in filelist)
		var/datum/map_template/T = new(path = "[path][map]", rename = "[map]")
		map_templates[T.name] = T
	preloadBlacklistableTemplates()

/proc/cmp_ruincost_priority(datum/map_template/dungeon/A, datum/map_template/dungeon/B)
	return initial(A.cost) - initial(B.cost)

/datum/controller/subsystem/mapping/proc/preloadBlacklistableTemplates()
	// Still supporting bans by filename
//	var/list/banned_exoplanet_dmms = generateMapList("config/exoplanet_ruin_blacklist.txt")
//	var/list/banned_space_dmms = generateMapList("config/space_ruin_blacklist.txt")
//	var/list/banned_away_site_dmms = generateMapList("config/away_site_blacklist.txt")

//	if (!banned_exoplanet_dmms || !banned_space_dmms || !banned_away_site_dmms)
//		report_progress("One or more map blacklist files are not present in the config directory!")

//	var/list/banned_maps = list() + banned_exoplanet_dmms + banned_space_dmms + banned_away_site_dmms

	for(var/item in sortList(subtypesof(/datum/map_template/dungeon), /proc/cmp_ruincost_priority))
		var/datum/map_template/dungeon/ruin_type = item
		// screen out the abstract subtypes
		if(!initial(ruin_type.id))
			continue
		var/datum/map_template/dungeon/R = new ruin_type()

/*		if (banned_maps)
			var/is_banned = FALSE
			for (var/mappath in R.mappaths)
				if(banned_maps.Find(mappath))
					is_banned = TRUE
			if (is_banned)
				continue
*/

		map_templates[R.name] = R
		dungeon_templates[R.name] = R


/*		if(istype(R, /datum/map_template/ruin/dungeon))
			exoplanet_ruins_templates[R.name] = R
		else if(istype(R, /datum/map_template/ruin/space))
			space_ruins_templates[R.name] = R
		else if(istype(R, /datum/map_template/ruin/away_site))
			away_sites_templates[R.name] = R
*/

/*
/datum/controller/subsystem/mapping/proc/preloadBlacklistableTemplates()
	// Still supporting bans by filename
	var/list/banned_exoplanet_dmms = generateMapList("config/exoplanet_ruin_blacklist.txt")
	var/list/banned_space_dmms = generateMapList("config/space_ruin_blacklist.txt")
	var/list/banned_away_site_dmms = generateMapList("config/away_site_blacklist.txt")

	if (!banned_exoplanet_dmms || !banned_space_dmms || !banned_away_site_dmms)
		report_progress("One or more map blacklist files are not present in the config directory!")

	var/list/banned_maps = list() + banned_exoplanet_dmms + banned_space_dmms + banned_away_site_dmms

	for(var/item in sortList(subtypesof(/datum/map_template/ruin), /proc/cmp_ruincost_priority))
		var/datum/map_template/ruin/ruin_type = item
		// screen out the abstract subtypes
		if(!initial(ruin_type.id))
			continue
		var/datum/map_template/ruin/R = new ruin_type()

		if (banned_maps)
			var/is_banned = FALSE
			for (var/mappath in R.mappaths)
				if(banned_maps.Find(mappath))
					is_banned = TRUE
			if (is_banned)
				continue

		map_templates[R.name] = R

		if(istype(R, /datum/map_template/ruin/exoplanet))
			exoplanet_ruins_templates[R.name] = R
		else if(istype(R, /datum/map_template/ruin/space))
			space_ruins_templates[R.name] = R
		else if(istype(R, /datum/map_template/ruin/away_site))
			away_sites_templates[R.name] = R
*/

/datum/job/assistant
	title = "Hireling"
	description = "You are nobody; you've followed along on this expedition for reasons of your own.<br>\
	Whatever you do, wherever you come from, and for whatever purpose you're here... try to at least make your presence worth it."

/obj/landmark/join/start/assistant
	name = "Hireling"

/datum/job/captain
	title = "Expedition Leader"
	description = "You are the leader of these idiots. Good luck."
	loyalties = ""
	duties = ""

/obj/landmark/join/start/captain
	name = "Expedition Leader"

/datum/job/hop
	title = "Expedition Lieutenant"
	supervisors = "the Expedition Leader"
	description = "First and foremost, your job is to manage the dungeoneering expeditions. You should make sure that the men contracted under the dungeoneering expedition are armed, \
	equipped, and ready to explore, and that they leave at appropriate times.<br>\
	You are also in charge of assisting the Leader in any way you can."
	loyalties = ""
	duties = ""

/obj/landmark/join/start/hop
	name = "Expedition Lieutenant"


/datum/job/janitor
	description = "Somebody's gotta clean up the blood."
	loyalties = ""
	duties = ""

/datum/job/bartender
	title = "Innkeeper"
	supervisors = "your greed"
	description = "You are the Innkeeper; you provide drink, room, and board to any who pay, and may even manage to scrounge up the materials to provide other goods."
	loyalties = ""
	duties = ""

/obj/landmark/join/start/bartender
	name = "Innkeeper"

/datum/job/chef
	supervisors = "the Innkeeper"
	description = "Working under the Innkeeper, you are the one who will prepare most of the food."
	loyalties = ""
	duties = ""

/datum/job/actor
	title = "Clown"
	supervisors = "your sense of comedy"
	loyalties = ""
	duties = ""

/obj/landmark/join/start/actor
	name = "Clown"

/datum/job/technomancer
	title = "Engineer"
	description = "By practicing lost arts such as 'mechanical repair' and 'engineering degree', you are sufficiently capable of maintaining the campsite."
	loyalties = ""
	duties = ""
	total_positions = 5
	spawn_positions = 5

/obj/landmark/join/start/technomancer
	name = "Engineer"


/datum/job/merchant
	title = "Merchant"
	description = "You are in charge of requisitioning supplies for the expedition from elsewhere, and are one of the few sources of fresh goods and materials.<br>\
Don't squander this power - use it to turn a profit and to keep the expedition going. If the dungeoneers fall apart, you have no customers."
	loyalties = ""
	duties = ""
	supervisors = "the power of capitalism"

/obj/landmark/join/start/merchant
	name = "Merchant"

/datum/job/cargo_tech
	title = "Cargo Tech"
	description = ""
	loyalties = ""
	duties = ""
	faction = "Not Eris"
	total_positions = 1
	spawn_positions = 1

/obj/landmark/join/start/cargo_tech
	name = "Cargo Tech"

/datum/job/doctor
	title = "Doctor"

	stat_modifiers = list(
		STAT_BIO = 20,
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 10,
	)
	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_chemistry,
		access_eva, access_maint_tunnels, access_external_airlocks, access_psychiatrist, access_genetics, access_virology
	)
	total_positions = 7
	spawn_positions = 7

	supervisors = "your interpretation of the hippocratic oath"
	loyalties = ""
	duties = ""

/obj/landmark/join/start/doctor
	name = "Doctor"
/*
/datum/job/ihc

	title = "Dungeoneer Commander"
	supervisors = "the Expedition Leader and Expedition Lieutenant"
	description = "First and foremost, your job is to manage the dungeoneering expeditions. You should make sure that the men contracted under the dungeoneering expedition are armed, \
	equipped, and ready to explore, and that they leave at appropriate times."
	loyalties = ""
	duties = ""

/obj/landmark/join/start/ihc
	name = "Dungeoneer Commander"
*/
/datum/job/gunserg
	title = "Armorer"
	supervisors = "the Expedition Lieutenant"
	description = "You manage the weapons storage of the Expedition. It's very little to start with, but in time you should ensure that it becomes well-stocked with excess equipment.<br>\
	You also run the brig; if anybody slights somebody else, you determine their sentence. Of course, your superiors' word overrides any sentence you may set, so keep that in mind."
	loyalties = ""
	duties = ""

/obj/landmark/join/start/gunserg
	name = "Armorer"

/datum/job/medspec
	title = "Field Medic"
	supervisors = "the Expedition Lieutenant"
	description = "You are a dungeoneer equipped with medical supplies and knowledge. Ensure that your comrades in arms do not fall in their task, and that they are delivered to the Doctors \
	if you cannot save them.<br>\
	You should also be on the look-out for any medical or science equipment you can find down there, as you are best equipped to use and identify it."
	loyalties = ""
	duties = ""
	total_positions = -1
	spawn_positions = -1

/obj/landmark/join/start/medspec
	name = "Field Medic"

/datum/job/ihoper
	title = "Dungeoneer"
	supervisors = "the Expedition Lieutenant"
	description = "You are a dungeoneer, some poor soul who has signed their life away to raid ancient ruins and overrun installations in the name of profit and rediscovery.<br>\
	Your tasks are to explore and recover; the deeper you can safely get into the ruins and the more loot you can retrieve from it, the better. <br>\
	You should use your best judgement in what you retrieve."
	loyalties = ""
	duties = ""
	total_positions = -1
	spawn_positions = -1

/obj/landmark/join/start/ihoper
	name = "Dungeoneer"


/datum/job/scientist
	title = "Scientist"
	supervisors = "the scientific method"
	description = "As a scientist, this place may prove or disprove many interesting theories, or raise more questions about the universe. Document them as best you can.<br>\

Secondly, ensure that the expedition goes well - arm your comrades as best you can with the discoveries you make here, as the dungeoneers are all you can rely on."
	loyalties = ""
	duties = ""
	total_positions = 1
	spawn_positions = 1

/obj/landmark/join/start/scientist
	name = "Scientist"


/datum/job/chaplain
	faction = "Not Eris"
//datum/job/chef
//	faction = "Not Eris"
/datum/job/hydro
	faction = "Not Eris"
/datum/job/janitor
	faction = "Not Eris"
/datum/job/chief_engineer
	faction = "Not Eris"
/datum/job/mining
	faction = "Not Eris"
/datum/job/cmo
	faction = "Not Eris"
/datum/job/chemist
	faction = "Not Eris"
/datum/job/psychiatrist
	faction = "Not Eris"
/datum/job/paramedic
	faction = "Not Eris"
/datum/job/offduty_civilian
	faction = "Not Eris"
/datum/job/offduty_cargo
	faction = "Not Eris"
/datum/job/offduty_engineering
	faction = "Not Eris"
/datum/job/offduty_medical
	faction = "Not Eris"
/datum/job/offduty_security
	faction = "Not Eris"
/datum/job/offduty_command
	faction = "Not Eris"
/datum/job/rd
	faction = "Not Eris"
/datum/job/roboticist
	faction = "Not Eris"
/datum/job/ihc
	faction = "Not Eris"
/datum/job/inspector
	faction = "Not Eris"
/datum/job/ai
	faction = "Not Eris"
/datum/job/cyborg
	faction = "Not Eris"
/*
/datum/job/
	total_positions = 0
	spawn_positions = 0
*/

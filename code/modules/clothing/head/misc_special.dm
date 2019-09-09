/*
 * Contents:
 *		Welding mask
 *		Cakehat
 *		Ushanka
 *		Pumpkin head
 *		Kitty ears
 *
 */

/*
 * Welding mask
 */
/obj/item/clothing/head/welding
	name = "welding helmet"
	desc = "A head-mounted face cover designed to protect the wearer completely from space-arc eye."
	icon_state = "welding"
	item_state_slots = list(
		slot_l_hand_str = "welding",
		slot_r_hand_str = "welding",
		)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_GLASS = 2)
	var/up = 0
	armor = list(melee = 40, bullet = 30, laser = 30,energy = 30, bomb = 0, bio = 0, rad = 0)
	flags_inv = (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
	body_parts_covered = HEAD|FACE|EYES
	action_button_name = "Flip Welding Mask"
	siemens_coefficient = 0.9
	w_class = ITEM_SIZE_NORMAL
	var/base_state
	flash_protection = FLASH_PROTECTION_MAJOR
	tint = TINT_HEAVY

/obj/item/clothing/head/welding/attack_self()
	if(!base_state)
		base_state = icon_state
	toggle()


/obj/item/clothing/head/welding/verb/toggle()
	set category = "Object"
	set name = "Adjust Welding Mask"
	set src in usr

	if(!usr.incapacitated())
		if(src.up)
			src.up = !src.up
			body_parts_covered |= (EYES|FACE)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			flash_protection = initial(flash_protection)
			tint = initial(tint)
			icon_state = base_state
			usr << "You flip the [src] down to protect your eyes."
		else
			src.up = !src.up
			body_parts_covered &= ~(EYES|FACE)
			flash_protection = FLASH_PROTECTION_NONE
			tint = TINT_NONE
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "[base_state]up"
			usr << "You push the [src] up out of your face."
		update_wear_icon()	//so our mob-overlays
		usr.update_action_buttons()

/obj/item/clothing/head/welding/demon
	name = "demonic welding helmet"
	desc = "A welding helmet painted to resemble a demonic face."
	icon_state = "demonwelding"
	item_state_slots = list(
		slot_l_hand_str = "demonwelding",
		slot_r_hand_str = "demonwelding",
		)

/obj/item/clothing/head/welding/knight
	name = "knightly welding helmet"
	desc = "A welding helmet painted to resemble a medieval knight."
	icon_state = "knightwelding"
	item_state_slots = list(
		slot_l_hand_str = "knightwelding",
		slot_r_hand_str = "knightwelding",
		)

/obj/item/clothing/head/welding/fancy
	name = "fancy welding helmet"
	desc = "A welding helmet painted in fancy black and gold colors."
	icon_state = "fancywelding"
	item_state_slots = list(
		slot_l_hand_str = "fancywelding",
		slot_r_hand_str = "fancywelding",
		)

/obj/item/clothing/head/welding/technomancer
	name = "technomancer welding helmet"
	desc = "A welding helmet painted in technomancer colors."
	icon_state = "engiewelding"
	item_state_slots = list(
		slot_l_hand_str = "engiewelding",
		slot_r_hand_str = "engiewelding",
		)

/obj/item/clothing/head/welding/flame
	name = "flame welding helmet"
	desc = "A welding helmet painted with vivid flames and fire."
	icon_state = "alice_mccrea_1"
	item_state_slots = list(
		slot_l_hand_str = "alice_mccrea_1",
		slot_r_hand_str = "alice_mccrea_1",
		)

/obj/item/clothing/head/welding/ghetto
	name = "ghetto welding helmet"
	desc = "A welding helmet painted white with a graffiti tag."
	icon_state = "yuki_matsuda_1"
	item_state_slots = list(
		slot_l_hand_str = "yuki_matsuda_1",
		slot_r_hand_str = "yuki_matsuda_1",
		)

/obj/item/clothing/head/welding/aquatic
	name = "aquatic welding helmet"
	desc = "A welding helmet painting in an underwater blue theme."
	icon_state = "norah_briggs_1"
	item_state_slots = list(
		slot_l_hand_str = "norah_briggs_1",
		slot_r_hand_str = "norah_briggs1",
		)





norah_briggs_1

alice_mccrea_1

yuki_matsuda_1



/*
 * Cakehat
 */



/*
 * Ushanka
 */
/obj/item/clothing/head/ushanka
	name = "ushanka"
	desc = "A warm fur cap with ear flaps."
	icon_state = "ushankadown"
	flags_inv = HIDEEARS

/obj/item/clothing/head/ushanka/attack_self(mob/user as mob)
	if(src.icon_state == "ushankadown")
		src.icon_state = "ushankaup"
		user << "You raise the ear flaps on the ushanka."
	else
		src.icon_state = "ushankadown"
		user << "You lower the ear flaps on the ushanka."
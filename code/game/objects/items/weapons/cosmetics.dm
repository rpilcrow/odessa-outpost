/obj/item/weapon/lipstick
	gender = PLURAL
	name = "red lipstick"
	desc = "A generic brand of red lipstick. Can be wiped off with paper."
	icon = 'icons/obj/items.dmi'
	icon_state = "lipstick"
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	var/colour = "red"
	var/open = 0


/obj/item/weapon/lipstick/purple
	name = "purple lipstick"
	desc = "A generic brand of purple lipstick. Can be wiped off with paper."
	colour = "purple"

/obj/item/weapon/lipstick/jade
	name = "jade lipstick"
	desc = "A generic brand of jade lipstick. Can be wiped off with paper."
	colour = "jade"

/obj/item/weapon/lipstick/black
	name = "black lipstick"
	desc = "A generic brand of black lipstick. Can be wiped off with paper."
	colour = "black"

/obj/item/weapon/lipstick/attack_self(mob/user as mob)
	user << "<span class='notice'>You twist \the [src] [open ? "closed" : "open"].</span>"
	open = !open
	if(open)
		icon_state = "[initial(icon_state)]_[colour]"
	else
		icon_state = initial(icon_state)

/obj/item/weapon/lipstick/attack(mob/M as mob, mob/user as mob)
	if(!open)
		return

	if(!ismob(M))
		return

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.lip_style)	//if they already have lipstick on
			user << SPAN_NOTICE("You need to wipe off the old lipstick first!")
			return
		if(H == user)
			user.visible_message(SPAN_NOTICE("[user] does their lips with \the [src]."), \
								 SPAN_NOTICE("You take a moment to apply \the [src]. Perfect!"))
			H.lip_style = colour
			H.update_body()
		else
			user.visible_message(SPAN_WARNING("[user] begins to do [H]'s lips with \the [src]."), \
								 SPAN_NOTICE("You begin to apply \the [src]."))
			if(do_after(user, 20, H) && do_after(H, 20, needshand = 0))	//user needs to keep their active hand, H does not.
				user.visible_message(SPAN_NOTICE("[user] does [H]'s lips with \the [src]."), \
									 SPAN_NOTICE("You apply \the [src]."))
				H.lip_style = colour
				H.update_body()
	else
		user << SPAN_NOTICE("Where are the lips on that?")

//you can wipe off lipstick with paper! see code/modules/paperwork/paper.dm, paper/attack()


/obj/item/weapon/haircomb //sparklysheep's comb
	name = "purple comb"
	desc = "A pristine purple comb made from flexible plastic."
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	icon = 'icons/obj/items.dmi'
	icon_state = "purplecomb"
	item_state = "purplecomb"

/obj/item/weapon/haircomb/attack_self(mob/user)
	user.visible_message("<span class='notice'>[user] uses [src] to comb their hair with incredible style and sophistication. What a [user.gender == FEMALE ? "lady" : "guy"].</span>")

/**********************Ore box**************************/

/obj/structure/ore_box
	icon = 'icons/obj/mining.dmi'
	icon_state = "orebox0"
	name = "ore box"
	desc = "A heavy box used for storing ore."
	density = 1
	var/last_update = 0
	var/list/stored_ore = list()
	var/health = 40

/obj/structure/ore_box/attack_generic(var/mob/user, var/damage)
	health = max(0, health-damage)
	if(!health)
		for (var/obj/item/stack/ore/O in contents)
			contents -= O
			O.loc = src.loc
		user.visible_message("<span class='notice'>[user] smashes \the [src].</span>", \
							 "<span class='notice'>You take apart \the [src].</span>", \
							 "<span class='notice'>You hear splitting wood.</span>")
		if(istype(user, /mob/living/simple_animal/hostile))
			var/mob/living/simple_animal/hostile/attacker = user
			attacker.target_mob = null
		qdel(src)
/obj/structure/ore_box/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/stack/ore))
		user.remove_from_mob(W)
		src.contents += W
	if (istype(W, /obj/item/weapon/storage))
		var/obj/item/weapon/storage/S = W
		S.hide_from(usr)
		for(var/obj/item/stack/ore/O in S.contents)
			S.remove_from_storage(O, src) //This will move the item to this item's contents
		to_chat(user, "<span class='notice'>You empty the satchel into the box.</span>")

	update_ore_count()

	return

	if(isCrowbar(W))
		new /obj/item/stack/material/wood(src)
		for (var/obj/item/stack/ore/O in contents)
			contents -= O
			O.loc = src.loc
		user.visible_message("<span class='notice'>[user] tears down \the [src].</span>", \
							 "<span class='notice'>You take apart \the [src].</span>", \
							 "<span class='notice'>You hear splitting wood.</span>")
		qdel(src)
	else
		return attack_hand(user)

/obj/structure/ore_box/proc/update_ore_count()

	stored_ore = list()

	for(var/obj/item/stack/ore/O in contents)

		if(stored_ore[O.name])
			stored_ore[O.name]++
		else
			stored_ore[O.name] = 1

/obj/structure/ore_box/examine(mob/user)
	. = ..(user)

	// Borgs can now check contents too.
	if((!istype(user, /mob/living/carbon/human)) && (!istype(user, /mob/living/silicon/robot)))
		return

	if(!Adjacent(user)) //Can only check the contents of ore boxes if you can physically reach them.
		return

	add_fingerprint(user)

	if(!contents.len)
		to_chat(user, "It is empty.")
		return

	if(world.time > last_update + 10)
		update_ore_count()
		last_update = world.time

	to_chat(user, "It holds:")
	for(var/ore in stored_ore)
		to_chat(user, "- [stored_ore[ore]] [ore]")
	return


/obj/structure/ore_box/verb/empty_box()
	set name = "Empty Ore Box"
	set category = "Object"
	set src in view(1)

	if(!istype(usr, /mob/living/carbon/human)) //Only living, intelligent creatures with hands can empty ore boxes.
		to_chat(usr, "<span class='warning'>You are physically incapable of emptying the ore box.</span>")
		return

	if( usr.stat || usr.restrained() )
		return

	if(!Adjacent(usr)) //You can only empty the box if you can physically reach it
		to_chat(usr, "You cannot reach the ore box.")
		return

	add_fingerprint(usr)

	if(contents.len < 1)
		to_chat(usr, "<span class='warning'>The ore box is empty</span>")
		return

	for (var/obj/item/stack/ore/O in contents)
		contents -= O
		O.loc = src.loc
	to_chat(usr, "<span class='notice'>You empty the ore box</span>")

	return

/obj/structure/ore_box/ex_act(severity)
	if(severity == 1.0 || (severity < 3.0 && prob(50)))
		for (var/obj/item/stack/ore/O in contents)
			O.loc = src.loc
			O.ex_act(severity++)
		qdel(src)
		return
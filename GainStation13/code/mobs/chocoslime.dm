/mob/living/simple_animal/hostile/feed
	var/food_per_feeding = 5
	var/food_fed = /datum/reagent/consumable/nutriment

/mob/living/simple_animal/hostile/feed/AttackingTarget()
	. = ..()
	var/mob/living/carbon/L = target
	if(L.client?.prefs?.weight_gain_weapons)
		if(L.reagents)
			if(!L.is_mouth_covered(head_only = 1))
				L.reagents.add_reagent(food_fed, food_per_feeding)

/mob/living/simple_animal/hostile/feed/chocolate_slime
	name = "Chocolate slime"
	desc = "It's a living blob of tasty chocolate!"
	icon = 'GainStation13/icons/mob/candymonster.dmi'
	icon_state = "a_c_slime"
	icon_living = "a_c_slime"
	icon_dead = "a_c_slime_dead"
	speak_emote = list("blorbles")
	emote_hear = list("blorbles")
	speak_chance = 5
	turns_per_move = 5
	see_in_dark = 10
	butcher_results = list(/obj/item/reagent_containers/food/snacks/chocolatebar = 4)
	response_help  = "pets"
	response_disarm = "shoos"
	response_harm   = "hits"
	maxHealth = 20
	health = 20
	obj_damage = 0
	melee_damage_lower = 0.001
	melee_damage_upper = 0.001
	faction = list("slime")
	pass_flags = PASSTABLE
	move_to_delay = 7
	ventcrawler = VENTCRAWLER_ALWAYS
	attacktext = "feeds itself to"
	attack_sound = 'sound/items/eatfood.ogg'
	unique_name = 1
	gold_core_spawnable = HOSTILE_SPAWN
	see_in_dark = 3
	blood_volume = 0
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
	initial_language_holder = /datum/language_holder/slime


//Creambeast - basically a bit tougher mob that has feeding ranged attacks
/mob/living/simple_animal/hostile/feed/chocolate_slime/creambeast
	name = "Creambeast"
	desc = "A strange mass of thick, creamy ice cream given some sense of instinct."
	icon = 'GainStation13/icons/mob/candymonster.dmi'
	icon_state = "icecream_monster"
	icon_living = "icecream_monster"
	icon_dead = "icecream_monster_dead"
	icon_gib = "icecream_monster_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	move_to_delay = 20
	projectiletype = /obj/item/projectile/energy/fattening/icecream
	projectilesound = 'sound/weapons/pierce.ogg'
	ranged = 1
	ranged_message = "schlorps"
	ranged_cooldown_time = 30
	vision_range = 2
	speed = 3
	maxHealth = 100
	health = 100
	obj_damage = 0
	melee_damage_lower = 0.001
	melee_damage_upper = 0.001
	speak_emote = list("schlorps")
	attacktext = "stuffs itself into"
	attack_sound = 'sound/items/eatfood.ogg'
	vision_range = 2
	aggro_vision_range = 9
	turns_per_move = 5
	blood_volume = 0
	gold_core_spawnable = HOSTILE_SPAWN
	butcher_results = list(/obj/item/reagent_containers/food/snacks/icecream = 4)

/obj/item/projectile/energy/fattening/icecream //might as well make use of this thing to not make ton of different variants of the same thing
	name = "ice cream blob"
	icon = 'GainStation13/icons/mob/candymonster.dmi'
	icon_state = "icecream_projectile"
	ricochets_max = 0
	ricochet_chance = 0
	hitsound = 'sound/weapons/tap.ogg'
	hitsound_wall = 'sound/weapons/tap.ogg'
	is_reflectable = FALSE
	light_range = 0
	///How much fat is added to the target mob?
	var/food_per_feeding = 5
	var/food_fed = /datum/reagent/consumable/nutriment
	var/fullness_add = 10

/obj/item/projectile/energy/fattening/icecream/on_hit(atom/target, blocked)
	. = ..()
	var/mob/living/carbon/L = target
	if(L.client?.prefs?.weight_gain_weapons)
		if(L.reagents)
			if(!L.is_mouth_covered(head_only = 1))
				L.reagents.add_reagent(food_fed, food_per_feeding)
				L.fullness += (fullness_add)

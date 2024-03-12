/**
 * The ice variant of a gorilla
 */
/mob/living/basic/gorilla/icerilla
	name = "Icerilla"
	desc = "A ground-dwelling albino furred gorilla, this one is rare, and it looks as if the fur is made of ice. Better be careful with this one."
	icon = 'icons/mob/simple/gorilla.dmi'
	icon_state = "icerilla_crawling"
	icon_living = "icerilla_crawling"
	icon_dead = "icerilla_dead"
	maxHealth = 220
	health = 220
	speed = 0.025
	melee_attack_cooldown = CLICK_CD_MELEE
	melee_damage_lower = 15
	melee_damage_upper = 18
	damage_coeff = list(BRUTE = 1, BURN = 1.5, TOX = 1.5, STAMINA = 0, OXY = 1.5)
	obj_damage = 20
	attack_sound = 'sound/weapons/punch1.ogg'

/mob/living/basic/gorilla/icerilla/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/frost_step)

/mob/living/basic/gorilla/icerilla/update_overlays()
	. = ..()
	if (is_holding_items())
		. += "standing_overlay"

/mob/living/basic/gorilla/icerilla/update_icon_state()
	. = ..()
	if (stat == DEAD)
		return
	icon_state = is_holding_items() ? "icerilla_standing" : "icerilla_crawling"



/mob/living/basic/gorilla/icerilla/lesser_icerilla
	name = "lesser Icerilla"
	desc = "An adolescent Gorilla. It may not be fully grown but, much like a banana, that just means it's sturdier and harder to chew!"

/mob/living/basic/gorilla/icerilla/lesser_icerilla/Initialize(mapload)
	. = ..()
	transform *= 0.75

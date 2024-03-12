// Add to a living mob to allow them to leave a trail of slippery ice as they walk
/datum/component/frost_step

	// yes
/datum/component/frost_step/Initialize()
	if(!ismovable(parent))
		return COMPONENT_INCOMPATIBLE

/datum/component/frost_step/RegisterWithParent()
	. = ..()
	RegisterSignal(parent, COMSIG_MOVABLE_MOVED, PROC_REF(freeze_floor))

/datum/component/frost_step/UnregisterFromParent()
	. = ..()
	UnregisterSignal(parent,COMSIG_MOVABLE_MOVED)
	// non gorillas wont be affected
/datum/component/frost_step/proc/freeze_floor(atom/movable/target)
	SIGNAL_HANDLER

	var/turf/open/OT = get_turf(target)
	if(istype(OT))
		OT.MakeSlippery(TURF_WET_ICE, 10)
		return TRUE













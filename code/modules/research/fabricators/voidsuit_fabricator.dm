/obj/machinery/fabricator/voidsuit_fabricator
	// Things that must be adjusted for each fabricator
	name = "Voidsuit Fabricator" // Self-explanatory
	desc = "A machine used for the production of voidsuits and other spacesuits" // Self-explanatory
	circuit = /obj/item/weapon/circuitboard/fabricator/voidfab // Circuit for the machine. These, as well as their designs, should be defined in fabricator_circuits.dm
	build_type = VOIDFAB // The identifer for what gets built in what fabricator. A new one *MUST* be defined in _defines/research.dm for each fabricator.
						 					 // More than one can be assigned per design, however, if you want something to be able to be built in more than one fabricator eg. Power Cells

	// Things that CAN be adjusted, but are okay to leave as default
	// Icon states - if you want your fabricator to use a special icon, place it in fabricators.dmi following these naming conventions.
	icon_state = 	 "voidsuitfab-idle"
	icon_idle = 	 "voidsuitfab-idle"
	icon_open = 	 "voidsuitfab-o"
	overlay_active = "voidsuitfab-active"

	metal_load_anim = TRUE				// Determines if a sheet loading animation will be applied when loading metals. If you're using a non-standard icon and don't
										// want to sprite a new loading animation as well, set this to FALSE.

	has_reagents = FALSE				// Defaults to FALSE, but added here for explanation. If this is set to true, than you require designs to use reagents
										// in addition to any material costs.

////////////////////////////////////////////////////
//////////////////////DESIGNS///////////////////////
////////////////////////////////////////////////////

//Voidsuits
/datum/design/item/voidfab
	build_type = VOIDFAB 			   // This must match the build_type of the fabricator(s)
	category = "Misc"	 			   // The design will appear under this in the UI. Each design must have a category, or it will not display properly.
	req_tech = list(TECH_MATERIAL = 1) // The tech required for the design. Note that anything above 1 for *ANY* tech will require a RnD console for the item to be
									   // fabricated.

	time = 50						   // Time in seconds for the item to be produced - This changes based off the components used in the fabricator

/datum/design/item/voidfab/engineering
	category = "Engineering"
	req_tech = list(TECH_ENGINEERING = 3, TECH_MATERIAL = 3)

/datum/design/item/voidfab/engineering/engineeringsuit
	name = "Engineering voidsuit"
	id = "engi_voidsuit"
	build_path = /obj/item/clothing/suit/space/void/engineering // The path to the item produced
	materials = list("plasteel" = 120000, "tungsten" = 40000)	// The amount of material required for the item. 2000 = 1 sheet

/datum/design/item/voidfab/engineering/engineeringhelmet
	name = "Engineering voidsuit helmet"
	id = "engi_helment"
	build_path = /obj/item/clothing/head/helmet/space/void/engineering
	materials = list("plasteel" = 60000, "glass" = 20000, "tungsten" = 40000)

/datum/design/item/voidfab/engineering/atmossuit
	name = "Atmospherics voidsuit"
	id = "atmos_voidsuit"
	build_path = /obj/item/clothing/suit/space/void/atmos
	materials = list("osmium-carbide plasteel" = 100000, "gold" = 20000)

/datum/design/item/voidfab/engineering/atmoshelmet
	name = "Atmospherics voidsuit helmet"
	id = "atmos_helmet"
	build_path = /obj/item/clothing/head/helmet/space/void/atmos
	materials = list("osmium-carbide plasteel" = 40000, "gold" = 10000, "glass" = 20000)

/datum/design/item/voidfab/security
	category = "Security"
	req_tech = list(TECH_ENGINEERING = 3, TECH_MATERIAL = 3, TECH_COMBAT = 3)

/datum/design/item/voidfab/security/securitysuit
	name = "Security voidsuit"
	id = "sec_voidsuit"
	build_path = /obj/item/clothing/suit/space/void/security
	materials = list("plasteel" = 140000, "platinum" = 40000)

/datum/design/item/voidfab/security/securityhelmet
	name = "Security voidsuit helmet"
	id = "sec_helmet"
	build_path = /obj/item/clothing/head/helmet/space/void/security
	materials = list("plasteel" = 80000, "glass" = 20000, "platinum" = 40000)

/datum/design/item/voidfab/medical
	category = "Medical"
	req_tech = list(TECH_ENGINEERING = 3, TECH_MATERIAL = 3, TECH_BIO = 3)

/datum/design/item/voidfab/medical/medicalsuit
	name = "Medical voidsuit"
	id = "med_voidsuit"
	build_path = /obj/item/clothing/suit/space/void/medical/alt
	materials = list("plasteel" = 100000, "platinum" = 40000)

/datum/design/item/voidfab/medical/medicalhelmet
	name = "Medical voidsuit helmet"
	id = "med_helmet"
	build_path = /obj/item/clothing/head/helmet/space/void/medical/alt
	materials = list("plasteel" = 40000, "glass" = 20000)

//Softsuits

/datum/design/item/voidfab/softsuit/
	category = "Softsuits"
	time = 25

/datum/design/item/voidfab/softsuit/suit
	materials = list("cloth" = 30000, "steel" = 1000)
/datum/design/item/voidfab/softsuit/helmet
	materials = list("cloth" = 20000, "glass" = 20000)

/datum/design/item/voidfab/softsuit/suit/engineeringsuit
	name = "Engineering softsuit"
	id = "eng_softsuit"
	build_path = /obj/item/clothing/suit/space/engineering

/datum/design/item/voidfab/softsuit/helmet/engineeringhelmet
	name = "Engineering softsuit helmet"
	id = "eng_softhelmet"
	build_path = /obj/item/clothing/head/helmet/space/engineering

/datum/design/item/voidfab/softsuit/suit/securitysuit
	name = "Security softsuit"
	id = "sec_softsuit"
	build_path = /obj/item/clothing/suit/space/security

/datum/design/item/voidfab/softsuit/helmet/securityhelmet
	name = "Security softsuit helmet"
	id = "sec_softhelmet"
	build_path = /obj/item/clothing/head/helmet/space/security

/datum/design/item/voidfab/softsuit/suit/medicalsuit
	name = "Medical softsuit"
	id = "med_softsuit"
	build_path = /obj/item/clothing/suit/space/medical

/datum/design/item/voidfab/softsuit/helmet/medicalhelmet
	name = "Medical softsuit helmet"
	id = "med_softhelmet"
	build_path = /obj/item/clothing/head/helmet/space/medical

/datum/design/item/voidfab/softsuit/suit/miningsuit
	name = "Mining softsuit"
	id = "min_softsuit"
	build_path = /obj/item/clothing/suit/space/mining

/datum/design/item/voidfab/softsuit/helmet/mininghelmet
	name = "Mining softsuit helmet"
	id = "min_softhelmet"
	build_path = /obj/item/clothing/head/helmet/space/mining

/datum/design/item/voidfab/softsuit/suit/sciencesuit
	name = "Science softsuit"
	id = "sci_softsuit"
	build_path = /obj/item/clothing/suit/space/science

/datum/design/item/voidfab/softsuit/helmet/sciencehelmet
	name = "Science softsuit helmet"
	id = "sci_softhelmet"
	build_path = /obj/item/clothing/head/helmet/space/science

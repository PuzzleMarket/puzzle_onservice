cfg = { }

cfg.locs = { 
	{ coord = vector3( 441.05, -975.83, 30.69-0.7 ), type = "Police" 		},
	{ coord = vector3( 298.97, -584.43, 43.27-0.7 ), type = "Hospital" 	},
}

cfg.permissions = {
	["Police"] = {
		{ inServiceGroup = "Coronel", 		outServiceGroup = "PaisanaCoronel" 		},
		{ inServiceGroup = "Tenente1", 		outServiceGroup = "PaisanaTenente1" 	},
		{ inServiceGroup = "Aspirante", 	outServiceGroup = "PaisanaAspirante" 	}
	},
	["Hospital"] = {
		{ inServiceGroup = "Diretor", 		outServiceGroup = "PaisanaDiretor" 		},
		{ inServiceGroup = "Medico", 			outServiceGroup = "PaisanaMedico" 		},
		{ inServiceGroup = "Enfermeiro",	outServiceGroup = "PaisanaEnfermeiro"	}
	}
}

return cfg
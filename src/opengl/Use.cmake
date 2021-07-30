
function(UseOpenGL targetName)

	set(moduleName opengl32)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		LIB opengl32
	)

endfunction()
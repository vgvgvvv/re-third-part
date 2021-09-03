
function(UseOpenGL targetName)

	message(STATUS "Use Opengl")

	set(moduleName opengl32)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		LIB opengl32
	)

	add_definitions(-DUSE_OPENGL)

endfunction()
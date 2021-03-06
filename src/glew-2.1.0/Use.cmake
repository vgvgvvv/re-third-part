
function(UseGlew targetName)

	message(STATUS "${targetName} include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")
	message(STATUS "${targetName} link ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/Release/x64")

	set(moduleName Glew)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include"
		LIB "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/Release/x64/glew32.lib"
	)

	add_custom_command(TARGET ${targetName} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different  
        "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/bin/Release/x64/glew32.dll"
        $<TARGET_FILE_DIR:${targetName}>)

endfunction()
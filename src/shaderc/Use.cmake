
function(UseShaderc targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")
	message(STATUS "${targetName} link ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/")

	set(moduleName Shaderc)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include"
		LIB "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/shaderc_shared.lib"
	)

	add_custom_command(TARGET ${targetName} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different  
        "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/shaderc_shared.dll"
        $<TARGET_FILE_DIR:${targetName}>)


endfunction()
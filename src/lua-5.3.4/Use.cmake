
function(UseLua targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")
	message(STATUS "${targetName} link ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/libs/Release/x64")

	set(moduleName lua)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include"
		LIB "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/libs/Release/x64/lua.lib"
	)

endfunction()
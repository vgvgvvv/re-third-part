
function(UseRapidJson targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")

	set(moduleName RapidJson)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include"
		DEFINE "-DRAPIDJSON_HAS_STDSTRING=1"
	)

endfunction()
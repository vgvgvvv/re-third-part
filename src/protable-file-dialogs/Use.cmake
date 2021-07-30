
function(UseFileDialog targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}")

	set(moduleName FileDialog)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}"
	)

endfunction()


function(UseImguiWithDock targetName backend)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}")
	message(STATUS "${targetName} add source ${CMAKE_CURRENT_FUNCTION_LIST_DIR}")

	set(moduleName ImguiWithDock)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}"
		SOURCE "${CMAKE_CURRENT_FUNCTION_LIST_DIR}"
	)

endfunction()
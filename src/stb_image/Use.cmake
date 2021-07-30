
function(UseStbImage targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}")
	message(STATUS "${targetName} add source ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/stb_image.cpp")

	set(moduleName StbImage)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}"
		SOURCE "${CMAKE_CURRENT_FUNCTION_LIST_DIR}"
	)

endfunction()
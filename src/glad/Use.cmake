
function(UseGlad targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")
	message(STATUS "${targetName} add source ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/src/glad.c")

	set(moduleName Glad)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include"
		SOURCE "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/src"
	)

endfunction()
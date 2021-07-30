
function(UseGlfw targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")
	message(STATUS "${targetName} link ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib-vc2019")

	set(moduleName Glfw)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include"
		LIB "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib-vc2019/glfw3.lib"
	)

	ReMake_CopyDllToTarget(${targetName} "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/glfw3.dll")

endfunction()
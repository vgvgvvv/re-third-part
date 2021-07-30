
function(UseYaml targetName)

	message(STATUS "${targetName} include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")
	message(STATUS "${targetName} link ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/")

	set(moduleName TinyXml)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include"
		LIB "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/yaml-cpp.lib"
	)

	ReMake_CopyDllToTarget(${targetName} "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/bin/yaml-cpp.dll")

endfunction()

function(UseAssimp targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")
	message(STATUS "${targetName} link ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/")

	set(moduleName Assimp)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include"
		LIB "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/assimp-vc142-mt.lib"
		DEFINE ASSIMP_DLL
	)

	ReMake_CopyDllToTarget(${targetName} "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/assimp-vc142-mt.dll")

endfunction()
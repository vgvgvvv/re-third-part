

function(UseVulkan targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")
	message(STATUS "${targetName} add lib ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/valkan-1.lib")

	find_library(Vulkan_LIBRARY NAMES vulkan-1 vulkan PATHS ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib)

	set(moduleName Vulkan)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include"
		LIB "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/vulkan-1.lib"
	)

endfunction()
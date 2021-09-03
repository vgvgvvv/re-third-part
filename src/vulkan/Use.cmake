

function(UseVulkan targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")
	message(STATUS "${targetName} add lib ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/valkan-1.lib")

	find_library(Vulkan_LIBRARY NAMES vulkan-1 vulkan PATHS ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib)

	if(PLATFORM_WINDOWS)
		set(KHR_DEFINE VK_USE_PLATFORM_WIN32_KHR)
	elseif(PLATFORM_MACOS)
		set(KHR_DEFINE VK_USE_PLATFORM_MACOS_MVK)
	endif()

	set(moduleName Vulkan)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include"
		LIB "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/vulkan-1.lib"
	)

	add_definitions(${KHR_DEFINE})
	add_definitions(-DUSE_VULKAN)

endfunction()
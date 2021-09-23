

function(UseVulkan targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")
	message(STATUS "${targetName} add lib ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/valkan-1.lib")

	find_library(Vulkan_LIBRARY NAMES vulkan-1 vulkan PATHS ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib)

	if(${RE_TARGET_PLATFORM} STREQUAL "Windows")
		set(KHR_DEFINE VK_USE_PLATFORM_WIN32_KHR=1)
	elseif(${RE_TARGET_PLATFORM} STREQUAL "MacOS")
		set(KHR_DEFINE VK_USE_PLATFORM_MACOS_MVK=1)
	else()
		message(FATAL_ERROR "not support platform ${RE_TARGET_PLATFORM}")
	endif()

	set(moduleName Vulkan)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include"
		LIB "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/vulkan-1.lib"
		DEFINE ${KHR_DEFINE}
	)

endfunction()
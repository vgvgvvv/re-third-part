

function(UseImguiWithDock targetName backend)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}")
	target_include_directories(${targetName} PUBLIC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}")
	target_include_directories(${targetName} PUBLIC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/backends/")

	message(STATUS "${targetName} add source ${CMAKE_CURRENT_FUNCTION_LIST_DIR}")
	target_sources(${targetName} PRIVATE 
		"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/imgui.cpp"
		"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/imgui_demo.cpp"
		"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/imgui_draw.cpp"
		"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/imgui_tables.cpp"
		"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/imgui_widgets.cpp"
		)

	if("${backend}" STREQUAL "")
		return()
	endif()

	if(${backend} STREQUAL "Glfw")
		target_sources(${targetName} PRIVATE 
			"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/backends/imgui_impl_glfw.cpp"
			"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/backends/imgui_impl_opengl3.cpp")
	else()
		message(FATEL "not support backend ${backend}")
	endif()
endfunction()
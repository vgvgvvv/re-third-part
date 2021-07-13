
function(UseGlew targetName)

	message(STATUS "${targetName} include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")
	target_include_directories(${targetName} PUBLIC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")

	message(STATUS "${targetName} link ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/Release/x64")
	target_link_directories(${targetName} PUBLIC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/Release/x64")
	target_link_libraries(${targetName} PUBLIC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/Release/x64/glew32.lib")

	add_custom_command(TARGET ${targetName} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different  
        "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/bin/Release/x64/glew32.dll"
        $<TARGET_FILE_DIR:${targetName}>)


endfunction()
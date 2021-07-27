
function(UseAssimp targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")
	target_include_directories(${targetName} PUBLIC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")

	message(STATUS "${targetName} link ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/")
	target_link_directories(${targetName} PUBLIC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/")
	target_link_libraries(${targetName} PUBLIC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/assimp-vc142-mt.lib")

	target_compile_definitions(${targetName} PUBLIC ASSIMP_DLL)

	add_custom_command(TARGET ${targetName} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different  
        "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/lib/assimp-vc142-mt.dll"
        $<TARGET_FILE_DIR:${targetName}>)

endfunction()
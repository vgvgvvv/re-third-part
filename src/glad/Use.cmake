
function(UseGlad targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")
	target_include_directories(${targetName} PUBLIC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")

	message(STATUS "${targetName} add source ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/src/glad.c")
	target_sources(${targetName} PRIVATE "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/src/glad.c")

endfunction()
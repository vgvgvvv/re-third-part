
function(UseTinyXml targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}")
	target_include_directories(${targetName} PUBLIC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}")

	message(STATUS "${targetName} add source ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/tinyxml2.cpp")
	target_sources(${targetName} PRIVATE "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/tinyxml2.cpp")

endfunction()
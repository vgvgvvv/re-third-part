
function(UseUUID targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}")
	target_include_directories(${targetName} PUBLIC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}")

	add_definitions(-DUUID_SYSTEM_GENERATOR)

endfunction()
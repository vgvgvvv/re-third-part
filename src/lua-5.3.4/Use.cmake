
function(UseLua targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")
	target_include_directories(${targetName} PUBLIC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")

	message(STATUS "${targetName} link ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/libs/Release/x64")
	target_link_directories(${targetName} PUBLIC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/libs/Release/x64")
	target_link_libraries(${targetName} PUBLIC lua)

endfunction()

function(UseRapidJson targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")
	target_include_directories(${targetName} PUBLIC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/include")

	add_definitions(-DRAPIDJSON_HAS_STDSTRING=1)

endfunction()
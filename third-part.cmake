
function(UseThirdPart)
	file(GLOB_RECURSE children LIST_DIRECTORIES true ${CMAKE_CURRENT_SOURCE_DIR}/src/*)
	set(dirs "")
	foreach(item ${children})
	if(IS_DIRECTORY ${item} AND EXISTS "${item}/Use.cmake")
		list(APPEND dirs ${item})
		include("${item}/Use.cmake")
	endif()
	endforeach()
	foreach(dir ${dirs})
		set(libraryName "")
		get_filename_component(libraryName ${dir} NAME)
		message(STATUS "Usagable Library - ${libraryName}")
	endforeach()
endfunction()



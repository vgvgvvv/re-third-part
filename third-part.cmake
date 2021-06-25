
function(UseThirdPart)
	include("${CMAKE_CURRENT_FUNCTION_LIST_DIR}/src/glew-2.1.0/UseGlew.cmake")
	include("${CMAKE_CURRENT_FUNCTION_LIST_DIR}/src/glfw-3.34/UseGlfw.cmake")
	include("${CMAKE_CURRENT_FUNCTION_LIST_DIR}/src/glad/UseGlad.cmake")
endfunction()

message(STATUS "include test_opengl")

set(targetName TestOpenGL)
ReMake_AddTarget(
	TARGET_NAME ${targetName}
	MODE EXE
	LIB opengl32
)

USEGLAD(${targetName})
USEGLFW(${targetName})
USEFMT(${targetName})
USEIMGUIWITHDOCK(${targetName} Glfw)
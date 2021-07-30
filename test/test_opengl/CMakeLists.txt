
message(STATUS "include test_opengl")

set(targetName TestOpenGL)
ReMake_AddTarget(
	TARGET_NAME ${targetName}
	MODE EXE
	LIB opengl32
)

REMAKE_STARTUSE()
USEGLAD(${targetName})
USEGLFW(${targetName})
USEFMT(${targetName})
USEIMGUIWITHDOCK(${targetName} Glfw)
REMAKE_ENDUSE()
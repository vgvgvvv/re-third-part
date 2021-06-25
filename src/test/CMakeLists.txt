
message(STATUS "include test")

set(targetName Test)
ReMake_AddTarget(
	TARGET_NAME ${targetName}
	MODE EXE
	LIB opengl32
)

USEGLAD(${targetName})
USEGLEW(${targetName})
USEGLFW(${targetName})

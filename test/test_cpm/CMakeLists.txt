

set(targetName TestEventpp)
ReMake_AddTarget(
	TARGET_NAME ${targetName}
	MODE EXE
)

ReMake_StartUse()
UseEventpp(${targetName})
ReMake_EndUse()
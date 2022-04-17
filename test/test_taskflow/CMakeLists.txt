

set(targetName TestTaskflow)
ReMake_AddTarget(
	TARGET_NAME ${targetName}
	MODE EXE
)

ReMake_StartUse()
UseTaskflow(${targetName})
ReMake_EndUse()

set(targetName TestYaml)
ReMake_AddTarget(
	TARGET_NAME ${targetName}
	MODE EXE
)

ReMake_StartUse()
UseYaml(${targetName})
ReMake_EndUse()
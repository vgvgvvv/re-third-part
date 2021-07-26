
set(targetName TestYaml)
ReMake_AddTarget(
	TARGET_NAME ${targetName}
	MODE EXE
)

UseYaml(${targetName})
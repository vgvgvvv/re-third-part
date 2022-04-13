
function(UseEventpp targetName)

	CpmAddPackage(
		NAME eventpp 
		GITHUB_REPOSITORY "wqking/eventpp"
		GIT_TAG v0.1.2
	)

	set(moduleName eventpp)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		LIB eventpp 
	)

endfunction()
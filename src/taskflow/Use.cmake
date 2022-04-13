
function(UseTaskflow targetName)

	CpmAddPackage(
		NAME taskflow 
		GITHUB_REPOSITORY "taskflow/taskflow"
		GIT_TAG v3.3.0
	)

	set(moduleName taskflow)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		LIB tf::default_settings 
	)

endfunction()

function(UseLuau targetName)

	CpmAddPackage(
		NAME luau 
		GITHUB_REPOSITORY "Roblox/luau"
		GIT_TAG 0.532
	)

endfunction()
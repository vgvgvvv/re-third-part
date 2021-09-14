

function(UseDirectX11 targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Include")
	message(STATUS "${targetName} add lib ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Lib/x64/")

	set(moduleName DirectX12)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Include"
		LIB "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Lib/x64/dxgi.lib"
			"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Lib/x64/d3d9.lib"
			"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Lib/x64/d3d11.lib"
			"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Lib/x64/dxguid.lib"
			"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Lib/x64/d3dcompiler.lib"
			"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Lib/x64/d3dx11.lib"
			"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Lib/x64/dinput8.lib"
			"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Lib/x64/X3DAudio.lib"
			"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Lib/x64/xapobase.lib"
			"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Lib/x64/XAPOFX.lib"
		DEFINE "WITH_D3DX_LIBS=1"
	)

endfunction()


function(UseDirectX12 targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Include")
	message(STATUS "${targetName} add lib ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Lib/x64/")

	set(moduleName DirectX12)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Include" 
			"${CMAKE_CURRENT_FUNCTION_LIST_DIR}/D3DX12/Include" 
		LIB "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Lib/x64/d3d12.lib"
	)

	add_custom_command(TARGET ${targetName} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different  
        "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/DirectX/Bin/x64/d3d12.dll"
        $<TARGET_FILE_DIR:${targetName}>)

	UseDirectX11(${targetName})

endfunction()
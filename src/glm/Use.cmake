

macro(Gml_UseCpp11 ENABLE)
	message(STATUS "GML Enabled cpp11")
	set(GLM_TEST_ENABLE_CXX_11 ${ENABLE})
endmacro()

macro(Gml_UseMsExtension ENABLE)
	message(STATUS "GML Enabled MS Extension")	
	set(GLM_TEST_ENABLE_MS_EXTENSIONS ${ENABLE})
endmacro()

macro(Gml_UseSIMD ENABLE)
	message(STATUS "GML Enabled SIMD")
	set(GLM_TEST_ENABLE_SIMD ${ENABLE})
endmacro()

macro(Gml_UseFastMath ENABLE)
	message(STATUS "GML Enabled FastMath")
	set(GLM_TEST_ENABLE_FAST_MATH ${ENABLE})
endmacro()

macro(UseGml targetName)

	message(STATUS "${targetName}  include ${CMAKE_CURRENT_FUNCTION_LIST_DIR}")

	option(GLM_TEST_ENABLE_CXX_11 "Enable C++ 11" ON)
	if(GLM_TEST_ENABLE_CXX_11)
		if(CMAKE_COMPILER_IS_GNUCXX)
			add_definitions(-std=c++0x)
		endif()
	elseif(NOT GLM_TEST_ENABLE_CXX_11)
		if(CMAKE_COMPILER_IS_GNUCXX)
			add_definitions(-std=c++98)
		endif()
	endif()

	option(GLM_TEST_ENABLE_MS_EXTENSIONS "Enable MS extensions" OFF)
	if(GLM_TEST_ENABLE_MS_EXTENSIONS)
		if(CMAKE_COMPILER_IS_GNUCXX)
			#Doesn't seem to work...
			#add_definitions(-fms-extensions)
			#add_definitions(-D_MSC_EXTENSIONS)
		endif()
	elseif(NOT GLM_TEST_ENABLE_MS_EXTENSIONS)
		if(CMAKE_COMPILER_IS_GNUCXX)
			add_definitions(-std=c++98)
			add_definitions(-pedantic)
		endif()

		if(MSVC)
			add_definitions(/Za)	
		endif()
	endif()

	option(GLM_TEST_ENABLE_SIMD "Enable SIMD optimizations" OFF)
	if(GLM_TEST_ENABLE_SIMD)
		if(CMAKE_COMPILER_IS_GNUCXX)
			add_definitions(-msse2)
		endif()

		if(MSVC)
			add_definitions(/arch:SSE2)	
		endif()
	elseif(NOT GLM_TEST_ENABLE_SIMD)
	
		add_definitions(-DGLM_FORCE_PURE)

		if(CMAKE_COMPILER_IS_GNUCXX)
			add_definitions(-mfpmath=387)
		endif()
	endif()

	option(GLM_TEST_ENABLE_FAST_MATH "Enable fast math optimizations" OFF)
	if(GLM_TEST_ENABLE_FAST_MATH)
		if(CMAKE_COMPILER_IS_GNUCXX)
			add_definitions(-ffast-math)
		endif()

		if(MSVC)
			add_definitions(/fp:fast)	
		endif()
	elseif(NOT GLM_TEST_ENABLE_FAST_MATH)
		if(MSVC)
			add_definitions(/fp:precise)	
		endif()
	endif()

	set(moduleName Gml)
	ReMake_AddCustomModule(
		TARGET_NAME ${targetName}
		MODULE_NAME ${moduleName}
		INC "${CMAKE_CURRENT_FUNCTION_LIST_DIR}"
	)

endmacro()
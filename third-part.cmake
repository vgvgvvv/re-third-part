
function(ReMake_UseThirdPart)
	file(GLOB_RECURSE children LIST_DIRECTORIES true ${CMAKE_CURRENT_SOURCE_DIR}/src/*)
	set(dirs "")
	foreach(item ${children})
	if(IS_DIRECTORY ${item} AND EXISTS "${item}/Use.cmake")
		list(APPEND dirs ${item})
		include("${item}/Use.cmake")
	endif()
	endforeach()
	foreach(dir ${dirs})
		set(libraryName "")
		get_filename_component(libraryName ${dir} NAME)
		message(STATUS "Usagable Library - ${libraryName}")
	endforeach()
endfunction()

macro(ReMake_CopyDllToTarget targetName dllLocation)

    add_custom_command(TARGET ${targetName} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different  
        "${DllLocation}"
        $<TARGET_FILE_DIR:${targetName}>)

endmacro()

function(ReMake_StartUse)

    if("${ReMake_HasStartUse}" STREQUAL "TRUE")
        message(FATAL_ERROR "you should end use first")
    endif()

    set(ReMake_HasStartUse TRUE PARENT_SCOPE)
    set(ReMake_CustomModuleList "" PARENT_SCOPE)

endfunction()

function(ReMake_EndUse)

    if("${ReMake_HasStartUse}" STREQUAL "FALSE")
        message(FATAL_ERROR "you should start use first")
    endif()

    set(ReMake_HasStartUse FALSE PARENT_SCOPE)
    
    message(STATUS "ReMake_CustomModuleList ${ReMake_CustomModuleList}")

    set(ModuleListFileListFile "")
    set(FileLocation "${CMAKE_CURRENT_LIST_DIR}/CustomModuleList.txt")
    foreach(item ${ReMake_CustomModuleList})
        string(APPEND ModuleListFileListFile "${item}")
    endforeach()

    file(WRITE ${FileLocation} ${ModuleListFileListFile})

    set(ReMake_CustomModuleList "" PARENT_SCOPE)
endfunction()

macro(ReMake_AddCustomModule)

  
    message(STATUS "----------")
    message(STATUS "Add Custom Module")

    set(arglist "")
    # public
    list(APPEND arglist 
        SOURCE_PUBLIC 
        INC 
        LIB 
        DEFINE 
        C_OPTION 
        L_OPTION 
        PCH_PUBLIC)
    # interface
    list(APPEND arglist 
        SOURCE_INTERFACE 
        INC_INTERFACE 
        LIB_INTERFACE 
        DEFINE_INTERFACE 
        C_OPTION_INTERFACE 
        L_OPTION_INTERFACE 
        PCH_INTERFACE)
    # private
    list(APPEND arglist 
        SOURCE 
        INC_PRIVATE 
        LIB_PRIVATE 
        DEFINE_PRIVATE 
        C_OPTION_PRIVATE 
        L_OPTION_PRIVATE 
        PCH)

    cmake_parse_arguments(
        "ARG"
        "TEST"
        "TARGET_NAME;MODULE_NAME;"
        "${arglist}"
        ${ARGN}
    )

    set(targetName ${ARG_TARGET_NAME})
    set(moduleName ${ARG_MODULE_NAME})

      if(NOT "${ReMake_HasStartUse}" STREQUAL "TRUE")
        message(FATAL_ERROR " - target: ${targetName} \n - module : ${moduleName} \n - you should start use first")
    endif()


    ReMake_ExpandSources(sources_public ARG_SOURCE_PUBLIC)
    ReMake_ExpandSources(sources_interface ARG_SOURCE_INTERFACE)
    ReMake_ExpandSources(sources_private ARG_SOURCE)

    target_sources(${targetName}
        PUBLIC ${sources_public}
        INTERFACE ${sources_interface}
        PRIVATE ${sources_private}
    )

    target_include_directories(${targetName}
      PUBLIC ${ARG_INC}
      INTERFACE ${ARG_INC_INTERFACE}
      PRIVATE ${ARG_INC_PRIVATE}
    )

     # target define
    target_compile_definitions(${targetName}
      PUBLIC ${ARG_DEFINE}
      INTERFACE ${ARG_DEFINE_INTERFACE}
      PRIVATE ${ARG_DEFINE_PRIVATE}
    )

     # target lib
    target_link_libraries(${targetName}
      PUBLIC ${ARG_LIB}
      INTERFACE ${ARG_LIB_INTERFACE}
      PRIVATE ${ARG_LIB_PRIVATE}
    )

    # target compile option
    target_compile_options(${targetName}
      PUBLIC ${ARG_C_OPTION}
      INTERFACE ${ARG_C_OPTION_INTERFACE}
      PRIVATE ${ARG_C_OPTION_PRIVATE}
    )
    
    # target link option
    target_link_options(${targetName}
      PUBLIC ${ARG_L_OPTION}
      INTERFACE ${ARG_L_OPTION_INTERFACE}
      PRIVATE ${ARG_L_OPTION_PRIVATE}
    )
    
    # target pch
    target_precompile_headers(${targetName}
      PUBLIC ${ARG_PCH_PUBLIC}
      INTERFACE ${ARG_PCH_INTERFACE}
      PRIVATE ${ARG_PCH}
    )

    message(STATUS "----------")

    message(STATUS "generate module info...")

    string(APPEND TargetArgs "{\n")
    string(APPEND TargetArgs "  \"moduleName\" : \"${moduleName}\",\n" )
    
    string(APPEND TargetArgs "  \n" )

    Json_ListToJsonString(ARG_INC TempList)
    string(APPEND TargetArgs "  \"public_include\" : ${TempList},\n")
    Json_ListToJsonString(ARG_INC_INTERFACE TempList)
    string(APPEND TargetArgs "  \"interface_include\" : ${TempList},\n")
    Json_ListToJsonString(ARG_INC_PRIVATE TempList)
    string(APPEND TargetArgs "  \"private_include\" : ${TempList},\n")
    
    string(APPEND TargetArgs "  \n" )
    
    Json_ListToJsonString(sources_public TempList)
    string(APPEND TargetArgs "  \"public_source\" : ${TempList},\n")
    Json_ListToJsonString(sources_interface TempList)
    string(APPEND TargetArgs "  \"interface_source\" : ${TempList},\n")
    Json_ListToJsonString(sources_private TempList)
    string(APPEND TargetArgs "  \"private_source\" : ${TempList},\n")

    string(APPEND TargetArgs "  \n" )
    
    Json_ListToJsonString(ARG_C_OPTION TempList)
    string(APPEND TargetArgs "  \"public_compile_options\" : ${TempList},\n")
    Json_ListToJsonString(ARG_C_OPTION_INTERFACE TempList)
    string(APPEND TargetArgs "  \"interface_compile_options\" : ${TempList},\n")
    Json_ListToJsonString(ARG_C_OPTION_PRIVATE TempList)
    string(APPEND TargetArgs "  \"private_compile_options\" : ${TempList},\n")
    
    string(APPEND TargetArgs "  \n" )
    
    Json_ListToJsonString(ARG_L_OPTION TempList)
    string(APPEND TargetArgs "  \"public_link_options\" : ${TempList},\n")
    Json_ListToJsonString(ARG_L_OPTION_INTERFACE TempList)
    string(APPEND TargetArgs "  \"interface_link_options\" : ${TempList},\n")
    Json_ListToJsonString(ARG_L_OPTION_PRIVATE TempList)
    string(APPEND TargetArgs "  \"private_link_options\" : ${TempList},\n")
    
    string(APPEND TargetArgs "  \n" )
    
    Json_ListToJsonString(ARG_PCH_PUBLIC TempList)
    string(APPEND TargetArgs "  \"public_pch\" : ${TempList},\n")
    Json_ListToJsonString(ARG_PCH_INTERFACE TempList)
    string(APPEND TargetArgs "  \"interface_pch\" : ${TempList},\n")
    Json_ListToJsonString(ARG_PCH TempList)
    string(APPEND TargetArgs "  \"private_pch\" : ${TempList},\n")
    
    string(APPEND TargetArgs "  \n" )
    
    Json_ListToJsonString(ARG_LIB TempList)
    string(APPEND TargetArgs "  \"public_lib\" : ${TempList},\n" )
    Json_ListToJsonString(ARG_LIB_INTERFACE TempList)
    string(APPEND TargetArgs "  \"interface_lib\" : ${TempList},\n" )
    Json_ListToJsonString(ARG_LIB_PRIVATE TempList)
    string(APPEND TargetArgs "  \"private_lib\" : ${TempList}\n" )
    string(APPEND TargetArgs "}\n")

    write_file(${CMAKE_CURRENT_FUNCTION_LIST_DIR}/${moduleName}.CustomModule.json ${TargetArgs})
    message(STATUS "Write to ${CMAKE_CURRENT_FUNCTION_LIST_DIR}/${moduleName}.CustomModule.json")

    message(STATUS "----------")

    set(CustomModuleFile "${CMAKE_CURRENT_FUNCTION_LIST_DIR}/${moduleName}.CustomModule.json")
    set(ModuleList ${ReMake_CustomModuleList})
    list(APPEND ModuleList "${targetName}=>${CustomModuleFile}\n")
    set(ReMake_CustomModuleList ${ModuleList} PARENT_SCOPE)

endmacro()

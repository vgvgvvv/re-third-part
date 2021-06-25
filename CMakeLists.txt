cmake_minimum_required(VERSION 3.17)

project(ThirdPart)

message(STATUS "fetch re-make library")
include(FetchContent)
FetchContent_Declare(
  re-cmake
  GIT_REPOSITORY https://github.com/vgvgvvv/re-cmake
  GIT_TAG        "test-1.1"
)
FetchContent_MakeAvailable(re-cmake)


message(STATUS "re-cmake_SOURCE_DIR ${re-cmake_SOURCE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${re-cmake_SOURCE_DIR}")
include(Init)

ReMake_InitProject()

include(third-part.cmake)
UseThirdPart()

function(IsRootProject Result)
    if(${REMAKE_ROOT_PATH} STREQUAL ${CMAKE_CURRENT_SOURCE_DIR})
        set(${Result} TRUE PARENT_SCOPE)
    else()
        set(${Result} FALSE PARENT_SCOPE)
    endif()
endfunction()


ReMake_AddSubDirsRec(src)
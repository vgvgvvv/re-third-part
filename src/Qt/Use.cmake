
macro(UseQt)
    set(QtVersion 6)
    set(CMAKE_AUTOMOC ON)
endmacro()

macro(FindQtComponent ComponentName)

    #See if the environment var is set
    if(DEFINED ENV{Qt${QtVersion}_HOME})
        message(STATUS "Looking for Qt in: " $ENV{Qt${QtVersion}_HOME})
    else()
        message(STATUS "Qt${QtVersion}_HOME environment variable not set. Checking default paths.")
    endif()

    find_package(Qt${QtVersion}
            COMPONENTS ${ComponentName}
            REQUIRED PATHS "$ENV{Qt${QtVersion}_HOME}")

    message(STATUS "!!! include QT include dir Qt${QtVersion}_INCLUDE_DIRS : ${Qt${QtVersion}_INCLUDE_DIRS}")

endmacro()
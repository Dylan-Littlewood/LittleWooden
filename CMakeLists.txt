cmake_minimum_required(VERSION 3.28)
project("LittleWooden" CXX)
include(Utils.cmake)
set(CORE_PROJECT "Core")
set(APP_PROJECT "Editor")

# Display CMAKE variables
MESSAGE(STATUS "Using toolchain file: ${CMAKE_TOOLCHAIN_FILE}\n")
MESSAGE(STATUS "[ COMPILERS ]")
MESSAGE(STATUS "Using C compiler: ${CMAKE_C_COMPILER}")
MESSAGE(STATUS "Using C flags: ${CMAKE_C_FLAGS}")
MESSAGE(STATUS "Using CXX compiler: ${CMAKE_CXX_COMPILER}")
MESSAGE(STATUS "Using CXX flags: ${CMAKE_CXX_FLAGS}\n")

# Set the version of C++ for the project.
set(CMAKE_CXX_STANDARD 23)

# Include the core library project.
add_subdirectory(${CORE_PROJECT})

# Include the application project.
add_subdirectory(${APP_PROJECT})

# Set the desired file paths for the output files.
set_target_properties(${CORE_PROJECT} ${APP_PROJECT}
        PROPERTIES
        ARCHIVE_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/.build/${CMAKE_BUILD_TYPE}/lib"
        LIBRARY_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/.build/${CMAKE_BUILD_TYPE}/lib"
        RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/.build/${CMAKE_BUILD_TYPE}/bin"
)
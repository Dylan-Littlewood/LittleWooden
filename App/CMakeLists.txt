
# Create an executable
add_executable(${APP_PROJECT})
set(CURRENT_PROJECT ${APP_PROJECT})
set(CURRENT_PROJECT_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/")

clear_source()
get_source(src)

# Link to the library foo
target_link_libraries(${APP_PROJECT} ${CORE_PROJECT})

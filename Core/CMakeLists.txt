
# Create a library
add_library(${CORE_PROJECT})
set(CURRENT_PROJECT ${CORE_PROJECT})
set(CURRENT_PROJECT_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/")

clear_source()
get_source(src)

find_package(glfw3 CONFIG REQUIRED)
target_link_libraries(${CORE_PROJECT} PRIVATE glfw)

find_package(imgui CONFIG REQUIRED)
target_link_libraries(${CORE_PROJECT} PRIVATE imgui::imgui)

find_package(Vulkan REQUIRED)
target_link_libraries(${CORE_PROJECT} PRIVATE Vulkan::Vulkan)

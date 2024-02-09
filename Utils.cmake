macro(get_relative_path out-var)
    string(LENGTH ${CURRENT_PROJECT_ROOT} path-length)
    string(SUBSTRING "${CMAKE_CURRENT_SOURCE_DIR}/" ${path-length} -1 ${out-var})
endmacro()

macro(set_source type)
    get_relative_path(rel-path)
    set(source_list)
    set(arg_list "${ARGN}")
    foreach (arg IN LISTS arg_list)
        set(source_list ${source_list} "${rel-path}${arg}")
    endforeach ()
    set(${type}_SOURCE_FILES
            ${${type}_SOURCE_FILES}
            ${source_list}
            PARENT_SCOPE)
endmacro()

macro(clear_source)
    set(MODULE_SOURCE_FILES)
    set(IMPLEMENTATION_SOURCE_FILES)
endmacro()

macro(add_source)
    set(arg_list "${ARGN}")
    foreach (arg IN LISTS arg_list)
        add_subdirectory(${arg})
    endforeach ()
endmacro()

macro(get_source)
    add_source(${ARGN})
    # Add the module files to the library
    target_sources(${CURRENT_PROJECT}
            PUBLIC
            FILE_SET CXX_MODULES FILES
            ${MODULE_SOURCE_FILES}
    )
    # Add the implementation files to the library
    target_sources(${CURRENT_PROJECT} PRIVATE
            ${IMPLEMENTATION_SOURCE_FILES}
    )
endmacro()
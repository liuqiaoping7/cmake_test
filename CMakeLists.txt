cmake_minimum_required (VERSION 3.6)

project ("test")

if("${LIBRARY_TYPE}" STREQUAL "")
    set(LIBRARY_TYPE SHARED)
    # set(LIBRARY_TYPE STATIC)
endif()

include_directories(${CMAKE_CURRENT_LIST_DIR}/lib)
add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/lib)

aux_source_directory(${CMAKE_CURRENT_LIST_DIR} MAINSRC)
add_executable(test ${MAINSRC})
target_link_libraries(test PRIVATE lib)

install(TARGETS test
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})

message(WARNING ${CMAKE_CURRENT_LIST_DIR})
if("${LIBRARY_TYPE}" STREQUAL "SHARED")
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
endif()

include_directories(${CMAKE_CURRENT_LIST_DIR}/libliba)
include_directories(${CMAKE_CURRENT_LIST_DIR}/liblibb)

add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/libliba)
add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/liblibb)

aux_source_directory(${CMAKE_CURRENT_LIST_DIR} LIBSRC)
add_library(lib ${LIBRARY_TYPE} ${LIBSRC})
target_link_libraries(lib PRIVATE libliba)
target_link_libraries(lib PRIVATE liblibb)

install(TARGETS lib
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})

message(WARNING ${CMAKE_CURRENT_LIST_DIR})
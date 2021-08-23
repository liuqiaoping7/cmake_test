cmake_minimum_required (VERSION 3.6)

project ("cmake_lib_out")

#[[
shared include static: compile need lib.so, run need lib.so
static include static: compile need lib.a liblib.a, run need none
shared include shared: compile need lib.so, run need lib.so liblib.so
static include shared: compile need lib.a liblib.so, run need liblib.so
]]
if("${LIB_TYPE}" STREQUAL "")
    set(LIB_TYPE SHARED)
endif()
if("${LIBLIB_TYPE}" STREQUAL "")
    set(LIBLIB_TYPE SHARED)
endif()

if(WIN32)
if(("${LIB_TYPE}" STREQUAL "SHARED") OR ("${LIBLIB_TYPE}" STREQUAL "SHARED") )
    set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
endif()
endif()

include_directories(${CMAKE_CURRENT_LIST_DIR}/lib)
add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/lib)

aux_source_directory(${CMAKE_CURRENT_LIST_DIR} MAINSRC)
add_executable(test ${MAINSRC})
target_link_libraries(test PRIVATE lib)

# # Library not loaded:
# # error while loading shared libraries
if(UNIX)
# set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")    for all not good
set_target_properties(test PROPERTIES INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
endif()

install(TARGETS test
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})

message(STATUS ${CMAKE_CURRENT_LIST_DIR})
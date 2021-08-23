cmake_minimum_required (VERSION 3.6)

project ("cmake_lib_in")

if(("${LIB_TYPE}" STREQUAL "") OR ("${LIBLIB_TYPE}" STREQUAL ""))
        message(FATAL_ERROR "LIB_TYPE need to know for compile")
endif()

if(WIN32)
include_directories(${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/windows/include)
link_directories(${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/windows/lib)
elseif(APPLE AND NOT IOS)
include_directories(${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/mac/include)
link_directories(${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/mac/lib)
elseif(UNIX AND NOT APPLE AND NOT ANDROID)
include_directories(${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/linux/include)
link_directories(${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/linux/lib)
endif()

aux_source_directory(${CMAKE_CURRENT_LIST_DIR} MAINSRC)
add_executable(test ${MAINSRC})

if(("${LIB_TYPE}" STREQUAL "STATIC") AND ("${LIBLIB_TYPE}" STREQUAL "SHARED"))
target_link_libraries(test PRIVATE lib libliba liblibb)
else()
target_link_libraries(test PRIVATE lib)
endif()

# Library not loaded
# error while loading shared libraries
if(UNIX)
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
if(APPLE AND NOT IOS)
set_target_properties(test PROPERTIES INSTALL_RPATH "${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/mac/lib")
elseif(NOT APPLE AND NOT ANDROID)
set_target_properties(test PROPERTIES INSTALL_RPATH "${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/linux/lib")
endif()
endif()

install(TARGETS test
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})

message(STATUS ${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/include)
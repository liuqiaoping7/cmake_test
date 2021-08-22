cmake_minimum_required (VERSION 3.6)

project ("cmake_lib_in")

if(WIN32)
include_directories(${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/windows/include)
link_directories(${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/windows/lib)
elseif(APPLE AND NOT IOS)
include_directories(${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/mac/include)
link_directories(${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/mac/lib)
elseif(UNIX AND NOT APPLE AND NOT IOS AND NOT ANDROID)
include_directories(${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/linux/include)
link_directories(${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/linux/lib)
endif()

aux_source_directory(${CMAKE_CURRENT_LIST_DIR} MAINSRC)
add_executable(test ${MAINSRC})
# target_link_libraries(test PRIVATE lib libliba liblibb)
target_link_libraries(test PRIVATE merge)

install(TARGETS test
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})

message(WARNING ${CMAKE_CURRENT_LIST_DIR}/../producer/cmake_test_sdk/include)
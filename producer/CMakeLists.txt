cmake_minimum_required (VERSION 3.6)

# macro(print_all_var)
# 	get_cmake_property(_variableNames VARIABLES)
# 	list (SORT _variableNames)
# 	foreach (_variableName ${_variableNames})
# 		message(STATUS "${_variableName}=${${_variableName}}")
# 	endforeach()
# endmacro()

# SET( CMAKE_C_COMPILER "C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.28.29333/bin/Hostx64/x86/cl.exe" )
# SET( CMAKE_CXX_COMPILER "C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.28.29333/bin/Hostx64/x86/cl.exe" )
# SET( CMAKE_AR "C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/VC/Tools/MSVC/14.28.29333/bin/Hostx64/x86/lib.exe" )

project ("cmake_lib_out")
# print_all_var()

message(STATUS "CMAKE_INSTALL_LIBDIR = ${CMAKE_INSTALL_LIBDIR}")
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

if(MSVC)  
    set_target_properties(test PROPERTIES LINK_FLAGS_RELEASE "/d2:-AllowCompatibleILVersions")    
    set_target_properties(test PROPERTIES LINK_FLAGS_RELWITHDEBINFO "/d2:-AllowCompatibleILVersions")    
endif()
# if(MSVC) 
#     set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS_RELEASE "/LTCG:OFF")    
#     set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS_RELWITHDEBINFO "/LTCG:OFF")    
# endif()
# if(MSVC)
#     # 开启MSVC提供的链接时代码生成，以取得更好的优化    
#     set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS_RELEASE "/LTCG")    
#     set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS_RELWITHDEBINFO "/LTCG")    
# endif()

install(TARGETS test
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})

message(STATUS ${CMAKE_CURRENT_LIST_DIR})
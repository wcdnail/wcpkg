cmake_minimum_required(VERSION 3.26 FATAL_ERROR)

project(ACE)

set(VCPKG_APPLOCAL_DEPS OFF)
add_library(${PROJECT_NAME} SHARED)

target_include_directories(${PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/ace
)

file(GLOB ACE_SOURCES CONFIGURE_DEPENDS
    "*.h"
    "*.inl"
    "*.cpp"
)

target_sources(${PROJECT_NAME} PRIVATE
    ${ACE_SOURCES}
)
source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${ACE_SOURCES})
source_group(".cmake" FILES ${CMAKE_CURRENT_SOURCE_DIR}/CMakeLists.txt)

target_compile_features(${PROJECT_NAME} PUBLIC
)

target_compile_definitions(${PROJECT_NAME} PRIVATE
    _DLL
    BUILD_ACE
)

target_compile_options(${PROJECT_NAME} PRIVATE
    $<$<PLATFORM_ID:Linux>:-fPIC>
)

target_include_directories(${PROJECT_NAME} SYSTEM PRIVATE
    ${VCPKG_PREFIX_PATH}/include
)

target_link_libraries(${PROJECT_NAME} PRIVATE
    OpenSSL::SSL
    OpenSSL::Crypto
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    LINK_WHAT_YOU_USE ON
)

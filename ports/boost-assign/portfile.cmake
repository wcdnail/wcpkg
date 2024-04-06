# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/assign
    REF boost-${VERSION}
    SHA512 e6887a3000b356b3c343d4a14c63757870493c264eff22a2c00f3c8c3dec30891dec336dce6121497e97146e5ece404f7dc2088715bf9fc7704b3d4aae44c598
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})

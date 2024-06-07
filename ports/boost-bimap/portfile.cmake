# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/bimap
    REF boost-${VERSION}
    SHA512 7165c94e2e4f7c12220fd71d877eb981f56b9218d1bbe34f09634faec1f4df604fcfe031dbd4bfb808181dba522b57b2d76850f29d5e1cf044bbb4b372129470
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)

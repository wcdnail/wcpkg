# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/headers
    REF boost-${VERSION}
    SHA512 6b9b8f669b5692a5fa97c591f11163ca0a37733662904a39e708194c910e1de362585275d26babeda0fe7eccec42a88661849efd194090d452a182fade9ea156
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)

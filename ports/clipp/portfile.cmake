vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "wcdnail/clipp"
    REF "${VERSION}"
    SHA512 7033666ca8548d85bb924e6ca9099c4cff36274d50048af8fe6be31e120939cbfd54baea0ed0dc8e8915bac8c68aae824454cb41a931b2202e8e914c235a6a26
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

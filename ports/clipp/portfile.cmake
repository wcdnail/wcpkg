vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "wcdnail/clipp"
    REF master
    SHA512 b2c03694b1e6c1b0ce1b3e5fe71b9567a423a8496f4f417bebaedea41205342a11e9151e38725b1455ee57e6235916f10bc50c24e6152ee663e63d7c0f115bc3
    HEAD_REF master
    PATCHES
        #Fix-result_of-deprecated-in-C++20.patch # https://github.com/muellan/clipp/pull/54
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

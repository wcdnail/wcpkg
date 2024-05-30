vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "wcdnail/clipp"
    REF master
    SHA512 8b8cbf7af3ff8363e9bce462927f736d343cc2f712130db1ad4aa509f7c20243a8b63aa59e0f9c0c7dda936c20d45df32aa7cb9a6508fc36810389fc6c8f68c0
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

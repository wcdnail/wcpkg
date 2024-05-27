vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO "wcdnail/clipp"
    REF master
    SHA512 a9d0269aa2127843f1b85984aeacb331a01c358c5ad11bc985122c1f7ff5ff214b9fa2d75136589113692d47c7fad00de7214030356587bfd6ab95caa7c68f48
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

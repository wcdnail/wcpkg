#
# vcpkg remove ace --recurse
# vcpkg install ace[ssl,asnmp,zlib]:x64-windows
#

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO wcdnail/ACE_WAO
    REF master
    SHA512 9bc88f4146605ca61b3d1905c0a206aeeabbdca0135dc55980f8567aa3424cb26818e661cfdace876ff6feeddf5738357ca9dd7fa16e22bb56f82a3d1148269f
    HEAD_REF master
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        ssl     ACE_BUILD_ASE_SSL
        asnmp   ACE_BUILD_ASE_ASNMP
        zlib    ACE_BUILD_WZLIB
)

if (ACE_BUILD_ASE_SSL)
    set(ACE_BUILD_ASE_SSL_OPTION "-DACE_BUILD_ASE_SSL=ON")
else()
    set(ACE_BUILD_ASE_SSL_OPTION "-DACE_BUILD_ASE_SSL=OFF")
endif()
if (ACE_BUILD_ASE_ASNMP)
    set(ACE_BUILD_ASE_ASNMP_OPTION "-DACE_BUILD_ASE_ASNMP=ON")
else()
    set(ACE_BUILD_ASE_ASNMP_OPTION "-DACE_BUILD_ASE_ASNMP=OFF")
endif()
if (ACE_BUILD_WZLIB)
    set(ACE_BUILD_WZLIB_OPTION "-DACE_BUILD_WZLIB=ON")
else()
    set(ACE_BUILD_WZLIB_OPTION "-DACE_BUILD_WZLIB=OFF")
endif()

message(STATUS ">>>> VCPKG_ROOT : ${VCPKG_ROOT_DIR}")
message(STATUS ">>>> ACE SSL    : ${ACE_BUILD_ASE_SSL_OPTION}")
message(STATUS ">>>> ACE ASNMP  : ${ACE_BUILD_ASE_ASNMP_OPTION}")
message(STATUS ">>>> ACE zlib   : ${ACE_BUILD_WZLIB_OPTION}")

vcpkg_configure_cmake(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DVCPKG_ROOT=${VCPKG_ROOT_DIR}
        ${ACE_BUILD_ACE_SSL_OPTION}
        ${ACE_BUILD_ASE_ASNMP_OPTION}
        ${ACE_BUILD_WZLIB_OPTION}
        -DACE_BUILD_EXAMPLES=OFF
    OPTIONS_DEBUG
    OPTIONS_RELEASE
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE
    ${CURRENT_PACKAGES_DIR}/debug/include
    ${CURRENT_PACKAGES_DIR}/debug/share
)

file(INSTALL "${SOURCE_PATH}/ACE/COPYING" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

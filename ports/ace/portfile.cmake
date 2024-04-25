#
# vcpkg remove ace --recurse
# vcpkg install ace[ssl,asnmp,zlib]:x64-windows
#

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO wcdnail/ACE_WAO
    REF master
    SHA512 b892c610c023fb973940827d50fbdfb9e507595a62cce95acd7192e4fca95f216f9de0fcb9d393162ac13d89c46d989c2d23080f3e4428c2556e4b61e2c5f323
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

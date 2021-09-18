
vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO mariusbancila/croncpp
  REF 999f7685ab683b58872386c0aa019acf97c6570a #master on 3/30/2021
  SHA512 b98bd838ac2c238bacedd949e15e3115f5c5448ed1d484f8a418f5284a64c4c989ed710e5e6657ae7d1b7266ec198c5efe97a2a2f66d7695925c17d6ca6f858f
  HEAD_REF master
  PATCHES
    0001-fix-cmake.patch
    no-test.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
      -DBUILD_TESTS=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")

# Handle copyright
file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

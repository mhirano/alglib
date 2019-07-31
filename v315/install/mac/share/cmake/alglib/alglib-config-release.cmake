#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "alglib" for configuration "Release"
set_property(TARGET alglib APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(alglib PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/release/libalglib.3.15.dylib"
  IMPORTED_SONAME_RELEASE "@rpath/libalglib.3.15.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS alglib )
list(APPEND _IMPORT_CHECK_FILES_FOR_alglib "${_IMPORT_PREFIX}/lib/release/libalglib.3.15.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)

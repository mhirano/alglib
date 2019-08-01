#----------------------------------------------------------------
# Generated CMake target import file for configuration "Debug".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "alglib" for configuration "Debug"
set_property(TARGET alglib APPEND PROPERTY IMPORTED_CONFIGURATIONS DEBUG)
set_target_properties(alglib PROPERTIES
  IMPORTED_LOCATION_DEBUG "${_IMPORT_PREFIX}/lib/libalglib.3.15d.dylib"
  IMPORTED_SONAME_DEBUG "@rpath/libalglib.3.15d.dylib"
  )

list(APPEND _IMPORT_CHECK_TARGETS alglib )
list(APPEND _IMPORT_CHECK_FILES_FOR_alglib "${_IMPORT_PREFIX}/lib/libalglib.3.15d.dylib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)

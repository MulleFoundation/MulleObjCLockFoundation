#
# This file will be included by cmake/share/Headers.cmake
#
# cmake/reflect/_Headers.cmake is generated by `mulle-sde reflect`.
# Edits will be lost.
#
if( MULLE_TRACE_INCLUDE)
   MESSAGE( STATUS "# Include \"${CMAKE_CURRENT_LIST_FILE}\"" )
endif()

#
# contents are derived from the file locations

set( INCLUDE_DIRS
src
src/reflect
)

#
# contents selected with patternfile ??-header--private-generated-headers
#
set( PRIVATE_GENERATED_HEADERS
src/reflect/_MulleObjCLockFoundation-import-private.h
src/reflect/_MulleObjCLockFoundation-include-private.h
)

#
# contents selected with patternfile ??-header--private-generic-headers
#
set( PRIVATE_GENERIC_HEADERS
src/import-private.h
)

#
# contents selected with patternfile ??-header--public-generated-headers
#
set( PUBLIC_GENERATED_HEADERS
src/reflect/_MulleObjCLockFoundation-export.h
src/reflect/_MulleObjCLockFoundation-import.h
src/reflect/_MulleObjCLockFoundation-include.h
src/reflect/_MulleObjCLockFoundation-provide.h
)

#
# contents selected with patternfile ??-header--public-generic-headers
#
set( PUBLIC_GENERIC_HEADERS
src/import.h
)

#
# contents selected with patternfile ??-header--public-headers
#
set( PUBLIC_HEADERS
src/MulleObjCLoader+MulleObjCLockFoundation.h
src/MulleObjCLockFoundation.h
src/NSConditionLock.h
src/NSCondition.h
src/NSLock.h
src/NSLocking.h
src/NSRecursiveLock.h
)


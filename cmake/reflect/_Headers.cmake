# This file will be regenerated by `mulle-match-to-cmake` via
# `mulle-sde reflect` and any edits will be lost.
#
# This file will be included by cmake/share/Headers.cmake
#
if( MULLE_TRACE_INCLUDE)
   MESSAGE( STATUS "# Include \"${CMAKE_CURRENT_LIST_FILE}\"" )
endif()

#
# contents are derived from the file locations

set( INCLUDE_DIRS
src
src/generic
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
src/generic/import-private.h
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
src/generic/import.h
)

#
# contents selected with patternfile ??-header--public-headers
#
set( PUBLIC_HEADERS
src/MulleObjCLoader+MulleObjCLockFoundation.h
src/MulleObjCLockFoundation.h
src/NSConditionLock+NSDate.h
src/NSConditionLock.h
src/NSCondition+NSDate.h
src/NSCondition.h
src/NSLock+NSDate.h
src/NSLock.h
src/NSLocking.h
src/NSRecursiveLock.h
src/reflect/_MulleObjCLockFoundation-versioncheck.h
)


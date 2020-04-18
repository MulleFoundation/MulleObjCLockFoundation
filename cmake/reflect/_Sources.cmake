#
# cmake/reflect/_Sources.cmake is generated by `mulle-sde reflect`. Edits will be lost.
#
if( MULLE_TRACE_INCLUDE)
   MESSAGE( STATUS "# Include \"${CMAKE_CURRENT_LIST_FILE}\"" )
endif()

set( SOURCES
src/class/NSAutoreleasePool.m
src/class/NSInvocation.m
src/class/NSLock.m
src/class/NSMethodSignature.m
src/class/NSObject+NSCodingSupport.m
src/class/NSObject.m
src/class/NSProxy.m
src/class/NSRecursiveLock.m
src/class/NSThread.m
src/function/MulleObjCAllocation.m
src/function/MulleObjCExceptionHandler.m
src/function/MulleObjCFunctions.m
src/function/MulleObjCStackFrame.m
src/function/NSDebug.m
src/mulle-objc-breakpoint.c
src/mulle-objc-threadfoundationinfo.m
src/mulle-objc-universeconfiguration.m
src/mulle-objc-universefoundationinfo.m
src/protocol/MulleObjCClassCluster.m
src/protocol/MulleObjCException.m
src/protocol/MulleObjCProtocol.m
src/protocol/MulleObjCSingleton.m
src/protocol/MulleObjCTaggedPointer.m
src/protocol/NSCoding.m
src/protocol/NSCopying.m
src/struct/MulleObjCContainerCallback.m
src/struct/NSRange.c
)

set( STAGE2_SOURCES
src/class/MulleObjCLoader.m
)

set( STANDALONE_SOURCES
src/MulleObjC-standalone.m
)
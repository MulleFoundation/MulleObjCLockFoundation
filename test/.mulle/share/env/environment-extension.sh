#
# These are used by mulle-match find to speed up the search.
#
<<<<<<< HEAD
export MULLE_MATCH_FIND_NAMES="*.args,*.stdout,*.stdin,*.stderr,*.errors,*.ccdiag"
=======
export MULLE_MATCH_FIND_NAMES="*.stdout,*.stdin,*.stderr,*.errors,*.ccdiag"
>>>>>>> bc910199e68391e0cd3e126be6fd31b04774d7d3


#
# Make project to test discoverable via MULLE_FETCH_SEARCH_PATH
# We assume we are in ${PROJECT_DIR}/test so modify search path to add ../..
#
export MULLE_FETCH_SEARCH_PATH="${MULLE_FETCH_SEARCH_PATH}:${MULLE_VIRTUAL_ROOT}/../.."


#
# For more aggressive leak testing, it is good if singletons cleanup
# in the NSAutoreleasePool. These ephemerals aren't thread safe singletons.
#
export MULLE_OBJC_EPHEMERAL_SINGLETON="YES"



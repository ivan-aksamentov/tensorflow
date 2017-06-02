include(FindPackageHandleStandardArgs)

unset(DeckLinkAPI_FOUND)

find_package(Threads)

find_path(JsonCpp_INCLUDE_DIR
    NAMES
    json/json.h
    PATHS
    /usr/include/jsoncpp
)

find_library(JsonCpp_LIBRARY_DEBUG
    NAMES jsoncppd
)

find_library(JsonCpp_LIBRARY_RELEASE
    NAMES jsoncpp
)

find_package_handle_standard_args(JsonCpp 
    DEFAULT_MSG 
    JsonCpp_INCLUDE_DIR
    JsonCpp_LIBRARY_RELEASE
    )

if(JsonCpp_FOUND)
    set(JsonCpp_INCLUDE_DIRS 
        ${JsonCpp_INCLUDE_DIR}
    )

    if(WIN32)
        set(JsonCpp_LIBRARIES
            $<$<CONFIG:Debug>:${JsonCpp_LIBRARY_DEBUG}>
            $<$<CONFIG:RelWithDebInfo>:${JsonCpp_LIBRARY_RELEASE}>
            $<$<CONFIG:Release>:${JsonCpp_LIBRARY_RELEASE}> 
            $<$<CONFIG:MinSizeRel>:${JsonCpp_LIBRARY_DEBUG}>
        )
    else()
        set(JsonCpp_LIBRARIES ${JsonCpp_LIBRARY_RELEASE})
    endif()
endif()

mark_as_advanced(DeckLinkAPI_DIR)

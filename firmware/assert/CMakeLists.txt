add_library( assert STATIC
    assert.cpp
)

target_include_directories( assert PUBLIC ${CMAKE_CURRENT_LIST_DIR} )


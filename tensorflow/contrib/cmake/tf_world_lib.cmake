
add_library(tf_world_lib SHARED
    $<TARGET_OBJECTS:tf_core_lib>
    $<TARGET_OBJECTS:tf_core_cpu>
    $<TARGET_OBJECTS:tf_core_framework>
    $<TARGET_OBJECTS:tf_core_kernels>
    $<TARGET_OBJECTS:tf_cc_framework>
    $<TARGET_OBJECTS:tf_cc_ops>
    $<TARGET_OBJECTS:tf_core_ops>
    $<TARGET_OBJECTS:tf_core_direct_session>
    $<$<BOOL:${tensorflow_ENABLE_GPU}>:$<TARGET_OBJECTS:tf_stream_executor>>
)

target_link_libraries(tf_world_lib PUBLIC
    tf_protos_cc
    ${tf_core_gpu_kernels_lib}
    ${tensorflow_EXTERNAL_LIBRARIES}
)

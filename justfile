build-demo:
    cmake --build --preset $env.PRESET_MODE --target demo_ivfpq_indexing

perf-allow:
    sudo sysctl -w kernel.perf_event_paranoid=-1

perf-record-demo:
    perf record -F 99 -g -a $"($env.MY_BUILD_DIR)/demos/demo_ivfpq_indexing"

perf-report:
    perf report --stdio -g

perf-flamelens:
    perf script | inferno-collapse-perf | flamelens

perf-flame-gui:
    perf script | inferno-collapse-perf out> perf.flame

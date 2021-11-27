package cheatsheet.debug

tracing_func(x) {
    trace("tracing")
    x == "blue"
}

tracing {
    tracing_func("blue")
}

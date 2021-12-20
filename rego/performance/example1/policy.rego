package example

result [m] {
    is_admin(input.user)
    m := "ok"
}

is_admin(u) {
    trace(sprintf("user: %s", [u]))
    u == "blue"
}

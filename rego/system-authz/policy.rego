package system.authz

default allow = false  # Reject requests by default.

allow {
    input.method == "GET"
}
allow {
    input.method == "POST"
}

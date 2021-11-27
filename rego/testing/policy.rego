package testing

admins := ["alice", "bob"]

allow {
    input.user == admins[_]
}

allow_action {
    input.user == admins[_]
    input.request.target == "db"
    input.request.action == "read"
}

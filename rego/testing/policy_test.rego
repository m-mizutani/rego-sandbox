package testing

test_allow {
    allow with input as {"user": "alice"}
}

test_disallow {
    not allow with input as {"user": "chris"}
}

test_disallow_with_other_admins {
    not allow with input as {"user": "alice"} with admins as ["blue"]
}

test_with_data_admins {
    allow with input as {"user": "blue"} with admins as data.testing.testdata.admins
    not allow with input as {"user": "alice"} with admins as data.testing.testdata.admins
}

test_modify_input {
    success_case := {
        "user": "alice",
        "request": {
            "target": "db",
            "action": "read",
        },
    }

    fail_case := object.union(success_case, {"request": {"action": "write"}})

    allow_action with input as object.union(success_case, {"request": {"action": "write"}})
    not allow_action with input as fail_case
}

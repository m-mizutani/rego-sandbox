package cheatsheet.match

test_match_any {
    arr := ["red", "blue", "yellow"]
    "blue" == arr[_]

    obj := {
        "red": 2,
        "white": 3,
        "blue": 5,
    }
    5 == obj[_]
}

test_match_all {
    arr := [1, 1, 1]
    3 == count([x | arr[x] == 1])

    obj := {
        "red": 1,
        "yellow": 1,
        "blue": 1,
    }
    3 == count([x | obj[x] == 1])
}

test_join {
    users = [
        {
            "name": "alice",
            "id": 1,
        },
        {
            "name": "bob",
            "id": 2,
        },
    ]
    assigns = [
        {
            "id": 1,
            "role": "admin",
        },
        {
            "id": 1,
            "role": "reader",
        },
        {
            "id": 2,
            "role": "reader",
        },
    ]

    some x, y
    users[x].name == "alice"
    assigns[y].id == users[x].id
    assigns[y].role == "admin"
}

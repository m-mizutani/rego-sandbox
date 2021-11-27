package cheatsheet.object

test_get {
    dict := {
        "white": 3,
        "blue": 5,
    }
    1 == object.get(dict, "none", 1)
}

test_keys {
    dict := {
        "white": 3,
        "blue": 5,
    }

    {"white", "blue"} == {x | dict[x]}
}

test_values {
    dict := {
        "white": 3,
        "blue": 5,
    }

    {3, 5} == {dict[x] | dict[x]}
}

test_remove {
    dict := {
        "red": 2,
        "white": 3,
        "blue": 5,
    }

    {"blue": 5} == object.remove(dict, ["white", "red"])
}

test_filter {
    dict := {
        "red": 2,
        "white": 3,
        "blue": 5,
    }

    {"blue": 5} == object.filter(dict, ["blue"])
}

test_union {
    obj1 := {
        "white": 3,
        "blue": 0,
    }
    obj2 := {
        "red": 2,
        "blue": 5,
    }

    {
        "red": 2,
        "white": 3,
        "blue": 5, # 後勝ちでobj2が優先
    } == object.union(obj1, obj2)
}

package example

p := {
    "blue": 1,
    "red": 0,
    "yellow": 2,
}

result {
    not has3
}

has3 {
    p[x] == 3
}

result {
    count({x | p[x] == 3}) == 0
}

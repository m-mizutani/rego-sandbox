package example

p := {
    "blue": 1,
    "red": 0,
    "yellow": 2,
}

# bad {
#     not p[x] == 3
# }

good {
    count({x | p[x] == 3}) == 0
}

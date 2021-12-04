package example

p := {
    "blue": 1,
    "red": 0,
    "yellow": 2,
}

# bad[x] {
#     not p[x] == 0
# }

good[y] {
    y := {x | p[x]} - {x | p[x] == 0}
}

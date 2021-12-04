package example

p := {
    "blue": 1,
    "red": 0,
    "yellow": 2,
}

# BAD
# result[x] {
#     not p[x] == 0
# }

resutl = y {
    y := {x | p[x]} - {x | p[x] == 0}
}

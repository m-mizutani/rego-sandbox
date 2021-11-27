package cheatsheet.array

test_concat {
    ["blue", "yellow", "red"] == array.concat(["blue", "yellow"], ["red"])
}

test_subset {
    ["yellow", "blue"] == array.slice(["red", "yellow", "blue"], 1, 3)
}

test_count {
    3 == count(["red", "yellow", "blue"])
}

test_calc {
    5 == max([3, 2, 5, 1, 4])
    1 == min([3, 2, 5, 1, 4])
    15 == sum([3, 2, 5, 1, 4])
}

test_sort {
    [1, 2, 3, 4, 5] == sort([3, 2, 5, 1, 4]) # array
    [1, 2, 3, 4, 5] == sort({3, 2, 5, 1, 4}) # set
    ["blue", "red", "yellow"] == sort(["red", "yellow", "blue"])
}

test_set {
    {"blue"} == {"blue", "red"} & {"orange", "blue"}
    {"blue", "red", "orange"} == {"blue", "red"} | {"orange", "blue"}
    {"blue"} == {"blue", "red"} - {"red"}
}

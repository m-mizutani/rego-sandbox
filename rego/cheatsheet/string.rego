package cheatsheet.string

# 文字列

test_fmt {
    "blue 5" == sprintf("%s %d", ["blue", 5])
}

test_split_concat {
    "red, yellow, blue" == concat(", ", ["red", "yellow", "blue"])
    ["red", "yellow", "blue"] == split("red, yellow, blue", ", ")
}

test_partial_match {
    contains("blue", "l")
    2 == indexof("blue", "u")
    startswith("blue", "bl")
    endswith("blue", "ue")
}

test_conv_text {
    "blue" == lower("BLUE")
    "BLUE" == upper("blue")
}

test_substr {
    "blue!" == substring("the blue!?", 4, 5)
}

test_trim {
    "blue" == trim("_blue!", "_!")
    "blue" == trim_left("e__blue", "e_")
    "blue" == trim_right("blue__b", "_b")
    "blue" == trim_prefix("bblue", "b")
    "blue" == trim_suffix("bluee", "e")
    "blue" == trim_space("   blue   ")
}

test_regex {
    regex.match("[a-z]+", "_blue_")
}

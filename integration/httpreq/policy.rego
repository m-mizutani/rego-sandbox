package serve

deny[msg] {
    not input.Method == "GET"
    msg := "Only GET method is allowed"
}

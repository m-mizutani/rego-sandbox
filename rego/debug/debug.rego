package debugging2

servers := [
    {
        "name": "blue",
        "addr": "10.0.1.2",
        "port": [21, 22, 80],
    },
    {
        "name": "orange",
        "addr": "10.0.1.3",
        "port": [22, 5432],
    },
]

trace_example {
    server := servers[x]
    print("index:", x)

    is_ssh_port(server.port[_])
    is_orange(server.name)
}

is_ssh_port(p) {
    print("port=", p)
    p == 22
}

is_orange(n) {
    print("name=", n)
    n == "orange"
}

package main

import (
	"context"

	"github.com/k0kubun/pp"
	"github.com/open-policy-agent/opa/rego"
)

func main() {
	input := struct {
		User string `json:"user"`
	}{User: "mizutani"}

	module := `package blue
	allow {
		input.user == "mizutani"
	}`

	q := rego.New(
		rego.Query(`x := data.blue`),
		rego.Module("module.rego", module),
		rego.Input(input),
	)

	rs, err := q.Eval(context.Background())
	if err != nil {
		panic(err)
	}

	pp.Println(rs)
}

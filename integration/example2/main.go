package main

import (
	"context"
	"fmt"

	"github.com/open-policy-agent/opa/rego"
)

func main() {
	input := struct {
		User string `json:"user"`
	}{User: "x"}

	module := `package blue
	allow {
		input.user == "mizutani"
	}
	`

	q := rego.New(
		rego.Query(`x := data.blue.allow`),
		rego.Module("module.rego", module),
		rego.Input(input),
	)

	rs, err := q.Eval(context.Background())
	if err != nil {
		panic(err)
	}

	fmt.Println("rs =>", len(rs))
}

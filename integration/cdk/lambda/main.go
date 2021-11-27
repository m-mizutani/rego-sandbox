package main

import (
	"context"
	_ "embed"
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
	"github.com/open-policy-agent/opa/rego"
)

//go:embed policy/example.rego
var module string

func HandleRequest(ctx context.Context, input interface{}) (interface{}, error) {
	fmt.Println("input =>", input)

	q := rego.New(
		rego.Query(`x := data`),
		rego.Module("policy/example.rego", module),
		rego.Input(input),
	)

	rs, err := q.Eval(ctx)
	if err != nil {
		panic(err)
	}

	if len(rs) == 0 {
		return nil, nil
	}

	return rs[0].Bindings["x"], nil
}

func main() {
	lambda.Start(HandleRequest)
}

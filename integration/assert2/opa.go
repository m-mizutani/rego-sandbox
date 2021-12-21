package main

import (
	"fmt"
	"os"

	"github.com/open-policy-agent/opa/ast"
	"github.com/open-policy-agent/opa/cmd"
	"github.com/open-policy-agent/opa/rego"
	"github.com/open-policy-agent/opa/types"
)

func main() {
	rego.RegisterBuiltin3(
		&rego.Function{
			Name: "assert",
			Decl: types.NewFunction(types.Args(types.S, types.A, types.A), types.S),
		},
		func(_ rego.BuiltinContext, op1, op2, op3 *ast.Term) (*ast.Term, error) {
			if op2.Value.Compare(op3.Value) == 0 {
				return nil, nil
			}

			msg := ast.StringTerm(fmt.Sprintf("Failed '%s': expected %v, but got %v", op1.String(), op2.String(), op3.String()))
			return msg, nil
		},
	)

	if err := cmd.RootCommand.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

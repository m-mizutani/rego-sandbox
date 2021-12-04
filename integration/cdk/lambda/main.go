package main

import (
	"context"
	"fmt"

	"github.com/aws/aws-lambda-go/lambda"
)

func HandleRequest(ctx context.Context, input interface{}) (interface{}, error) {
	fmt.Println("input =>", input)

	v := struct {
		Test string
	}{
		Test: "hoge",
	}
	return v, nil
}

func main() {
	lambda.Start(HandleRequest)
}

package main

import (
	"fmt"
	"io/ioutil"
	"net/http"

	json "github.com/goccy/go-json"
	"github.com/open-policy-agent/opa/ast"
	"github.com/open-policy-agent/opa/rego"
)

var query *ast.Compiler

type safeRequest struct {
	GetBody struct{} `json:"-"`
	http.Request
}

func makeRequestSafe(r *http.Request) interface{} {
	raw, err := json.Marshal(r)
	if err != nil {
		panic(err)
	}
	var v interface{}
	if err := json.Unmarshal(raw, &v); err != nil {
		panic(err)
	}
	return v
}

func handler(w http.ResponseWriter, r *http.Request) {
	req := safeRequest{Request: *r}
	q := rego.New(
		rego.Query(`x := data.serve.deny`),
		rego.Compiler(query),
		rego.Input(req),
	)

	rs, err := q.Eval(r.Context())
	if err != nil {
		panic(err)
	}

	if v, ok := rs[0].Bindings["x"]; ok {
		w.WriteHeader(http.StatusBadRequest)
		fmt.Fprintf(w, "%v", v)
		return
	}

	fmt.Fprintf(w, "OK")
}

func main() {
	policy, err := ioutil.ReadFile("policy.rego")
	if err != nil {
		panic(err)
	}

	compiler, err := ast.CompileModules(map[string]string{
		"example.rego": string(policy),
	})
	if err != nil {
		panic(err)
	}
	query = compiler

	http.HandleFunc("/", handler) // ハンドラを登録してウェブページを表示させる
	http.ListenAndServe("127.0.0.1:8080", nil)
}

package main

import (
	"github.com/gorilla/mux"
	"net/http"
	"fmt"
)

func main() {
	m := mux.NewRouter()
	m.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "Hello Dear Client!")
	}).Methods("GET")
	http.ListenAndServe(":80", m)
}

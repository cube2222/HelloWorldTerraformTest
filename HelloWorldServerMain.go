package main

import (
	"github.com/gorilla/mux"
	"net/http"
	"io"
)

func main() {
	m := mux.NewRouter()
	m.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		resp, _ := http.Get("http://google.com")
		io.Copy(w, resp.Body)
		//fmt.Fprint(w, "Hello Dear Client!")
	}).Methods("GET")
	http.ListenAndServe(":80", m)
}

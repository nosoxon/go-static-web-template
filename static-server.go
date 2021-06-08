package main

import "net/http"

func main() {
        http.Handle("/", http.FileServer(http.Dir("/site")))
	http.HandleFunc("/healthz", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
	})

        http.ListenAndServe(":8080", nil)
}

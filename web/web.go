package main

import (
	"log"
	"net/http"
)

const (
	version = "1.0.1"
)

func main() {
	http.HandleFunc("/version", func(writer http.ResponseWriter, request *http.Request) {
		_, _ = writer.Write([]byte(version))
	})

	if err := http.ListenAndServe(":50453", nil); err != nil {
		log.Println(err.Error())
	}
}

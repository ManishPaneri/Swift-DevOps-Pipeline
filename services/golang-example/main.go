package main

import (
	"fmt"
	"net/http"
)

func main() {
	mux := http.NewServeMux()
	fmt.Println("Start Application")
	if err := http.ListenAndServe(":9000", mux); err != nil {
		fmt.Println("error : ", err.Error())
	}
}

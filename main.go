package main

import (
	"encoding/json"
	"fmt"
	"log"

	"github.com/aqaurius6666/prutu/pb"
)

func main() {
	if err := run(); err != nil {
		log.Fatal(err)
	}
}

func run() error {
	var res pb.GetUserRequest
	res.Age = 3
	res.Id = "123"
	if err := res.Validate(); err != nil {
		return err
	}
	str, _ := json.Marshal(res)
	fmt.Printf("str: %v\n", string(str))
	return nil
}

package main

import (
	"log"

	"github.com/joho/godotenv"
	"github.com/leozz37/gin-serverless-container-template/routes"
)

func main() {
	// Load environment variables from .env file
	err := godotenv.Load(".env.example")
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	// Gin setup
	routes.InitRoutes()
}

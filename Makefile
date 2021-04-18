NAME=${APP_NAME}

## build: Compile the packages
build:
	@go build -o $(NAME)

## run: Build and Run in development mode.
run: build
	@GIN_MODE=debug ./$(NAME)

## deps: Download modules
deps:
	@go mod download

## test: Run tests with verbose mode
test:
	@go test -v -covermode=count -coverprofile=coverage.out ./...
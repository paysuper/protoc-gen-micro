# protoc-gen-micro

This is protobuf code generation for micro. We use protoc-gen-micro to reduce boilerplate code.

## Install

```
go install github.com/paysuper/protoc-gen-micro@latest
```

Also required: 

- [protoc](https://github.com/google/protobuf)
- [protoc-gen-go](https://github.com/golang/protobuf)

## Usage

Define your service as `greeter.proto`

```
syntax = "proto3";

service Greeter {
	rpc Hello(Request) returns (Response) {}
}

message Request {
	string name = 1;
}

message Response {
	string msg = 1;
}
```

Generate the code

```
protoc --proto_path=$GOPATH/src:. --micro_out=. --go_out=. greeter.proto
```

Your output result should be:

```
./
    greeter.proto	# original protobuf file
    greeter.pb.go	# auto-generated by protoc-gen-go
    greeter.micro.go	# auto-generated by protoc-gen-micro
```

The micro generated code includes clients and handlers which reduce boiler plate code

### Server

Register the handler with your micro server

```go
type Greeter struct{}

func (g *Greeter) Hello(ctx context.Context, req *proto.Request, rsp *proto.Response) error {
	rsp.Msg = "Hello " + req.Name
	return nil
}

proto.RegisterGreeterHandler(service.Server(), &Greeter{})
```

### Client

Create a service client with your micro client

```go
client := proto.NewGreeterService("greeter", service.Client())
```

### Errors

If you see an error about `protoc-gen-micro` not being found or executable, it's likely your environment may not be configured correctly. If you've already installed `protoc`, `protoc-gen-go`, and `protoc-gen-micro` ensure you've included `$GOPATH/bin` in your `PATH`.

Alternative specify the Go plugin paths as arguments to the `protoc` command

```
protoc --plugin=protoc-gen-go=$GOPATH/bin/protoc-gen-go --plugin=protoc-gen-micro=$GOPATH/bin/protoc-gen-micro --proto_path=$GOPATH/src:. --micro_out=. --go_out=. greeter.proto
```

## LICENSE

protoc-gen-micro is a liberal reuse of protoc-gen-go hence we maintain the original license 

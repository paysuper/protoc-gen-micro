module github.com/paysuper/protoc-gen-micro

go 1.18

require (
	github.com/golang/protobuf v1.3.2
	github.com/micro/go-micro v1.18.0
	golang.org/x/net v0.0.0-20191109021931-daa7c04131f5
	google.golang.org/grpc v1.25.1
)

require (
	github.com/go-log/log v0.1.0 // indirect
	github.com/google/uuid v1.1.1 // indirect
	github.com/micro/mdns v0.3.0 // indirect
	github.com/miekg/dns v1.1.22 // indirect
	github.com/oxtoacart/bpool v0.0.0-20190530202638-03653db5a59c // indirect
	github.com/pkg/errors v0.8.1 // indirect
	golang.org/x/crypto v0.0.0-20200221231518-2aa609cf4a9d // indirect
	golang.org/x/sys v0.0.0-20191110163157-d32e6e3b99c4 // indirect
	golang.org/x/text v0.3.2 // indirect
	google.golang.org/genproto v0.0.0-20191108220845-16a3f7862a1a // indirect
)

replace github.com/micro/go-micro => github.com/paysuper/go-micro v0.0.0-20220210193104-32a80cb1af1c

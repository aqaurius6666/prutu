GOPATH=$HOME/go
PATH=$PATH:$GOPATH/bin
protodir=proto
go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest
go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
go install github.com/gogo/protobuf/protoc-gen-gogo
go install github.com/mwitkow/go-proto-validators/protoc-gen-govalidators@latest

protoc --gogo_out=plugins=grpc:./pb --gogo_opt paths=source_relative \
    --govalidators_out=./pb --govalidators_opt paths=source_relative \
    --openapiv2_out ./pb --openapiv2_opt logtostderr=true --openapiv2_opt allow_delete_body=true \
    -I proto \
    -I ./ \
    $protodir/example.proto

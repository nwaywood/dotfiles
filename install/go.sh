echo "Installing go packages..."

# dependency management
go get github.com/tools/godep

# golang tools
go get golang.org/x/tools/cmd/vet
go get golang.org/x/tools/cmd/oracle
go get github.com/golang/lint/golint
go get github.com/nsf/gocode
go get code.google.com/p/rog-go/exp/cmd/godef

export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod

append_path $(go env GOBIN)
append_path "$(go env GOPATH)/bin"

export PATH

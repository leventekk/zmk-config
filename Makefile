DOCKER := "$(shell command -v docker)"
TIMESTAMP := "$(shell date -u +"%Y%m%d%H%M")"
COMMIT := "$(shell git rev-parse --short HEAD 2>/dev/null)"

.PHONY: all clean

all:
	$(DOCKER) build --tag zmk --file Dockerfile .
	$(DOCKER) run --rm -it --name zmk \
		-v $(PWD)/firmware:/app/firmware \
		-v $(PWD)/config:/app/config:ro \
		-e TIMESTAMP=$(TIMESTAMP) \
		-e COMMIT=$(COMMIT) \
		zmk

clean:
	rm -f firmware/*.uf2
	$(DOCKER) image rm zmk docker.io/zmkfirmware/zmk-build-arm:stable

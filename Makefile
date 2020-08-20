VERSION=3.2.3
IMAGE=ecirtap/treetagger:$(VERSION)

build:
	docker build -t $(IMAGE) .

buildx:
	docker buildx build --pull --platform linux/amd64,linux/arm/v7,linux/arm64 --push -t $(IMAGE) .

push:
	docker push $(IMAGE)

rm:
	docker run --rm $(IMAGE)

test:
	echo 'Il a deux trous rouges au côté droit.' | docker run --rm -i ecirtap/treetagger:$(VERSION) tree-tagger-french

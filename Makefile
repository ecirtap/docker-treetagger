VERSION=3.2
IMAGE=ecirtap/treetagger:$(VERSION)

build:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)

test:
	echo 'Il a deux trous rouges au côté droit.' | docker run --rm -i ecirtap/treetagger:3.2 tree-tagger-french

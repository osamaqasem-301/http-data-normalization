.DEFAULT_GOAL := help
.PHONY: help build deploy
PACKAGE := http-normalization-deployment.zip
ASSETS := normalize.sh raw_data.txt normalized.csv normalized.txt README.md

help:
	@echo "Osama Qasem"
	@echo "Build the deployment ZIP: make build"
	@echo "Commit the deployment ZIP to the class Git repository: make deploy"

build: $(ASSETS)
	zip -q -j $(PACKAGE) $(ASSETS)
	@echo "Built $(PACKAGE)"

deploy: build
	git add $(PACKAGE)
	git commit -m "Deploy HTTP normalization package"

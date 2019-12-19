.PHONY: docker-shell, docker-shell-gpu jupyter clean-jupyter

ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
USER := $(shell id -u)
GROUP := $(shell id -g)


VERSION := 1.15.0
LOCAL_FOLDER := $(ROOT_DIR)/root
REMOTE_FOLDER := /app
PORT := 8888


ARGS := -it --user $(USER):$(GROUP) --rm --mount type=bind,source=$(LOCAL_FOLDER),target=$(REMOTE_FOLDER) --workdir $(REMOTE_FOLDER)
GPUARGS := --gpus all
JUPYTERARGS := -p $(PORT):8888 -e JUPYTER_CONFIG_DIR=$(REMOTE_FOLDER)/jupyter-config -e JUPYTER_DATA_DIR=$(REMOTE_FOLDER)/jupyter-data -e JUPYTER_RUNTIME_DIR=$(REMOTE_FOLDER)/jupyter-runtime
JUPYTERPOSTARGS := --ip 0.0.0.0 --no-browser --NotebookApp.token=''

docker-shell:
	docker run $(ARGS) tensorflow/tensorflow:$(VERSION)-py3 /bin/bash

docker-shell-gpu:
	docker run $(GPUARGS) $(ARGS) tensorflow/tensorflow:$(VERSION)-gpu-py3 /bin/bash

jupyter:
	docker run $(ARGS) $(JUPYTERARGS) tensorflow/tensorflow:$(VERSION)-jupyter jupyter notebook $(JUPYTERPOSTARGS)

clean-jupyter:
	rm -rf $(REMOTE_FOLDER)/jupyter-config $(REMOTE_FOLDER)/jupyter-data $(REMOTE_FOLDER)/jupyter-runtime
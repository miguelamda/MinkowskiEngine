#!/bin/bash

#nsys profile --trace cuda,osrt,nvtx --gpu-metrics-device=all --output classrep --force-overwrite true python -m examples.resnet_profile

sudo -E dlprof --mode=pytorch --nsys_opts="--trace 'cuda,osrt,nvtx,cudnn,cublas' --gpu-metrics-device=all" --output_path=profiling/classification --profile_name=modelnet40_minkfcnn --nsys_base_name=modelnet40_minkfcnn  --force=true python3 -m examples.classification_nvtx --max_steps 50

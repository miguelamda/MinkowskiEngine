#!/bin/bash

#nsys profile --trace cuda,osrt,nvtx --gpu-metrics-device=all --output classrep --force-overwrite true python -m examples.resnet_profile

#sudo -E dlprof --mode=pytorch --nsys_opts="--trace 'cuda,osrt,nvtx,cudnn,cublas' --gpu-metrics-device=all" --output_path=profiling/classification --profile_name=modelnet40_minkfcnn --nsys_base_name=modelnet40_minkfcnn  --force=true python3 -m examples.classification_nvtx --max_steps 50

source scripts/config_centos.sh

nsys profile --trace cuda,osrt,nvtx,cudnn,cublas --gpu-metrics-device=0 --output modelnet_3090 --force-overwrite true python3 -m examples.classification_nvtx --max_steps 25

mv modelnet_3090* profiling/metrics 


nsys profile --trace cuda,osrt,nvtx,cudnn,cublas --gpu-metrics-device=0 --output completion_3090 --force-overwrite true python3 -m examples.completion_profile --max_iter 25

mv completion_3090* profiling/metrics 


nsys profile --trace cuda,osrt,nvtx,cudnn,cublas --gpu-metrics-device=0 --output reconstruction_3090 --force-overwrite true python3 -m examples.reconstruction_profile --max_iter 25

mv reconstruction_3090* profiling/metrics 


nsys profile --trace cuda,osrt,nvtx,cudnn,cublas --gpu-metrics-device=0 --output resnet_3090 --force-overwrite true python3 -m examples.resnet_profile --max_iter 25

mv resnet_3090* profiling/metrics 


nsys profile --trace cuda,osrt,nvtx,cudnn,cublas --gpu-metrics-device=0 --output vae_3090 --force-overwrite true python3 -m examples.vae_profile --max_iter 25 --train

mv vae_3090* profiling/metrics 
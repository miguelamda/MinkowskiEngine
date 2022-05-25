#!/bin/bash
# This is a line to launch a profiling on the examples (change the output name and the example to run)
# Use nvtx on the python file (see examples that end with _profile.py)

nsys profile --trace cuda,osrt,nvtx --gpu-metrics-device=all --output classrep --force-overwrite true python -m examples.resnet_profile

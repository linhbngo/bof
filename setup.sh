#!/bin/bash

sudo sysctl -w kernel.randomize_va_space=0
sudo ln -sf /bin/zsh /bin/sh


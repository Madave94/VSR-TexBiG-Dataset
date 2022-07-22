#!/bin/bash
export NGPU=2

PATHVSR=/home/david/src/VSR/
python -m torch.distributed.launch --nproc_per_node 2 $PATHVSR/tools/train.py $PATHVSR/demo/text_layout/VSR/TexBiG/configs/publaynet_x101_remote.py --seed 0 --launcher pytorch
#!/bin/bash

mkdir -p logs

CUDA_VISIBLE_DEVICES=4 python train.py --seed 43 --aug_seed 314 --desc c10-small-js-nocond-nope-a1 --hps c10_small_js --no_permute_embeddings --resid_pdrop 0.005 --use_unconditional_augmentation &> logs/c10-small-js-nocond-nope.out &

CUDA_VISIBLE_DEVICES=5 python train.py --seed 43 --aug_seed 314 --desc c10-small-js-nocond-pe-a1 --hps c10_small_js --permute_embeddings --resid_pdrop 0.005 --use_unconditional_augmentation &> logs/c10-small-js-nocond-pe.out &

CUDA_VISIBLE_DEVICES=6 python train.py --seed 43 --aug_seed 314 --desc c10-small-js-cond-nope-a1 --hps c10_small_js --no_permute_embeddings --resid_pdrop 0.005 &> logs/c10-small-js-cond-nope.out &

CUDA_VISIBLE_DEVICES=7 python train.py --seed 43 --aug_seed 314 --desc c10-small-js-cond-pe-a1 --hps c10_small_js --permute_embeddings --resid_pdrop 0.005 &> logs/c10-small-js-cond-pe.out &

#!/bin/bash

#SBATCH --partition=spgpu
#SBATCH --time=00-08:00:00
#SBATCH --gpus=1
#SBATCH --cpus-per-gpu=4
#SBATCH --mem-per-gpu=32GB
#SBATCH --account=eecs595f23_class
#SBATCH --output=/home/jiyuchen/eecs595/proj/rl-prompt/examples/text-style-transfer/output.out


# set up job
module load python3.9-anaconda/2021.11
module load cuda/12.1.1
module load cudnn/12.1-v8.9.0

# pushd /home/kpyu/great-lakes-tutorial
cd /home/jiyuchen/eecs595/proj/rl-prompt/examples/text-style-transfer
# source venv/bin/activate
source ~/.bashrc

conda deactivate
conda activate rl-prompt

# python run_tst.py dataset=yelp direction=0_to_1 task_lm=gpt2 lower_outputs=true report_to_wandb=false
cd evaluation
python run_eval.py dataset=yelp task_lm=gpt2 prompt_0_to_1=""
#! /bin/bash
#SBATCH --job-name="singularity_helloworld"
#SBATCH --output="singularity_helloworld.%j.out" 
#SBATCH --error="singularity_helloworld.%j.err" 

container='shub://dietrichliko/centos7'

singularity exec -B /afs -B /cvmfs $container ./helloworld.sh

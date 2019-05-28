# Singularity images for CentOS7 @ HEPHY

Singularity images based on CentOS7 for HEPHY

Please report problems and suggestions to the [issue tracker](https://gitlab.cern.ch/hephyvienna/singularity/centos7/issues).

## Usage

The images are accessible via the [Singularity Hub](https://singularity-hub.org).

Start container   

    singulariy shell -B /cvmfs -B /scratch -B /afs shub://dietrichliko/centos7


Execute command inside container

    singularity exec -B /cvmfs -B /scratch -B /afs shub://dietrichliko/centos7 ls

To run inside the container in the batch system, use a wrapper script. See examples
in the [repository](https://gitlab.cern.ch/hephyvienna/singularity/centos7).

    #! /bin/bash
    #SBATCH --job-name="singularity_helloworld"
    #SBATCH --output="singularity_helloworld.%j.out"
    #SBATCH --error="singularity_helloworld.%j.err"
    #SBTACH --time=00:10:00

    container='shub://dietrichliko/centos7'

    singularity exec -B /afs -B /cvmfs $container helloworld.sh


Download image for immediate startup of the container

    singularity pull shub://dietrichliko/centos7
    singularity shell -B /cvmfs -B /scratch -B /afs $SINGULARITY_CACHE/dietrichliko-centos7-latest.simg

Environment variables are inherited from your actual environment. Verify their setting inside the
container, as they might have unexpected consequences inside the new container

    singularity exec shub://dietrichliko/centos7 env   

More details on the usage of Singularity can be found the [documentation](https://www.sylabs.io/guides/2.6/user-guide/)

# Available images

A number of images are provided. They include the standard CentOS development
tools and support for _git-lfs_. Further toolchains can be used via CVMFS.

The container share the filesystem with it host and scripts and program
can be easily edited outside the container. Therefore no editors are included.

Please use the [issue tracker](https://gitlab.cern.ch/hephyvienna/singularity/centos7/issues) for additional needs.

- __Standard:__ _shub://dietrichliko/centos7_

  The standard image supports the HEP experiment software from cvmfs
  and a Grid UI.

  For the setup of _CMS software_ start the shell using the option -l (login),
  as the aliases _cmsenv_ and _cmsrel_ are not inherited. This setup is only
  for users that are part of the cms group.

    singulariy shell -B /cvmfs -B /scratch -B /afs shub://dietrichliko/centos7


- __GPU:__ _shub://dietrichliko/centos7.gpu_

  The standard image and drivers for Nvidia CUDA 9.2 and CUDNN7. Its use
  makes only sense on _hepgpu01.hephy.at_

- __Base:__ _shub://dietrichliko/centos7.base_

  The base CentOS7 image.

- __GPUBase__: _shub://dietrichliko/centos7.gpubase_

  The base CentOS7 image with Nvidia CUDA 9.2 and CUDNN7.

- __Python36__: _shub://dietrichliko/centos7.py36_

  The base CentOS7 image with python36 from the [SCL](https://www.softwarecollections.org/en/).

## License

MIT

## Author

Written by [Dietrich Liko](http://hephy.at/dliko) in May 2019

[Institute for High Energy Physics](http://www.hephy.at) of the
[Austrian Academy of Sciences](http://www.oeaw.ac.at)

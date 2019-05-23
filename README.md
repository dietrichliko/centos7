# Singularity images for CentOS7 @ HEPHY


[![https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg](https://www.singularity-hub.org/static/img/hosted-singularity--hub-%23e32929.svg)](https://singularity-hub.org/collections/3042)

# Usage

The standard image supports the HEP experiment software

    singularity shell -B /afs -B /cvmfs -B /scratch shub://dietrichliko/centos7

Base image for testing

    singularity shell -B /afs -B /cvmfs -B /scratch shub://dietrichliko/centos7:base

Base image with Python36


    singularity shell -B /afs -B /cvmfs -B /scratch shub://dietrichliko/centos7:py36



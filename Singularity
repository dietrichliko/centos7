Bootstrap: yum
OSVersion: 7
MirrorURL: http://mirror.centos.org/centos-%{OSVERSION}/%{OSVERSION}/os/$basearch/
Include: yum

%help
    CentOS 7 for HEPHY analysis.
    * CVMFS
    * Grid UI
    * HEP_OSlibs

%labels
    Maintainer Dietrich Liko <Dietrich.Liko@oeaw.ac.at>
    Version  v0.1.0


%setup
    mkdir    ${SINGULARITY_ROOTFS}/etc/grid-security
    mkdir    ${SINGULARITY_ROOTFS}/etc/grid-security/vomsdir
    mkdir    ${SINGULARITY_ROOTFS}/etc/vomses

    cp -r vomsdir/ ${SINGULARITY_ROOTFS}/etc/grid-security/vomsdir/
    cp -r vomses/  ${SINGULARITY_ROOTFS}/etc/vomses/

%files
    repos/wlcg-centos7.repo                   /etc/yum.repos.d/
    repos/UMD-4-base.repo                     /etc/yum.repos.d/
    repos/UMD-4-updates.repo                  /etc/yum.repos.d/
    repos/dliko-empty-ca-policy-epel-7.repo   /etc/yum.repos.d/

%post
    yum -y update
    yum -y install epel-release
    yum -y groupinstall "Development tools"
    yum -y install git-lfs

    yum -y install yum-priorities
    yum -y install HEP_OSlibs empty-ca-policy ui

    yum clean all
    rm -rf /var/cache/yum

    ln -s /cvmfs/grid.cern.ch/etc/grid-security/certificates /etc/grid-security/certificates

    mkdir /cvmfs /afs /scratch

%environment
    export LCG_GFAL_INFOSYS=egee-bdii.cnaf.infn.it:2170
    export MYPROXY_SERVER=myproxy.cern.ch
    export DPNS_HOST=hephyse.oeaw.ac.at
    export DPM_HOST=hephyse.oeaw.ac.at

%apprun cms
    if [ -e /cvmfs/cms.cern.ch/cmsset_default.sh ]
    then
       source /cvmfs/cms.cern.ch/cmsset_default.sh
       export CMSSW_GIT_REFERENCE=/cvmfs/cms.cern.ch/cmssw.git.daily
    else
       echo "FATAL: Cannot access CVMFS repository cms.cern.ch"
       echo "FATAL: No CMS environment found.
      exit 1
    fi
    exec "$@"

%appenv
    unset SCRAM_ARCH

%apphelp
    CentOS 7 for HEPHY analysis with CMS environment.
    * CVMFS
    * Grid UI
    * HEP_OSlibs

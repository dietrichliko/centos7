Bootstrap: yum
OSVersion: 7
MirrorURL: http://mirror.centos.org/centos-%{OSVERSION}/%{OSVERSION}/os/$basearch/
Include: yum

%help
CentOS 7 for HEPHY


%labels
    Maintainer Dietrich Liko <Dietrich.Liko@oeaw.ac.at>
    Version  v0.1.0


%setup
    mkdir ${SINGULARITY_ROOTFS}/etc/grid-security


%files
    repos/wlcg-centos7.repo                   /etc/yum.repos.d/
    repos/UMD-4-base.repo                     /etc/yum.repos.d/
    repos/UMD-4-updates.repo                  /etc/yum.repos.d/
    repos/dliko-empty-ca-policy-epel-7.repo   /etc/yum.repos.d/

    vomses/cms-lcg-voms2.cern.ch              /etc/vomses
    vomses/alice-lcg-voms2.cern.ch            /etc/vomses
    vomses/belle-grid-voms.desy.de            /etc/vomses
    vomses/cms-voms2.cern.ch                  /etc/vomses
    vomses/belle-voms.hep.pnnl.gov            /etc/vomses
    vomses/alice-voms2.cern.ch                /etc/vomses
    vomses/belle-voms.cc.kek.jp               /etc/vomses

    vomsdir/cms/lcg-voms2.cern.ch.lsc         /etc/grid-security/vomsdir
    vomsdir/cms/voms2.cern.ch.lsc             /etc/grid-security/vomsdir
    vomsdir/belle/voms.cc.kek.jp.lsc          /etc/grid-security/vomsdir
    vomsdir/belle/voms.hep.pnnl.gov.lsc       /etc/grid-security/vomsdir
    vomsdir/belle/grid-voms.desy.de.lsc       /etc/grid-security/vomsdir
    vomsdir/alice/lcg-voms2.cern.ch.lsc       /etc/grid-security/vomsdir
    vomsdir/alice/voms2.cern.ch.lsc           /etc/grid-security/vomsdir

    profile.d/cmsenv.sh                       /etc/profile.d

%post
    yum -y update
    yum -y install yum-priorities
    yum -y install epel-release

    yum -y install HEP_OSlibs
    yum -y install empty-ca-policy
    yum -y install ui 

    yum clean all
    rm -rf /var/cache/yum

    ln -s /cvmfs/grid.cern.ch/etc/grid-security/certificates /etc/grid-security/certificates

    mkdir /cvmfs /afs /scratch

%environment
    export LCG_GFAL_INFOSYS=egee-bdii.cnaf.infn.it:2170
    export MYPROXY_SERVER=myproxy.cern.ch
    export DPNS_HOST=hephyse.oeaw.ac.at
    export DPM_HOST=hephyse.oeaw.ac.at

if [ -e /cvmfs/cms.cern.ch/cmsset_default.sh ]
then
   source /cvmfs/cms.cern.ch/cmsset_default.sh
   export CMSSW_GIT_REFERENCE=/cvmfs/cms.cern.ch/cmssw.git.daily
else
   echo "FATAL: Cannot access CVMFS repository cms.cern.ch"
   echo "FATAL: No CMS environment found."
   exit 1
fi


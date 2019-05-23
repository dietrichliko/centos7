id -Gz | tr '\0' '\n' | grep '^1200$' > /dev/null
if [ $? -eq 0 ]
then
  source /cvmfs/cms.cern.ch/cmsset_default.sh
  export CMSSW_GIT_REFERENCE=/cvmfs/cms.cern.ch/cmssw.git.daily
fi

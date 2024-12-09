# rocker_edit


* edit build/templates/bakefiles/*.json    to remove images you don't want e.g. geospatial
* maybe edit build/scripts/generate-dockerfiles.R  to produce less, but possibly this is not needed, just makes extra dockerfiles that don't get run.
* maybe now only need to build the one image, the cctu one,  based on dockefiles that directly run a sequence og shell scripts.  
*  Need to correct the docker accounts and login secrets.

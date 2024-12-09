# rocker_edit


* See workflows repo-update.  There any file with "-master" as the copy is overwritten by another file with adaptations for cctu. Also build/templates/dockerilfes/cctu.Dockerfile.txt is added ()
- Should be alerted if the -master changes, which may then need the equivalent overwrite file changed by hand.

* do I need to check the version of CCTU-- there is an env CCTU_VERSION=0.8.1 in the docker file
-  yes see lines 315-400 of build/make-stacks.R   - needs to go into build/scripts/geenerate-variables.
But this will break _a lot_ of the main repo files.  Modify install_cctu.sh to run an R script that can 
look up the cctu version from R_VERSION env. See scripts/bin/install2.r  as a template  .




* edit build/templates/bakefiles/*.json    to remove images you don't want e.g. geospatial
--DONE
* edit generate-dockfiles lines 57-67  just cctu
* edit generate-bakfiles  lines 76-83 and 119,128

* maybe edit build/scripts/generate-dockerfiles.R  to produce less, but possibly this is not needed, just makes extra dockerfiles that don't get run.



* maybe now only need to build the one image, the cctu one,  based on dockefiles that directly run a sequence og shell scripts.  
*  Need to correct the docker accounts and login secrets.


* install_texlive merge conflicts  -  rename but keep a version from the master repo for inspection- should be highlighted with pull requests if a change happens
* install_python  - merged minor conflicts (not sure if this is actually run  though)
* there maybe other changes but not made apparent with the merge.


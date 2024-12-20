# Overview

This is a lightly edited version of the main [rocker project](https://github.com/rocker-org/rocker-versioned2/). I take copies daily of the main files need to generate my own version, based on `verse` image, and add on a suit of extra R packages used within Cambridge CTU.  

I've also added a few more Ubuntu packages, base test files, and tex packages,  so as to allow the basic User Acceptance Testing to pass.  The is capture in this [site](https://cam-ctu.github.io/rocker_uat/)  generated from this [repo](https://github.com/cam-ctu/rocker_uat)

# Details

The main action scripts are

* `repo_update.yml`  This details which files are copied. Sometimes I copy an entire folder into a backup copy (e.g. workflow), and keep my own version.  Other times I copy a file but give a new name appended with "-master",  or I might keep the original file name but have my own new version appened with "-edit".  But if something changes in the original repo, then I will be able to see this in a pull request that is generated
* `dockerfiles.yml`  this checks for version updates of the key componets (see the wiki) and updates the dockerfiles to build corresponding images. If somethign changes a pull request is made. 
* If we accept the preceding pull then a release may be made, or a revised version of the latest one/two images made.
* The other action files are there for testing valid syntax or outputs,  or create wiki pages.


# History

There was a previous [version](https://github.com/shug0131/rocker-versioned2) of this, that was simply a fork of the original repository. It wasn't able to keep up to date easily with changes,  and a complete re-structuring of the original made in April 2024 has forced this new version to be made.  This produced images pre 4.4.1 .

# Maintenance.

For any changes, or new R versions,  then a pull request should be automatically generated. Use the github interface to  inspect the changed files to see if revisions are needed, or simply accept the pull request.

# Todo list

* There are extra testing and linting checks that don't pass completely. Some of these may be for steps from the original repo that are not used at all here. 
* Development version is not successfully build, but this is curently also reflecting in the main repo. It can be down to packages breaking on the devel version.  
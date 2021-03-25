# (PART) Appendices {-}

This chapter contains additional information regarding how to setup the Github to build the book. 

# Github initial setup

Joyce Robbins

1. Create a new repository. (For `cc21` I started with a new repo on GitHub since I wanted the main branch to be called `main` and that did not seem possible with **usethis** functions or RStudio "

2. Copy the following files from the previous version and edit as necessary. (Search for name of previous repo to catch all instances.)

```
_bookdown.yml
_common.R
_output.yml
appendix_initial_setup.Rmd
appendix_pull_request_tutorial.Rmd
DESCRIPTION               
index.Rmd                       
sample_project.Rmd
/.github
/resources/sample_project
/resources/tutorial_pull_request_mergers
```

## GitHub Actions

### Secrets

https://medium.com/@delucmat/how-to-publish-bookdown-projects-with-github-actions-on-github-pages-6e6aecc7331e

* Secret #1: Create a token here https://github.com/settings/tokens and paste it in a secret in the repo named `GH_PAT`

* Secret #2: Add a Secret called `EMAIL` with GitHub email

See: https://github.com/r-lib/actions/tree/master/examples#managing-secrets


### Create a `gh-pages` branch:

https://jiafulow.github.io/blog/2020/07/09/create-gh-pages-branch-in-existing-repo/

(May happen automatically???)

### GitHub Pages in repo settings

(May happen automatically???)

## DESCRIPTION file

*Need a better process...*

Downloaded submissions from CourseWorks

Create DESCRIPTION file. Add add dependencies with `projthis::proj_update_deps()`

https://twitter.com/ijlyttle/status/1370776366585614342

Add these Imports to the real DESCRIPTION file.

Found problematic packages by looking at reverse dependencies of the packages that failed to install:

`devtools::revdep()`

Also used `pak::pkg_deps_tree()`

Problems:

`magick`

`rJava` dependency of `qdap`

# Collaborating on RStudio with GitHub

Jee sun Yun and Yena Lee

## Objective

Collaborating on RStudio is not feasible, especially when working on a group project on R.
Using GitHub is not instantaneous like Google docs where team members can collaborate and get real-time updates.
However, it can be a powerful tool once you have it set up.
Just by the fact that you can avoid the nuisance of mailing each other files and copy and pasting your teammates' code makes this attractive. 

This ducumentation will mainly focus on collaborating on GitHub, assuming that Git and GitHub is set up.

## What is Git?

Git is a software for version control. You can track changes, keep the history, or set markers to pull up certain versions of the file.
You can use Terminal to type in Git commands, but the RStudio interface makes it easier to commit, push, pull and track changes.

## Collaborating on GitHub
### Create a repository

* On your GitHub account, create a new repository by clicking on `+ New Repository`
* Add a simple name for the repository (i.e. `21_edav`), description of the repo
* Create a README file if necessary
* Choose to add a *.gitignore* to add documents to identify files that you want GitHub to ignore. (I  would recommend to have this, the MacOS automatically creates a `.DS_Store` file which stores config informations but this is rarely relevant)
  - Stage `.DS_Store`, and on `commit`, click on `ignore` on top of the screen and this will add the file to *.gitignore*
* By signing in with you Columbia mail address, you can choose your repository to be private.

### Branching
Branching is useful, because you can safely make changes to your work without affecting the main branch. Think of it as a parallel universe.
You can merge different branches to make changes in the main branch later on.

You can create a branch by typing in a new name. 


### Add Collaborators
Add collaborators to your repository, allowing them access to push to the repository.

Go to `Settings` > `Manage Access` > `Invite a collaborator`.
Your teammate should accept the invite in his/her mail.


### Tracking changes on GitHub

* clicking on `###commits` allows you to see commit history
* click on commits to see what was changed
  - code in red: deleted
  - code in green: added


### Blame
When going to a file, you can see `Blame` on the right.
This shows you who is the author line by line.


### Issues
`Issues` can be found next to `<>Code` at the top, right below your repository name.
Issues can be used to track todos, bugs, and other comments to leave in the repository for others to see.
You can tag your collaborator for them to be alerted with `@`.
If you have trouble figuring something out, or want somethnig to be resolved, others can see and help you resolve your problem.



## Getting started with Git on RStudio
### Cloning a repository to a new project

**Step 0**: Create a `github` folder to organize and keep all GitHub repositories.

* Mac users: Users\ [username]\github\
* Windows Users: Users\ [username]\Documents\github

**Step 1**: Copy GitHub URL

* Click `Code` > Copy `https`format to clipboard
* Or you can install GitHub Desktop and clone your repository there

**Step 2**: Create a new project on RStudio

* Create New project > `Version Control` > `Git` > paste repository URL
* The repository will be saved on your local machine
* Open the new project on a "new session": this will allow you to keep different projects separated and be organized; have different projects open at the same time

**Step 3**: Push the `.Rproj` to GitHub

* `Pull` first, and check everything is up to date
* `Stage`: select files you want to commit
* `Commit`: commit the files to GitHub
 - mostly, for first commit write "initial commit" for commit description or anything else adequate
 - for further commit, write description of what changes you made
 - if there is no change in description, you can `amend previous comment`
* check on GitHub page by refreshing to see if `.Rproj` was added

### Cloning a repository set up by someone else
If your teammate or collaborator already set up a github repo and commited an `.Rproj` and other `.R` files, cloning the repository will bring all the files your partner pushed to the repository.
  
### Overview of Git panel

* Stage: stage files to commit
* Status
 - `A`: Added
 - `D`: Deleted
 - `M`: Modified
 - `R`: Renamed
 - `?`: Untracked
* Diff: show file difference
* Commit: commit staged files
* Pull/ Push to remote repository
* History: view history of file
 
## Merging Conflicts
Just like mentioned in the beginning, while this is a effective and efficient collaborative way to work, it does not have the real-time reponsiveness of Google docs.
You can see who is logged on, who is working on what and what they are typing real-time on Google, but not here.
When collaborators are working on the same file but on different lines, it is not a problem. Just remember to pull each time before pushing in case your collaborator pushed to GitHub while you were working.
However, when you and your partner are working on the same line, you won't know until you pull. (Important to pull before you push!)
Even after you commit your changes, Git Pull will give you a error message, and you should decide which code to keep and what to do with it.
You'll see somthing like this:
```
>>> /usr/local/git/bin/git pull
CONFLICT (content): Merge conflict in [filename]
Automatic merge failed; fix conflicts and the commit the result.
```
On the Git panel, you will see the status as `U`: unresolved conflict.
To resolve the conflict, the person who first pushed should decide which to keep and delete.
Then you can describe in the commit description for future reference.

Pull and commit often, so that you can avoid merging conflicts.





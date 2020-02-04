# How to sync your fork of a repo with changes from upstream (i.e. me)


First `cd` into your repository in your local workspace (your laptop).
This is basic, but a lot of `git` errors are simply because people are in the wrong directory.


### Add upstream (only have to do this once!)

If this is the first time you are trying to sync a fork, you need to tell `git` where you forked from.

If you do a `git remote -v` at the command line, you'll see something like this
```
<you@dhcp194|~/work/ast596_2020_Spring> git remote -v
origin	https://github.com/<YOUR_GITHUB_USERNAME>/ast596_2020_Spring.git (fetch)
origin	https://github.com/<YOUR_GITHUB_USERNAME>/ast596_2020_Spring.git (push)
```

To tell `git` where you forked from, add MY git repo as your "upstream" - changes from me are upstream of you, and flow down.
```
git remote add upstream https://github.com/gnarayan/ast596_2020_Spring.git
```

If you again check remote
```
<you@dhcp194|~/work/ast596_2020_Spring> git remote -v
origin	https://github.com/<YOUR_GITHUB_USERNAME>/ast596_2020_Spring.git (fetch)
origin	https://github.com/<YOUR_GITHUB_USERNAME>/ast596_2020_Spring.git (push)
upstream	https://github.com/gnarayan/ast596_2020_Spring.git (fetch)
upstream	https://github.com/gnarayan/ast596_2020_Spring.git (push)
```

### Fetch changes from upsteam

To fetch changes I've made do:
```
git fetch upstream
```

That retrieves the changes but doesn't apply them to your local workspace.


### Apply the changes to your local workspace

First make sure you are in the same github branch as me:
```
git checkout master
```

and then apply the changes
```
git merge upstream/master
```


### Finally, push changes to YOUR GitHub repo (your "origin"):
```
git push origin master
```

If this gets dull, make a shell script in your repo to do these commands automatically each time you run the script.
The format will depend on your OS, but it's more or less copy the commands from fetch to finally above and stick it in a file, and execute it.

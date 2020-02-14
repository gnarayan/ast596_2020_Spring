 git remote add upstream https://github.com/gnarayan/ast596_2020_Spring.git
git remote -v
git fetch upstream
git checkout master
git merge --allow-unrelated-histories upstream/master -m "checking out"
git push origin master 

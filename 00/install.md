# <a name="top"></a>Getting Started

If you have never used python before, I encourage you to go through one of the bootcamps listed in the presentation included in this directory.

I also recommend checking out the Python [tutorial](https://docs.python.org/3/tutorial/index.html). You will also appreciate the documentation for the [Python standard library](https://docs.python.org/3/library/index.html), [NumPy](https://docs.scipy.org/doc/numpy/reference/) and [SciPy](https://docs.scipy.org/doc/scipy/reference/).

We will be using [Jupyter Notebooks](https://jupyter.org/) with
[IPython](http://ipython.org/) extensively in this course, so you will need a
computer that is running `linux` or `Mac OS X` and is set up to run them. If
this is not an option, and you are running `Windows`, you may want to request
an account on the campus cluster (see instructions in syllabus) or at the
[formerly NOAO DataLab](https://datalab.noao.edu/). This is going to involve a
bit more work.

If you are unfamiliar with the command line on Mac OSX or linux, here's a handy [cheat sheet](http://cheatsheetworld.com/programming/unix-linux-cheat-sheet/).

We will also be using the [GitHub](https://github.com) web service to
distribute course materials, including homework assignments, and to
keep track of your work - so you will need to be set up with `git` and
GitHub too.

* [Git and GitHub](#github)
* [Conda](#conda)
* [IPython Notebooks](#ipynb)

## <a name="github"></a>Git and GitHub

You are probably reading this file in a browser on the GitHub website.  By
exploring a little you can find all the course materials for ASTR596. Much of
the material can be browsed this way, but to get everything out of the course,
you will need a local copy of the repository.

linux machines should already have git installed (I don't know ANY distros that do not).
Mac OSX users may need [XCode Developer Tools](https://apps.apple.com/us/app/xcode/id497799835?mt=12)
You can also get git through the `conda` package manager. Skip to the [Conda](#conda) section of this guide.


### Forking a repo

A fork is a copy (a "clone") of a repository, within GitHub, that belongs to you.
It is not strictly necessary to fork the main course repo: if you don't plan to
suggest any changes to the material, you can just clone it directly as
described below. But if you want to make a fork, follow these directions.

On the other hand, it's good practice, so you should do it this way.

While viewing the GitHub repository that you want to fork, make sure you are
logged in, and you should see a button in the top righthand corner marked
"Fork".  Click this button.  Ta-daa!  You have your own copy of the repository,
hosted at GitHub.

In some circumstances, it seems that GitHub will automatically have you
`Watching` previous forks of the repo by others.  Go ahead and `Unwatch` them
if you want to avoid the associated notifications.

### Cloning a repo

To get a repo onto your local system, you need to clone it with the shell command
```bash
git clone <address>
```
Here, `<address>` is the git address of the remote repo (either the original or your fork), which will be something like `git@github.com:KIPAC/StatisticalMethods.git`. You can reveal this address by clicking the "Clone or download" button on the repo's GitHub page. Give this command a try.


```
git clone https://github.com/gnarayan/ast596_2020_Spring.git
```

### Commiting a change

Within the repo, there is a `homework/` folder. Create a subdirectory with your FirstnameLastname and create a file with some random text in it.
To push this change to github, the first thing you need to do is to add this change to your local index.

You do this with:

```
git add homework/FirstnameLastname/example.txt <adjust the path as needed>
```

If you want, you can check the status of your updates with 

```
git status
```

That change you just added is staged, but not "committed" to your local repository first.
You commit it with 

```
git commit
```
which will open up a text editor and let you enter a commit message to describe what you are changing.

Alternately,
```
git commit -m "some useful and descriptive message"
```

Finally, to push your change from your local machine to github, you need to:

```
git push origin master
```

If you forked your repo and you just setup your git account, it should prompt you for your username and password.
If you cloned my repo, it will likely fail, with one of two errors. If you get a message like this:
```
Permission denied (publickey)
```
it's is because you are not yet authorized to write to files on GitHub's computers. To enable them to let you in, you just have to give them your *public SSH key*. (This is all worth it, I promise: setting this up will allow you to push and pull without typing your GitHub password all the time. However, if you somehow never plan to push anything to GitHub, it's simpler to clone using https rather than SSH; this does not require setting up a key.) 

Go to the [SSH settings part of your GitHub profile](https://github.com/settings/ssh) and add a new key, pasting in the contents of your file (do "`more ~/.ssh/id_rsa.pub`". "Title" can be anything - I use "laptop".) If that file doesn't exist, you can make one with the command `ssh-keygen`. Now you should be able to interact with GitHub repositories via the command line.

Alternatively, you might get an error message because you don't have `git` installed. There are a number of ways to install `git`, and the best one will depend on your operating system. A good Google search query could be, for example, "install git Mac OS X 10.8.5". The easier way is to just install git with conda so skip ahead to the next session.

If all else fails, note that you can download a GitHub repository as a `zip` file also.
However, this is a simple, one-time download, meaning that there is no way to get updates other than to re-download the entire repository - so we recommend cloning the repo, if at all possible. Anything but this...

## <a name="conda"></a>Conda

### Installing conda

Follow the instructions from conda to [install Miniconda](https://conda.io/projects/conda/en/latest/user-guide/install/index.html)


### Create an environment

```
conda config --add channels http://ssb.stsci.edu/astroconda
conda create -n fds -c stsci python=3 ipython jupyter numpy scipy matplotlib seaborn pandas astropy healpy pymc3 emcee scikit-learn astroml tensorflow ds9 specutils specviz glueviz statsmodels corner
```

This will create the `fds` conda environment with a python installation for this class. If you don't have git, add `git` to that long list.

You activate the conda env with:

```
conda activate fds
```

If you need a new package:

```
conda install <package name>
```

In some cases you can also `pip install <package name>` from within your conda
env, but it is generally best to not mix the two.


You can clean up package tarballs with `conda clean --all`


## <a name="ipynb"></a>Jupyter Notebooks with IPython

The notebooks provided with this course are
["Jupyter"](https://jupyter.org/) notebooks,  which run IPython. You can read more at [the IPython
website](http://ipython.org/) but the bottom line is: you should get the
latest version, just to be safe.

### To edit and run a notebook:

In a new shell, activate the conda env, and in the top level directory of the repository, try
```bash
jupyter notebook &
```
You should see a new tab open in your web browser, and a display of your file system (starting from your current directory) appear.

**NB. It's important you launch the notebook from the top level directory of the repo (or higher), so that relative links within the repo work correctly.** If you don't do this, you will get "404" errors.

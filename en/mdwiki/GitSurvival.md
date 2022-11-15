# GitSurvival

*Reading*

 * https://github.com/MikeMcQuaid/GitInPractice
 * https://git-scm.com/book/en/v2
   * https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging

# Basic Tasks

## Create a new repo from scratch (Option I, github or gitlab)

1.  Log on to github or gitlab
2.  Make sure you have ssh keys set up correctly _before_ you proceed.
   * See docs for [Github.com](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) or [Gitlab.com](https://docs.gitlab.com/ee/ssh/).
   * Test it with `ssh -T git@gitlab.com` or `ssh -T git@github.com` and _don't proceed_ until it works.
3.  Create a new repo on the web at github.com or gitlab.com.  This isn't hard... read the online docs if you need to.  Note that on github.com they're called "repositories" while on gitlab.com they're called "projects".
4.  Clone the (empty) repo to your local machine, as...

```
  $ git clone git@gitlab.com:eshazen/eggbeater.git    # or
  $ git clone git@github.com:eshazen/eggbeater.git
  $ cd eggbeater     # DON'T FORGET THIS, DON'T ADD FILES OUTSIDE THE REPO!
```

Now you're ready to add files, commit, push etc.  You can always check where the remote repo is with:

```
  $ git remote -v
  origin git@gitlab.com:eshazen/eggbeater.git (fetch)
  origin git@gitlab.com:eshazen/eggbeater.git (push)
```

## Create a new repo from scratch (option II, local)

Normally you'd do it this way if you already have a git repo you want to connect to github or gitlab.

```
  $ cd ~/work              # best not your login directory, suggest "work"
  $ mkdir eggbeater        # use a short, memorable name
  $ cd eggbeater
  $ git init
  $ echo "# Test project" > README.md      # optional but nice for Github/gitlab
  $ git add README.md
  $ git commit -m "initial commit"
```

Now you will want to connect it with a remote.  For example, for gitlab:

```
  $ git remote add origin git@gitlab.com:eshazen/eggbeater.git
  $ git push --set-upstream origin master
```

This doesn't work (easily) for github.com... you have to use the other recipe above where you create the repo first on the github.com webpage.



# Random Tips

*Alias lg to see log*

From Stefano M:  "Alias to see all commits in the history of branches, tags and other refs in a graphically half-decent way"

```
  Open ~/.gitconfig and add the following:
[alias]
    lg = log --all --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'

  From now on you can run
   git lg
```


*Deal with "Your local changes...would be overwritten*

```
  git reset -- hard       # this kills all local changes, careful!
  git pull
```

*Switch to (remote) branch*

```
  $ git checkout -b <branch> --track <remote>/<branch>
```

*Update submodule to latest*

https://github.com/tj/git-extras/pull/80

```
  cd submodule_name
  git checkout master && git pull
  cd ..
  git add submodule_name
  git commit -m "updating submodule to latest"
```

*See what branch we are on*
```
  $ git branch -a
```



*View graph of branches*
```
git log --graph --oneline --decorate
git log --graph --oneline --decorate --all
```

*Undo changes to one file*

See https://stackoverflow.com/questions/692246/undo-working-copy-modifications-of-one-file-in-git
```
  $ git checkout -- file
```

*Avoiding to always type password*

 * See https://stackoverflow.com/questions/35942754/how-to-save-username-and-password-in-git-gitextension
 * `git config --global credential.helper store`
   * this stores PW in `~/.git-credentials`

*Normal editing*

```
  $ git clone ssh://git@gitlab.cern.ch:7999/atlas-hllhc-muon-mdt-trigger-doc/Proto0_Blade.git
  $ cd Proto0_Blade
  $ (edit files)
  $ git commit -a     # commit changes (not new files) to local
  $ git push --all    # push changes back to master on remote
```


*To check out a specific revision*, figure out the SHA1 code (long hex string), then:
```
  $ git fetch origin <SHA1>
  $ git reset --hard <SHA1>
```


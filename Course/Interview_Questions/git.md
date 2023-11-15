# Git Interview Question 

**What is Git?**
   - "Git is a distributed version control system used to track changes in source code during software development. It's designed to handle projects of any size with speed and efficiency."

**What is the difference between Git and SVN?**
   - "Git is a distributed version control system, whereas SVN is a centralized version control system. In Git, every user has a copy of the entire repository history, which makes it more robust and allows for more flexible workflows."

**How does the Git workflow work?**
   - "The Git workflow typically consists of creating branches, making changes, committing those changes, pulling any new changes from the remote repository, merging branches, and pushing changes to the remote repository."

**What are the stages of a file in Git?**
   - "Files in Git can be in one of three states: modified, staged, and committed. Modified means changes have been made but not yet committed. Staged means changes are marked to be included in the next commit. Committed means the changes are saved in the repository history."

**How do you create a new branch in Git?**
   - "You can create a new branch in Git using the command `git branch branch_name`."

**What is a merge conflict in Git?**
   - "A merge conflict in Git occurs when two branches have made changes to the same line of a file or when one branch deleted a file that another branch modified. Git can't automatically resolve these conflicts, so the user must manually resolve them."

**How do you resolve a merge conflict in Git?**
   - "To resolve a merge conflict in Git, you need to manually edit the files with conflicts, remove the conflict markers, and then add the resolved files to the staging area with `git add`. After that, you can complete the merge with `git merge` or `git commit`."

**What is a pull request in Git?**
   - "A pull request is a way of proposing changes to a codebase in Git. It allows developers to review and discuss changes before they are merged into the main branch."

**How do you revert a commit in Git?**
   - "You can revert a commit in Git using the `git revert` command, followed by the commit hash. This creates a new commit that undoes the changes from the specified commit."

**What is a rebase in Git?**
    - "A rebase in Git is a way of integrating changes from one branch into another by moving or combining a sequence of commits."

**What is the difference between 'git merge' and 'git rebase'?**
    - "'git merge' creates a new commit that combines the changes from two branches, whereas 'git rebase' moves or combines a sequence of commits."

**What is a Git stash?**
    - "Git stash is a feature that allows you to save your local modifications away and revert the working directory to match the HEAD commit."

**How do you squash commits in Git?**
    - "You can squash commits in Git using the `git rebase -i` command, which allows you to combine multiple commit messages into one."

**What is the significance of the '.git' folder?**
    - "The '.git' folder contains all the information that is necessary for your project in version control and all the information about commits, remote repository address, etc."

**How do you clone a repository in Git?**
    - "You can clone a repository in Git using the `git clone` command, followed by the repository's URL."

**What is 'git fetch'?**
    - "'git fetch' downloads changes from a remote repository to your local repository, but it does not merge those changes into your working branch."

**What is 'git pull'?**
    - "'git pull' fetches changes from a remote repository and merges them into your local branch."

**How do you push a local branch to a remote repository in Git?**
    - "You can push a local branch to a remote repository in Git using the `git push` command, followed by the remote name and branch name."

**What are Git hooks?**
    - "Git hooks are scripts that run automatically at specific points in Git's execution process, such as before a commit or before a push."

**What is a bare repository in Git?**
    - "A bare repository in Git is a repository without a working directory. It's used as a centralized repository that developers can push to and pull from."
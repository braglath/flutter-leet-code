# Git questions

## PR scenario

- You created PR-1 (based on features or develop)
- While waiting for review, you started Task-2
- PR-1 got review comments
- But now your local branch already contains Task-2 changes
- You don’t want to push Task-2 into PR-1

**Best Practice Solution (Clean & Professional Way):**

Always create a new branch from base branch, not from your PR branch

```bash
git checkout features
git checkout -b task-2
```

**Assume:**

- PR branch = feature/login
- You started Task-2 on same branch
- You have uncommitted OR committed changes

**Case1 - Task 2 changes are not committed:**

- git stash
- make PR changes

**Case2 - Task 2 changes are already committed:**

- create new branch for task 2
- reset PR branch back to origin commit - "git log" to find the commit before task 2 started

## What is mono repo in Git

A Monorepo (Monolithic Repository) in Git means storing multiple projects in a single Git repository instead of having separate repositories for each project.

company-repo/
│
├── mobile-app/
│ ├── flutter_app/
│ └── android_native/
│
├── backend/
│ ├── auth_service/
│ └── payment_service/
│
├── shared/
│ ├── ui_components/
│ └── utils/
│
└── docs/

Everything is inside one Git repository.

- Single repository for many projects
- Easier to share code
- One version history
- Large repo size

## Multi-repo

- Each project has its own repo
- Harder to share code
- Separate histories
  -Smaller repos

mobile-repo
backend-repo
shared-repo

## Rebase vs Moving Head

Moving HEAD simply changes which commit Git is pointing to, usually via checkout or reset. Rebase, on the other hand, rewrites commit history by replaying commits from one branch onto another base commit.

**What is HEAD in Git?**

HEAD is a pointer that points to the current commit you're working on.

A --- B --- C --- D
↑
HEAD

HEAD currently points to commit D.

**Moving HEAD:**

Moving HEAD simply means changing which commit HEAD points to.

git checkout HEAD~1

Now HEAD moves back one commit.

A --- B --- C --- D
↑
HEAD

This is called detached HEAD state.

You are not on any branch, just on a commit.

## What is Rebase?

Rebase rewrites commit history by replaying commits on top of another branch.

**Before Rebase:**
main: A --- B --- C
\
feature: D --- E

**Run:**

git rebase main

**After Rebase:**
main: A --- B --- C
\
feature: D' --- E'

Git replays commits D and E on top of C.

**Important:**

- Commit hashes change
- History becomes linear

## What does --amend do?

--amend modifies the last commit.

**You can:**

- change commit message
- add/remove files
- fix small mistakes

Fix Commit Message
git commit --amend

Add forgotten file
git add new_file.dart
git commit --amend

**When do you use amend?**

- fixing commit message
- adding forgotten file
- squashing small fixes before pushing PR

## Scenario: Two developers changed same file

You pulled latest code and there is a merge conflict. What will you do?

**Steps:**

- Understand both changes.
- Decide correct logic.
- Manually edit file.
- Remove conflict markers.
- Stage and commit.

**Important Point:**

Always test the feature after resolving conflicts.

## Scenario: Wrong commit pushed to main branch

You accidentally pushed wrong code to main branch.

**If commit should be undone but history preserved:**

git revert <COMMIT_ID>
git push

This creates a new commit that reverses changes.

**Why not reset?**

Because reset rewrites history and can break other developers’ work.

## Scenario: Large feature branch is outdated

You worked on a feature branch for 5 days and main branch has many updates. What will you do?

Rebase your branch.

git checkout feature/login
git fetch origin
git rebase origin/main
git push --force-with-lease

**Why rebase?**

It keeps history clean and linear.

## Scenario: Commit message mistake

You committed but message is wrong.

**If not pushed:**

git commit --amend

**If already pushed:**

git commit --amend
git push --force-with-lease

## Scenario: Need to remove a file from last commit

git reset HEAD file.txt
git commit --amend

## Scenario: Need to undo local changes

**Discard local changes:**

git checkout -- file.dart

**Discard all changes:**

git reset --hard

## Scenario: Need to see who changed a line

git blame file.dart

**This shows:**

- commit
- author
- line change

## Scenario: Want to move last commit to another branch

**Create new branch:**

git branch new-feature

**Remove commit from current branch:**

git reset --soft HEAD~1

Switch branch and commit again.

## Scenario: Your PR has 20 commits but reviewer wants 1 clean commit

Use interactive rebase.

git rebase -i HEAD~20

**Change commits to:**

- pick
- squash
- squash

Result → single clean commit.

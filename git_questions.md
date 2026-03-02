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

# Developer related questions

## How do you mentor junior developers

- I first assess, understand each develops and their knowledge and experience
- assign task accordingly to above
- ask them to walk us through the feature/task then have done
- Code reviews with explanation and constructive feedback
- enforce testing culture
- encourage debugging, not dependency. instead of fixing bugs for them
- Architecture discussions
- weekly Pair programming (Refactor code together)
- Documentation
- set growth goals
- soft skill mentoring. writing better PR, handling critical bugs calmly, communication blockers

## How do you handle disagreement in architecture decisions?

- Discuss tradeoffs
- Provide data
- Align with business goals
- Check if it falls within the scope
- Document decisions
- Stay team-focused

## Clean Architecture vs Feature-first — difference?

**Clean Architecture:**

- Layer separation (domain/data/presentation)

**Feature-first:**

- Organized per feature

**Best approach:**

- Combine both.

features/
login/
domain/
data/
presentation/

## how to fix a production outage

- Check logs from firebase crashlytics/ sentry, try to reproduce locally
- assess severity (critical, major, minor), this decides urgency and release type
- (roll back temporarily) either create a hotfix branch or disable the feature via remote config/firebase remote config/server controlled flags
- fix only the specific issue
- avoid scope creep (like refactoring unrelated code/improve architecture/updating dependencies)
- regression protection - add test cases, test critical flows
- add logging
- coder review
- testing
- release patch version (use staged rollout if possible)
- monitor crash and analytics

**You can add:**

- “We also conduct a root cause analysis after resolution.”
- “We update documentation to prevent similar bugs.”
- “We improve monitoring if detection was delayed.”

## Client wants a new feature. How do you come up with the timeline?

- Never give timeline immediately
- clarify the feature
- is it similar to something we have already built
- break features into smaller tasks
- do parallel development with mock data
- prototype actual feature before perfecting UI team
- check with UI team, BA team, Backend team, Testing team
- make sure no scope creep
- add 15 to 25% as buffer

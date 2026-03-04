# Developer related questions

## Tell me about yourself (Improved Answer)

Hi, my name is Braglath. I’m a Computer Science graduate with around 8 years of overall experience, including 7 years specializing in Flutter development.

I started my career as a UI/UX developer, which helped me build a strong understanding of user experience and design principles. Over time, I transitioned into mobile application development, focusing mainly on Flutter and scalable mobile architectures.

In my previous role at IBM, I worked on the Equitas Small Finance Bank mobile application. When our team joined the project, the application had already been developed by multiple vendors over a period of two years. Because of architectural inconsistencies and performance issues, the app was experiencing jank, screen freezes, and frequent production issues.

With my Flutter experience, I took the initiative to analyze the application performance and worked closely with the team to refactor key parts of the codebase, optimize widget rebuilds, and improve state management practices. As a result, we were able to improve the app performance by around 40% and eliminate most of the UI lag and freezing issues.

Based on this work, I was given the opportunity to lead the Flutter team in developing a new internal staff application for the bank. I was involved throughout the entire development lifecycle — from requirement discussions with business analysts, collaborating with UI/UX designers, development, testing, and finally production release.

As part of the leadership role, I introduced code quality guidelines, regular architecture discussions, and mentoring sessions for junior developers through code reviews and pair programming. We also followed agile practices with daily stand-ups to ensure smooth collaboration.

The application was successfully released to production, and since it was an internal staff application, we distributed it using Firebase App Distribution for controlled APK distribution to different teams.

Overall, I enjoy building highly maintainable, scalable and high-quality mobile applications, improving performance, and mentoring team members.

## Can you explain the code quality guidelines you introduced?

When I joined the project, the codebase had contributions from multiple vendors, which resulted in inconsistent coding styles, different architectural patterns. This was also contributing to performance issues and production bugs.

To address this, I introduced a set of code quality guidelines for the Flutter team to ensure consistency and maintainability across the project.

Enforced clear separation of layers such as presentation, domain, and data.

feature based folder structure

Repository pattern for API and data access.

Business logic should not exist inside UI widgets.

Proper exception and edge case handling

Standardized how state management should be used.

Use const widgets where possible

refractor bigger widgets into smaller widgets

Avoid heavy work inside the build method

Naming conventions (class -> pascal case, variables -> lowerCamelCase, folder -> snake_case)

disposing of controllers

Encouraged developers to include: Unit, Widget and Integration testing

Document complex logic

Write meaningful PR descriptions

Overall, the goal of these guidelines was to ensure that even with multiple developers contributing to the project, the codebase remained consistent, maintainable, and scalable.

## Tell me about a performance improvement you implemented

In one of my recent projects at IBM, I worked on the Equitas Small Finance Bank mobile application, which was already developed over a period of three years by multiple vendors. Because of this, the codebase had several architectural inconsistencies and performance issues.

When our team took over the project, users were experiencing UI jank, screen freezing, and slow interactions, which affected the overall user experience.

I took the initiative to analyze the performance issues and identify the root causes. I reviewed the widget structure, state management patterns, and unnecessary rebuilds happening across the application.

Some of the improvements we implemented included:

Reducing unnecessary widget rebuilds

Refactoring certain screens to follow better state management practices

Optimizing heavy UI components

Improving API handling and loading states

After these optimizations, we were able to improve the application performance by around 40%, which significantly reduced UI lag and freezing issues.

This also improved the overall user experience and stability of the application before the next production release.

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

My approach to mentoring junior developers is structured around understanding their current skill level and helping them grow both technically and professionally.

First, I try to assess each developer’s strengths, experience, and areas where they need support. Based on that, I assign tasks that are challenging enough for learning but still achievable.

When they complete a task, I usually ask them to walk the team through their implementation. This helps them build confidence and ensures they understand the feature deeply.

I also focus heavily on code reviews, where I provide constructive feedback and explain the reasoning behind best practices such as clean architecture, proper state management, and writing maintainable code.

Another important aspect is encouraging independent problem-solving. Instead of directly fixing bugs for them, I guide them through debugging so they learn how to approach problems themselves.

I also conduct regular architecture discussions and pair programming sessions, where we sometimes refactor code together and discuss better design patterns.

Beyond technical skills, I also help them develop soft skills, such as writing clear pull requests and communicating effectively with the team.

Overall, my goal is to help them grow into developers who can write quality, maintainable and scalable code, think critically, and collaborate effectively with the team.

## How do you handle disagreement in architecture decisions?

- Discuss tradeoffs
- Provide data
- Align with business goals
- Check if it falls within the scope
- Document decisions
- Stay team-focused

When there is a disagreement in architecture decisions, my approach is to keep the discussion technical and team-focused rather than personal.

First, I encourage the team to discuss the trade-offs of each approach, including scalability, maintainability, performance, and development effort.

I try to support the discussion with data or real examples, such as performance metrics, documentation, or past project experience. This helps keep the conversation objective rather than opinion-based.

Next, we evaluate which approach aligns better with the business goals, timeline, and project scope. Sometimes the technically perfect solution may not be the best choice if it increases complexity or delays delivery.

Once the team agrees on the approach, I make sure we document the architectural decision so that everyone understands the reasoning behind it and it becomes easier for new team members to follow.

Overall, my goal is to ensure the final decision is best for the product and the team, even if it’s not necessarily my original proposal.

## how to fix a production outage

- Check logs from firebase crashlytics/ sentry, try to reproduce locally
- assess severity (critical, major, minor), this decides urgency and release type
- (roll back temporarily) disable the feature via remote config/firebase remote config/server controlled flags
- create a hotfix branch from main/master
- fix only the specific issue
- avoid scope creep (like refactoring unrelated code/improve architecture/updating dependencies)
- regression protection - add test cases, test critical flows
- add logging
- code review
- testing
- release patch version (use staged rollout if possible)
- monitor crash and analytics

When a production outage happens, my first priority is to understand the issue quickly and minimize the impact on users.

First, I check monitoring tools such as Firebase Crashlytics or Sentry to analyze error reports. I try to reproduce the issue locally so I can identify the root cause.

Next, I assess the severity of the issue — whether it is critical, major, or minor — because that determines how urgently we need to act and whether we need an immediate patch release.

If the issue is severely impacting users, we may take a temporary mitigation step, such as disabling the problematic feature using remote configuration or server-controlled feature flags.

Once the root cause is identified, I create a hotfix branch from the main branch and focus only on fixing the specific issue. During this stage, I avoid making unrelated changes such as refactoring or dependency updates to reduce risk.

After implementing the fix, we perform code review and thorough testing, especially regression testing for critical flows. I also add additional logging or test cases to help detect similar issues earlier in the future.

The fix is then released as a patch version, ideally using staged rollout so we can monitor crash rates and analytics before rolling it out to all users.

Finally, we continue monitoring Crashlytics and analytics dashboards to confirm the issue is resolved and that no new problems appear.

additionally

- “We also conduct a root cause analysis.”
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

When a client requests a new feature, I usually avoid giving an immediate timeline because accurate estimation requires a clear understanding of the requirements.

First, I work with the business analyst or product team to clarify the feature requirements and ensure the scope is well defined. I also check whether the feature is similar to something we have already built, which can help us reuse components and reduce development time.

Next, I break the feature into smaller tasks, such as UI implementation, API integration, state management, testing, and deployment. This makes the estimation more realistic.

I also check for dependencies across teams, including the UI/UX team, backend team, and QA team, to understand if there are any blockers or parallel work that can be done.

To speed up development, we sometimes start implementation using mock data while waiting for backend APIs. In some cases, we also create a small prototype to validate the approach before finalizing the full implementation.

During estimation, I ensure that the scope is clearly defined to avoid scope creep during development.

Finally, once the tasks are estimated, I usually add a buffer of around 15–25% to account for unforeseen issues, testing, and integration challenges.

This approach helps provide a realistic and reliable timeline while maintaining transparency with stakeholders.

## How do you work and deliver under pressure

When working under pressure, I focus on staying organized and prioritizing the most critical tasks first.

The first thing I do is clearly understand the scope and urgency of the task, especially if there are strict deadlines or production issues involved. I break the work into smaller, manageable tasks so the team can focus on solving one problem at a time.

Next, I prioritize tasks based on business impact, ensuring that the most critical functionality is delivered first. If needed, I also identify tasks that can be done in parallel by different team members to speed up delivery.

Communication is also very important during high-pressure situations. I make sure the team and stakeholders are aligned on progress, risks, and timelines, so expectations remain realistic.

At the same time, I try to maintain code quality and proper testing, because rushing changes without validation can create more problems later.

Overall, I believe staying calm, prioritizing effectively, and maintaining clear communication helps the team deliver successfully even under pressure.

For example, during the Equitas banking app project, we had to resolve several performance issues within a limited timeline before a release. By prioritizing performance fixes, coordinating closely with the team, and focusing on the most impactful improvements first, we were able to significantly improve the app performance before the release.

## How do you conduct code reviews?

When conducting code reviews, my goal is not just to find issues but to improve code quality and help the team learn best practices.

First, I review the overall design and architecture to ensure the implementation aligns with the project’s architecture guidelines and does not introduce unnecessary complexity.

Next, I check the readability and maintainability of the code, such as proper naming conventions, modular functions, and clear separation of responsibilities.

I also review the code for performance considerations, especially in Flutter applications, ensuring there are no unnecessary widget rebuilds, heavy operations inside the build method, or inefficient data handling.

Another important aspect I check is error handling and edge cases, making sure the code handles failures gracefully rather than causing unexpected crashes.

I also verify whether test cases are included where appropriate, especially for business logic.

When providing feedback, I try to keep it constructive and educational, explaining why a certain approach may be better rather than simply asking the developer to change it.

Finally, once the comments are addressed, I do a quick re-check to ensure the changes are properly implemented before approving the pull request.

I see code reviews not only as a quality control process but also as a knowledge-sharing opportunity for the entire team.

## What if a developer disagrees with your code review comment?

I usually encourage a short discussion so we can understand both perspectives. If the alternative approach is valid and does not violate architecture or performance standards, I’m open to adopting it. The goal is always to choose the best solution for the product, not necessarily my solution.

## What do you bring to the table?

I bring a combination of strong Flutter expertise, performance optimization experience, and team leadership. I have around 8 years of experience, with 7 years specializing in Flutter development.

Along with development, I also contribute by mentoring junior developers, conducting structured code reviews, and establishing coding standards to improve overall code quality and maintainability. I work closely with cross-functional teams including backend, QA, and UI/UX to ensure smooth feature delivery.

Overall, I try to contribute not only through technical development but also by improving engineering practices and helping the team deliver stable, high-quality applications.

## What makes a good software engineer?

A good software engineer not only writes functional code but also considers maintainability, scalability, and team collaboration.
The goal is to build solutions that are easy for the entire team to understand and evolve.

## How do you improve team productivity?

I try to remove blockers for the team and encourage knowledge sharing through documentation and code reviews.
Having clear coding standards also reduces confusion and speeds up development.

## How do you handle legacy code?

When working with legacy code, I try to avoid large refactors immediately.
Instead I make incremental improvements while implementing new features.
Over time this gradually improves the code quality without introducing risk.

## How do you design scalable architecture?

I prefer separating concerns clearly between presentation, domain, and data layers.
Business logic should not be tightly coupled with UI.
This structure makes the code easier to test, maintain, and extend as the application grows.

## How do you ensure code quality?

I ensure code quality through multiple layers.
First we define coding standards like naming conventions, folder structure, and architecture guidelines.
Then we enforce lint rules and static analysis.
Code reviews are mandatory to ensure maintainability and knowledge sharing.
For critical modules we also add unit and widget tests.

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

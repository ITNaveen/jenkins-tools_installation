- create multibranch pipeline
- choose branch source
- build config - jenkins file in source code

- we will see multibranch logs and it show jenkinsfile repo in main branch.
- from jenkins i go to this branch and see only main branch as we have only this now.
- if we add any more branches then we need to scan multibranch pipeline now.
- now i created new branch "dev" then scanned again and see dev branch as well in dashboard under this multibranch repo.

- lets create another branch stage but without jenkins file - 
git checkout -b stage
then remove all jenkins file from this branch then push.
Now i have scanned branch from multibranch job but it couldn.t detect that.
i will now add jenkinsfile and see what happen, so now stage is visible as well.


# Advanced Security POC Planning

## Background

### GitHub Organization

Which organization would you like to use: $CUSTOMER-POV-ORG
### People
List all people from $CUSTOMER-NAME who will be involved with the PoC. 
Please list not only those people that will be actively engaged with the PoC/PoV but also the ones that will be impacted by it.

| Name | Role | GitHub Username | Primary |
| ------ | ---- | ------------------ | -------- |
|||||


### Code you plan to analyze

- Aim to have at least 500kloc of code with high security impact.
- For compiled languages (everything except js/ts/python) we will need to know how to build the code from a fresh checkout.
- Assess the complexity of each codebase. This is somewhat subjective, but find out the following information to make your assessment:
  - language (e.g. compiled = slightly more complex, C++ = more complex)
  - build system (less familiar = more complex, distributed = more complex)
  - CI system and build dependencies (does every repo use a standard CI image? or does this project have their own special one?)
  - approx. number of lines of code (larger = more complex)
  - approx. project age (older = more complex)
- While there is nothing in the POC to limit how many repositories you can analyze, we are a bit limited in how many we can help you with during a trial. Please pick 4-7 repositories that best fit the criteria above as your primary targets of the POC and list them below.

| repo |  language  |   build   |  rough size  | rough age | notes |
|------|------------| --------- |--------------|-----------|-------|
|||||||

## Success Criteria

See Issues
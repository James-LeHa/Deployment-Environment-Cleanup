#!/usr/bin/env bash

while true; do
    clear
    echo -e "This action will: "
    echo -e "\t\t - Create 4 labels for these issues in: https://github.com/$OWNER/$REPO"
    echo -e "\t\t - Create 30 issues to support a GHAS POV in: https://github.com/$OWNER/$REPO"
    echo -e "\t\t - Using the GitHub PAT ending in  ${TOKEN: - 5}"
    echo -e "\t\t - This might make a big mess if this script has already been run against this repo!!"
    read -p "Proceed? (y/n)" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) echo -e "Cancelling..."; exit 1;;
        * ) echo "Proceed? (y/n)";;
    esac
done

# Create labels

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/labels" \
--header "Authorization: token ${TOKEN}" \
--header 'Accept: application/vnd.github.v3+json' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name":"GHAS POV"
  ,"color":"5319e7"
  ,"description":"Pertaining to the GitHub Advanced Security (GHAS) Proof of value (POV)"
}'


curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/labels" \
--header "Authorization: token ${TOKEN}" \
--header 'Accept: application/vnd.github.v3+json' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name":"Critical"
  ,"color":"bf092a"
  ,"description":"Critical for success"
}'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/labels" \
--header "Authorization: token ${TOKEN}" \
--header 'Accept: application/vnd.github.v3+json' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name":"Important"
  ,"color":"ddc130"
  ,"description":"Highly valuable success criterion"
}'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/labels" \
--header "Authorization: token ${TOKEN}" \
--header 'Accept: application/vnd.github.v3+json' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name":"Nice to have"
  ,"color":"c2e0c6"
  ,"description":"Helpful but not critical success criterion"
}'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/labels" \
--header "Authorization: token ${TOKEN}" \
--header 'Accept: application/vnd.github.v3+json' \
--header 'Content-Type: application/json' \
--data-raw '{
  "name":"Prep work"
  ,"color":"045889"
  ,"description":"Pre-requisites activities for GHAS POV"
}'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
                        "labels":["GHAS POV","Prep work"],
                        "title": "GHAS POV Planning",
                        "body": "# Advanced Security POC Planning\r\n\r\n## Background\r\n\r\n### GitHub Organization\r\n\r\nWhich organization would you like to use: \r\n### People\r\nList all people from your side who will be involved with the PoC. \r\nPlease list not only those people that will be actively engaged with the PoC/PoV but also the ones that will be impacted by it.\r\n\r\n| Name | Role | GitHub Username | Primary |\r\n| ------ | ---- | ------------------ | -------- |\n| _Person 1_ | _Role 1_ | _Username 1_ | _Primary_ | \r\n ### Code you plan to analyze\r\n\r\n- Aim to have at least 500kloc of code with high security impact.\r\n- For compiled languages (everything except js/ts/python) we will need to know how to build the code from a fresh checkout.\r\n- Assess the complexity of each codebase. This is somewhat subjective, but find out the following information to make your assessment:\r\n  - language (e.g. compiled = slightly more complex, C++ = more complex)\r\n  - build system (less familiar = more complex, distributed = more complex)\r\n  - CI system and build dependencies (does every repo use a standard CI image? or does this project have their own special one?)\r\n  - approx. number of lines of code (larger = more complex)\r\n  - approx. project age (older = more complex)\r\n- While there is nothing in the POC to limit how many repositories you can analyze, we are a bit limited in how many we can help you with during a trial. Please pick 4-7 repositories that best fit the criteria above as your primary targets of the POC and list them below.\r\n\r\n| repo |  language  |   build   |  rough size  | rough age | notes |\r\n|------|------------| --------- |--------------|-----------|-------|\r| _repo-1_ | _language_ | _yes/no_ | _rough size_ | _rough age_ | _notes_ | \r\n\r\n Success Criteria are managed in Issues."
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Prep work"],
                        "title": "Enable GitHub Enterprise Cloud on `<ORG>`",
                        "body": "Enable Enterprise Cloud capabilities on the `<ORG>` org"
                    }'


curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Prep work"],
                        "title": "Add all repositories to `<ORG>`",
                        "body": "Add the following repositories to the `<ORG>` organization for the POC:\r\n\r\n-"
                    }'



curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Prep work"],
                        "title": "Configure Actions builds for repositories",
                        "body": "### Repositories to configure builds in Actions\r\n- [ ] _Repo 1_\r\n- [ ] _Repo 2_\r\n### Resources\r\n\r\n* [Getting Started with GitHub Actions](https://docs.github.com/en/actions/getting-started-with-github-actions)\r\n* GitHub Learning Lab course on [CI with GitHub Actions](https://lab.github.com/githubtraining/github-actions:-continuous-integration)\r\n* Conference talk [Advanced GitHub Actions: Workflows for production grade CI/CD](https://www.youtube.com/watch?v=0ahRkhrOePo)\r\n\r\n### Stuck?\r\n\r\n* Reach out directly by opening a [new issue LINK] specific to the repo you are looking to build. Be sure to paste in any error log output as well as the contents of your workflow file"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Prep work"],
                        "title": "Enable GitHub Advanced Security on `<ORG>`",
                        "body": ""
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Prep work"],
                        "title": "Configure Code Scanning for all repositories",
                        "body": ""
                    }'


curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV", "Critical"],
                        "title": "Capture discussion about secure code development decisions",
                        "body": "Additional info here"
                    }'


curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV", "Critical"],
                        "title": "Detection of secret keys from known token formats committed to private repositories",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV", "Critical"],
                        "title": "Facilitate creation of teams focused on expertise and/or areas of interest",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV", "Critical"],
                        "title": "GHAS Code Scanning directly integrated within GitHub Actions Workflow",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV", "Critical"],
                        "title": "Identify code vulnerability alerts along with their severity levels directly within Pull Request",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV", "Critical"],
                        "title": "Promote Collaborative Secure Development Process",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV", "Critical"],
                        "title": "Secret Scanning for Private Repositories",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Important"],
                        "title": "Use GHAS Code Scanning to detect code vulnerabilities based off of the 1800+ existing CodeQL queries",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Important"],
                        "title": "Alert maintainers of any vulnerable dependencies in their repositories along with their severity levels and a link to relevant files.",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Important"],
                        "title": "Identify transitive dependencies (dependency graph) along with a link to the OSS repository in an individual repository",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Important"],
                        "title": "Render results of other SARIF-based SAST tools directly within the GitHub UI",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Important"],
                        "title": "Secret scanning resolution information including whether it was a resolved, a false positive, or just ignored",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Important"],
                        "title": "Source OSS dependency vulnerability information from the GitHub Advisory Database",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Important"],
                        "title": "Variant Code analysis (Custom QL Required)",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Important"],
                        "title": "View information about detected vulnerabilities including linked CVE/CWE information, examples, and resolution recommendations",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Important"],
                        "title": "View Security Alerts across the entire Organization while being able to filter based on severity level and view the dependent repositories.",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Nice to have"],
                        "title": "Automatically update dependency vulnerabilities with Dependabot security updates",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Nice to have"],
                        "title": "Codify custom queries for known problematic customer code issues or Prior CVEs",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Nice to have"],
                        "title": "Identify and view OSS license usage across the entire Organization",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Nice to have"],
                        "title": "Identify dependencies across an organization",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Nice to have"],
                        "title": "Invite non-core teams (expertise, interest, discipline) to review process",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Nice to have"],
                        "title": "Scan repositories to identify variants",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV","Critical"],
                        "title": "Trace vulnerabilities from Source to Sink for DataFlow related vulnerabilities",
                        "body": "Additional info here"
                    }'

curl --location --request POST "https://api.github.com/repos/$OWNER/$REPO/issues" \
 --header "Authorization: token ${TOKEN}" \
 --header 'Accept: application/vnd.github.v3+json' \
 --header 'Content-Type: application/json' \
 --data-raw '{
   
                        "labels":["GHAS POV"],
                        "title": "GHAS POV Master Tracking Issue",
                        "body": "This issue will serve as a general tracking and discussion forum for the POV in general.  \r\n\r\nIndividual success criteria have been created as issues, with priorities as labels.  We can discuss stuff related to individual criteria in their respective issues.  Please move the cards between columns on the LINK-TO-PROJECT as you complete them. \r\n\r\nTo create a new success criterion, use the LINK-TO-SUCCESS-CRITERIA-TEMPLATE"
                    }'

# Deployment and Environment Management
This GitHub Action allows users to extract deployments related to a specified `ref` and delete environments for those deployments.


Note that if you are planning on deleting a created environment, your `GITHUB_TOKEN` must have permissions with repo scope. The token provided by the workflow, `github.token` does not have the permissions to delete created environments. [delete environment](https://docs.github.com/en/rest/reference/repos#delete-an-environment)

## Inputs

| name                        | description                                                                             |           |  
| --------------------------- | --------------------------------------------------------------------------------------- |  ---- |
| `token`                     | GitHub token like `${{ github.token }}` or `${{ secrets.GITHUB_TOKEN }}`                | **required** |
| `repository`                | The Name of the environment to delete                                                   | **required** |
| `ref`                       |  The ref that will filter deployments by                                                | **required** |
| `delete_environments`       | Delete environments of the discovered deployments. Default `false`    | **optional**|

## Usage

### Lists Deployments and Deletes Environments from PR Ref
The example below will be triggered on a *PR closed* event.

- ✔️ Lists deployments
- ✔️ Delete deployment environment(s)

```yaml
name: Cleanup PR Deployments & Environments

on:
  pull_request:
    types: [closed]
    branches: main

jobs:
  delete:
    runs-on: ubuntu-latest
    steps:
    - name: Get and Delete Deployment Environments from PR
      id: environment_list
      uses: James-LeHa/EnvironmentName-Extractor@1.4
      with:
        ref: ${{ github.event.pull_request.head.ref }}
        repository: ${{ github.repository }}
        delete_environments: true
        token: ${{secrets.DEPLOYMENTS_MANAGEMENT}}
```
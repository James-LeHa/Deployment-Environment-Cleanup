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

## Outputs

| name                        | description                                                                             |  Example       |  
| --------------------------- | --------------------------------------------------------------------------------------- |  ---- |
| `environmentNameList`       | String list of *unique* environments from deployments         | `'environmentName1,environmentName2'` |
| `deploymentsFound`          | Boolean value whether or not any deployments were found for the ref                | `true` or `false` |

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
      uses: James-LeHa/EnvironmentName-Extractor@1.X
      with:
        ref: ${{ github.event.pull_request.head.ref }}
        repository: ${{ github.repository }}
        delete_environments: true
        token: ${{secrets.DEPLOYMENTS_MANAGEMENT}}
```

## Licensing Notice

```
MIT License

Copyright (c) 2021 James Le Ha

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
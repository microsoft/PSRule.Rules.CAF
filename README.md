# PSRule for Cloud Adoption Framework

A suite of rules to validate Azure resources against the Cloud Adoption Framework (CAF) using PSRule.

![ci-badge]

Features of PSRule for CAF include:

- [Ready to go](docs/features.md#ready-to-go) - Leverage configurable rules to validate Azure resources.
- [DevOps](docs/features.md#devops) - Validate resources and infrastructure code pre or post-deployment.
- [Cross-platform](docs/features.md#cross-platform) - Run on MacOS, Linux, and Windows.

## Support

This project uses GitHub Issues to track bugs and feature requests.
Please search the existing issues before filing new issues to avoid duplicates.

- For new issues, file your bug or feature request as a new [issue].
- For help, discussion, and support questions about using this project, join or start a [discussion].

If you have any problems with the [PSRule][engine] engine, please check the project GitHub [issues](https://github.com/Microsoft/PSRule/issues) page instead.

Support for this project/ product is limited to the resources listed above.

## Getting the modules

This project requires the `PSRule`, `PSRule.Rules.Azure` and `Az` PowerShell modules.
For details on each see [install].

You can download and install these modules from the PowerShell Gallery.

Module             | Description | Downloads / instructions
------             | ----------- | ------------------------
PSRule.Rules.CAF   | Validate Azure resources against the CAF. | [latest][module] / [instructions][install]

## Getting started

PSRule for CAF provides two methods for analyzing Azure resources:

- _Pre-flight_ - Before resources are deployed from Azure Resource Manager (ARM) templates.
- _In-flight_ - After resource are deployed to an Azure subscription.

For additional details see the [FAQ](docs/features.md#frequently-asked-questions-faq).

### Using with GitHub Actions

The following example shows how to setup Github Actions to validate templates pre-flight.

1. See [Creating a workflow file][create-workflow].
2. Reference `microsoft/ps-rule` with `modules: 'PSRule.Rules.CAF'`.
3. Create and configure `ps-rule.yaml` in the repository root directory.

Example workflow:

```yaml
# Example: .github/workflows/analyze-arm.yaml

#
# STEP 1: Template validation
#
name: Analyze templates
on:
- pull_request
jobs:
  analyze_arm:
    name: Analyze templates
    runs-on: ubuntu-latest
    steps:

    - name: Checkout
      uses: actions/checkout@v3

    # STEP 3: Run analysis against PSRule for Cloud Adoption Framework
    - name: Test Azure Infrastructure as Code
      uses: microsoft/ps-rule@v2.0.0
      with:
        modules: 'PSRule.Rules.CAF'
```

Example PSRule options:

```yaml
# Example: ps-rule.yaml

#
# PSRule configuration
#

# Please see the documentation for all configuration options:
# https://aka.ms/ps-rule/options

include:
  module:
  - PSRule.Rules.CAF

requires:
  PSRule.Rules.CAF: '>=0.3.0'

output:
  culture:
  - en-US

configuration:
  # Enable expansion for Bicep source files.
  AZURE_BICEP_FILE_EXPANSION: true

  # Enable expansion for template expansion.
  AZURE_PARAMETER_FILE_EXPANSION: true
```

### Using with Azure Pipelines

The following example shows how to setup Azure Pipelines to validate templates pre-flight.

1. Install [PSRule extension][extension] for Azure DevOps marketplace.
2. Create a new YAML pipeline with the _Starter pipeline_ template.
3. Add the `PSRule analysis` task.
   - Set `modules` to `PSRule.Rules.CAF`.
4. Create and configure `ps-rule.yaml` in the repository root directory.

Example pipeline:

```yaml
# Example: .pipelines/analyze-arm.yaml

#
# STEP 2: Template validation
#
jobs:
- job: 'analyze_arm'
  displayName: 'Analyze templates'
  pool:
    vmImage: 'ubuntu-20.04'
  steps:

  # STEP 3: Run analysis against PSRule for Cloud Adoption Framework
  - task: ps-rule-assert@1
    displayName: Test Azure Infrastructure as Code
    inputs:
      modules: 'PSRule.Rules.CAF'
```

Example PSRule options:

```yaml
# Example: ps-rule.yaml

#
# PSRule configuration
#

# Please see the documentation for all configuration options:
# https://aka.ms/ps-rule/options

include:
  module:
  - PSRule.Rules.CAF

requires:
  PSRule.Rules.CAF: '>=0.3.0'

output:
  culture:
  - en-US

configuration:
  # Enable expansion for Bicep source files.
  AZURE_BICEP_FILE_EXPANSION: true

  # Enable expansion for template expansion.
  AZURE_PARAMETER_FILE_EXPANSION: true
```

### Using locally

The following example shows how to setup PSRule locally to validate templates pre-flight.

1. Install the `PSRule.Rules.CAF` module and dependencies from the PowerShell Gallery.
2. Create and configure `ps-rule.yaml` in the repository root directory.
3. Run analysis against PSRule for Cloud Adoption Framework.

Example install command-line:

```powershell
# STEP 1: Install from the PowerShell Gallery
Install-Module -Name 'PSRule.Rules.CAF' -Scope CurrentUser -Repository PSGallery;
```

Example PSRule options:

```yaml
# Example: ps-rule.yaml

#
# PSRule configuration
#

# Please see the documentation for all configuration options:
# https://aka.ms/ps-rule/options

include:
  module:
  - PSRule.Rules.CAF

requires:
  PSRule.Rules.CAF: '>=0.3.0'

output:
  culture:
  - en-US

configuration:
  # Enable expansion for Bicep source files.
  AZURE_BICEP_FILE_EXPANSION: true

  # Enable expansion for template expansion.
  AZURE_PARAMETER_FILE_EXPANSION: true
```

Example test command-line:

```powershell
# STEP 3: Test Azure Infrastructure as Code
Assert-PSRule -Module 'PSRule.Rules.CAF' -Format File -InputPath '.';
```

### Troubleshooting expansion

A number of issues can occur when expanding Azure templates or Bicep source files.
Or you may not get any results at all if expansion is not configured.
See the following topics:

- [Expanding source files - limitations](https://azure.github.io/PSRule.Rules.Azure/expanding-source-files/#limitations)
- [Using template](https://azure.github.io/PSRule.Rules.Azure/using-templates/)
- [Using Bicep source](https://azure.github.io/PSRule.Rules.Azure/using-bicep/)

### Export in-flight resource data

The following example shows how to setup PSRule locally to validate resources running in a subscription.

1. Install the `PSRule.Rules.CAF` module and dependencies from the PowerShell Gallery.
2. Connect and set context to an Azure subscription from PowerShell.
3. Export the resource data with the `Export-AzRuleData` cmdlet.
4. Run analysis against exported data.

For example:

```powershell
# STEP 1: Install PSRule.Rules.CAF from the PowerShell Gallery
Install-Module -Name 'PSRule.Rules.CAF' -Scope CurrentUser;

# STEP 2: Authenticate to Azure, only required if not currently connected
Connect-AzAccount;

# Confirm the current subscription context
Get-AzContext;

# STEP 3: Exports a resource graph stored as JSON for analysis
Export-AzRuleData -OutputPath 'out/templates/';

# STEP 4: Run analysis against exported data
Assert-PSRule -Module 'PSRule.Rules.CAF' -InputPath 'out/templates/';
```

## Rule reference

For a list of rules included in the `PSRule.Rules.CAF` module see:

- [Module rule reference](docs/rules/en/module.md)

Rules included in this module define a number of configurable values that can be set on an as need basis.
By default these values use the standards defined by the CAF.
A list of configurable values are included in the reference for each rule.

## Language reference

### Commands

This module uses commands from the `PSRule.Rules.Azure` module to export resource configuration data.
The `PSRule.Rules.Azure` module is included as a dependency of `PSRule.Rules.CAF`.

For details of `PSRule.Rules.Azure` commands see:

- [Export-AzRuleData](https://github.com/Microsoft/PSRule.Rules.Azure/blob/main/docs/commands/PSRule.Rules.Azure/en-US/Export-AzRuleData.md) - Export resource configuration data from Azure subscriptions.
- [Export-AzTemplateRuleData](https://github.com/Microsoft/PSRule.Rules.Azure/blob/main/docs/commands/PSRule.Rules.Azure/en-US/Export-AzTemplateRuleData.md) - Export resource configuration data from Azure templates.

## Changes and versioning

Modules in this repository will use the [semantic versioning](http://semver.org/) model to declare breaking changes from v1.0.0.
Prior to v1.0.0, breaking changes may be introduced in minor (0.x.0) version increments.
For a list of module changes please see the [change log](CHANGELOG.md).

> Pre-release module versions are created on major commits and can be installed from the PowerShell Gallery.
> Pre-release versions should be considered experimental.
> Modules and change log details for pre-releases will be removed as standard releases are made available.

## Contributing

This project welcomes contributions and suggestions.
If you are ready to contribute, please visit the [contribution guide](CONTRIBUTING.md).

## Code of Conduct

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/)
or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Maintainers

- [Bernie White](https://github.com/BernieWhite)

## License

This project is [licensed under the MIT License](LICENSE).

[issue]: https://github.com/Microsoft/PSRule.Rules.CAF/issues
[discussion]: https://github.com/microsoft/PSRule.Rules.CAF/discussions
[install]: docs/install-instructions.md
[ci-badge]: https://dev.azure.com/bewhite/PSRule.Rules.CAF/_apis/build/status/PSRule.Rules.CAF-CI?branchName=main
[module]: https://www.powershellgallery.com/packages/PSRule.Rules.CAF
[engine]: https://github.com/Microsoft/PSRule
[chat]: https://gitter.im/PSRule/PSRule.Rules.CAF?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge
[chat-badge]: https://img.shields.io/static/v1.svg?label=chat&message=on%20gitter&color=informational&logo=gitter
[create-workflow]: https://help.github.com/en/articles/configuring-a-workflow#creating-a-workflow-file
[extension]: https://marketplace.visualstudio.com/items?itemName=bewhite.ps-rule

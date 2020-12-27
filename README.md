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

- For new issues, file your bug or feature request as a new [Issue].
- For help and questions about using this project, we have a Gitter room which you can join below.

[![Join the chat][chat-badge]][chat]

If you have any problems with the [PSRule][engine] engine, please check the project GitHub [issues](https://github.com/Microsoft/PSRule/issues) page instead.

Support for this project/ product is limited to the resources listed above.

## Getting the modules

This project requires the `PSRule`, `PSRule.Rules.Azure` and `Az` PowerShell modules. For details on each see [install].

You can download and install these modules from the PowerShell Gallery.

Module             | Description | Downloads / instructions
------             | ----------- | ------------------------
PSRule.Rules.CAF   | Validate Azure resources against the CAF. | [latest][module] / [instructions][install]

## Getting started

### Export resource data

To validate Azure resources running in a subscription, export the resource data with the `Export-AzRuleData` cmdlet.
The `Export-AzRuleData` cmdlet exports a resource graph for one or more subscriptions that can be used for analysis with the rules in this module.

By default, resources for the current subscription context are exported. See below for more options.

Before running this command you should connect to Azure by using the `Connect-AzAccount` cmdlet.

For example:

```powershell
# Authenticate to Azure, only required if not currently connected
Connect-AzAccount;

# Export resource data
Export-AzRuleData;
```

### Validate resources

To validate Azure resources use the extracted data with the `Invoke-PSRule` cmdlet.

For example:

```powershell
Invoke-PSRule -InputPath .\*.json -Module 'PSRule.Rules.CAF';
```

## Rule reference

For a list of rules included in the `PSRule.Rules.CAF` module see:

- [Module rule reference](docs/rules/en/module.md)

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
[install]: docs/install-instructions.md
[ci-badge]: https://dev.azure.com/bewhite/PSRule.Rules.CAF/_apis/build/status/PSRule.Rules.CAF-CI?branchName=main
[module]: https://www.powershellgallery.com/packages/PSRule.Rules.CAF
[engine]: https://github.com/Microsoft/PSRule
[chat]: https://gitter.im/PSRule/PSRule.Rules.CAF?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge
[chat-badge]: https://img.shields.io/static/v1.svg?label=chat&message=on%20gitter&color=informational&logo=gitter

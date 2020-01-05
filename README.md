# PSRule for Cloud Adoption Framework

A suite of rules to validate Azure resources against the Cloud Adoption Framework (CAF) using PSRule.

![ci-badge]

**More to come soon.**

## Disclaimer

This project is to be considered a **proof-of-concept** and **not a supported product**.

For issues with rules and documentation please check our GitHub [issues](https://github.com/Microsoft/PSRule.Rules.CAF/issues) page.
If you do not see your problem captured, please file a new issue and follow the provided template.

If you have any problems with the [PSRule][engine] engine, please check the project GitHub [issues](https://github.com/Microsoft/PSRule/issues) page instead.

## Rule reference

For a list of rules included in the `PSRule.Rules.CAF` module see:

- [Module rule reference](docs/rules/en/module.md)

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

[install]: docs/scenarios/install-instructions.md
[ci-badge]: https://dev.azure.com/bewhite/PSRule.Rules.CAF/_apis/build/status/PSRule.Rules.CAF-CI?branchName=master
[module]: https://www.powershellgallery.com/packages/PSRule.Rules.CAF
[engine]: https://github.com/Microsoft/PSRule

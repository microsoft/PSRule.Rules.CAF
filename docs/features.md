# PSRule for Cloud Adoption Framework features

The following sections describe key features of PSRule for Cloud Adoption Framework (CAF).

- [Ready to go](#ready-to-go)
- [DevOps](#devops)
- [Cross-platform](#cross-platform)

## Ready to go

The CAF is a set of opinionated recommendations for implementing Azure that can scale to large organizations.
PSRule for CAF provides rules to validate resources and infrastructure as code (IaC) against these recommendations.
Currently PSRule for CAF includes rules for:

- [Recommended naming and tagging conventions][caf-naming-guidance]

Use the built-in rules to start enforcing release processes quickly.
Configure built-in rules to align to organization requirements.
Then layer on your own rules as your organization's requirements mature.
Custom rules can be implemented quickly and work side-by-side with built-in rules.

As new built-in rules are added and improved, download the latest PowerShell module to start using them.

## DevOps

Azure resources can be validated throughout their lifecycle to support a DevOps culture.

From as early as authoring a Azure Resource Manager (ARM) template, resources can be validated offline.
Pre-flight validation can be integrated into a continuous integration (CI) processes to:

- **Shift-left:** Identify configuration issues and provide fast feedback in pull requests.
- **Add quality gates:** Implement quality gates between environments such as development, test and production.
- **Monitor continuously:** Perform ongoing checks for configuration optimization opportunities.

## Cross-platform

PSRule uses modern PowerShell libraries at its core, allowing it to go anywhere PowerShell can go.
PSRule runs on MacOS, Linux and Windows.

To install PSRule for CAF use the `Install-Module` cmdlet within PowerShell.

```powershell
Install-Module -Name PSRule.Rules.CAF -Scope CurrentUser;
```

For additional installation options see [install instructions](install-instructions.md).

## Frequently Asked Questions (FAQ)

Continue reading for FAQ relating to _PSRule for CAF_.
For general FAQ see [PSRule - Frequently Asked Questions (FAQ)][ps-rule-faq], including:

- [How is PSRule different to Pester?][compare-pester]
- [How do I configure PSRule?][ps-rule-configure]
- [How do I ignore a rule?][ignore-rule]

### What permissions do I need to export and analyze data?

PSRule for CAF uses cmdlets from the _PSRule.Rules.Azure_ module.
To export rule data from an Azure subscription the built-in _Reader_ role is required.
For additional details see the [PSRule for Azure FAQ].

No access to Azure is required after data has been exported to JSON.

### Traditional unit testing vs PSRule for CAF?

You may already be using a unit test framework such as Pester to test infrastructure code.
If you are, then you may have encountered the following challenges.

For a general PSRule/ Pester comparison see [How is PSRule different to Pester?][compare-pester]

#### Unit testing more than basic JSON structure

Unit tests are unable to effectively test resources contained within Azure templates.
Templates should be reusable, but this creates problems for testing when functions, conditions and copy loops are used.
Template parameters could completely change the type, number of, or configuration of resources.

PSRule resolves templates to allow analysis of the resources that would be deployed based on provided parameters.

#### Standard library of tests

When building unit tests for Azure resources, starting with an empty repository can be a daunting experience.
While there are several open source repositories and samples around to get you started, you need to integrate these yourself.

_PSRule for CAF_ is distributed as a PowerShell module using the PowerShell Gallery.
Using a PowerShell module makes it easy to install and update.
The built-in rules allow you starting testing resources quickly, with minimal integration.

[compare-pester]: https://github.com/microsoft/PSRule/blob/main/docs/features.md#how-is-psrule-different-to-pester
[ignore-rule]: https://github.com/microsoft/PSRule/blob/main/docs/features.md#how-do-i-ignore-a-rule
[ps-rule-configure]: https://github.com/microsoft/PSRule/blob/main/docs/features.md#how-do-i-configure-psrule
[ps-rule-faq]: https://github.com/microsoft/PSRule/blob/main/docs/features.md#frequently-asked-questions-faq
[caf-naming-guidance]: https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging
[PSRule for Azure FAQ]: https://github.com/microsoft/PSRule.Rules.Azure/blob/main/docs/features.md#frequently-asked-questions-faq

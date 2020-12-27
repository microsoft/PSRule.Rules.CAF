# PSRule for Cloud Adoption Framework features

The following sections describe key features of PSRule for Cloud Adoption Framework (CAF).

- [Ready to go](#ready-to-go)
- [DevOps](#devops)
- [Cross-platform](#cross-platform)

## Ready to go

PSRule for CAF includes rules for validating resources against CAF recommendations.
Each rule includes additional information to help remediate issues.

Use the built-in rules to start enforcing release processes quickly.
Rules can be configured to customize the implementation for your organization.
Custom rules can be implemented quickly and work side-by-side with built-in rules.

As new built-in rules are added and improved, download the latest PowerShell module to start using them.

## DevOps

Azure resources can be validated throughout their lifecycle to support a DevOps culture.

From as early as authoring an Azure Resource Manager (ARM) template, resources can be validated offline.
Pre-flight validation can be integrated into a continuous integration (CI) pipeline to:

- **Shift-left:** Identify configuration issues and provide fast feedback in pull requests.
- **Quality gates:** Implement quality gates between environments such as development, test, and production.
- **Monitor continuously:** Perform ongoing checks for configuration optimization opportunities.

## Cross-platform

PSRule uses modern PowerShell libraries at its core, allowing it to go anywhere PowerShell can go.
The companion extension for Visual Studio Code provides snippets for authoring rules and documentation.
PSRule runs on MacOS, Linux and Windows.

PowerShell makes it easy to integrate PSRule into popular CI systems.
Additionally, PSRule has extensions for:

- [Azure Pipeline (Azure DevOps)][extension-pipelines]
- [GitHub Actions (GitHub)][extension-github]

PSRule for CAF (`PSRule.Rules.CAF`) can be installed locally, within a container, or Azure Cloud Shell.
To install, use the `Install-Module` cmdlet within PowerShell.
For installation options see [install instructions](install-instructions.md).

## Frequently Asked Questions (FAQ)

Continue reading for FAQ relating to _PSRule for CAF_.
For general FAQ see [PSRule - Frequently Asked Questions (FAQ)][ps-rule-faq], including:

- [How is PSRule different to Pester?][compare-pester]
- [How do I configure PSRule?][ps-rule-configure]
- [How do I ignore a rule?][ignore-rule]

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
[extension-pipelines]: https://marketplace.visualstudio.com/items?itemName=bewhite.ps-rule
[extension-github]: https://github.com/marketplace/actions/psrule

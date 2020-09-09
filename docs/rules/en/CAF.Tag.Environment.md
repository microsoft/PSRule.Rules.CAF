---
pillar: Operational Excellence
category: Tagging and resource naming
online version: https://github.com/microsoft/PSRule.Rules.CAF/blob/main/docs/rules/en/CAF.Tag.Environment.md
---

# Use standard environments

## SYNOPSIS

Tag resources and resource groups with a valid environment.

## DESCRIPTION

Resources and resource groups pass when they have an environment tag set to one of the valid environments.
If the environment tag is not set, the resource or resource group is skipped.
The rule will fail when the environment tag is set, but doesn't match a valid environment.

By default, this rule uses the `Env` tag and accepts `Prod`, `Dev`, `QA`, `Stage`, `Test` as valid environments.

## RECOMMENDATION

Consider updating the environment tag on the resource or resource group to a valid environment.
Additionally consider enforcing tag values with Azure Policy.

## NOTES

To configure this rule:

- Override `CAF_EnvironmentTag` with the name of the environment tag.
- Override `CAF_Environments` with an array of valid environments.

## LINKS

- [Metadata tags](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging#metadata-tags)
- [Use tags to organize your Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources)
- [Azure Well-Architected Framework](https://docs.microsoft.com/en-gb/azure/architecture/framework/devops/app-design#tagging-and-resource-naming)
- [Tag support for Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/tag-support)

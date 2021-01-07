---
pillar: Operational Excellence
category: Resource naming
online version: https://github.com/microsoft/PSRule.Rules.CAF/blob/main/docs/rules/en/CAF.Name.RG.md
---

# Use standard resource group names

## SYNOPSIS

Resource group names should use a standard prefix.

## DESCRIPTION

An effective naming convention allows operators to quickly identify resource type, associated workload,
deployment environment and Azure region.

For resource groups, the Cloud Adoption Framework recommends using the `rg-` prefix.

Requirements for Resource Group names:

- At least 1 character, but no more than 90.
- Can include alphanumeric, underscore, parentheses, hyphen, period (except at end).
- Resource group names must be unique within a subscription.

## RECOMMENDATION

Consider creating resource groups with a standard name.
Additionally consider using Azure Policy to only permit creation using a standard naming convention.

## NOTES

This rule does not check if the resource group name is unique.

To configure this rule:

- Override the `CAF_ResourceGroupPrefix` configuration value with an array of allowed prefixes.

## LINKS

- [Recommended abbreviations for Azure resource types](https://docs.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
- [Azure Well-Architected Framework](https://docs.microsoft.com/en-gb/azure/architecture/framework/devops/app-design#tagging-and-resource-naming)
- [Naming rules and restrictions for Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules)

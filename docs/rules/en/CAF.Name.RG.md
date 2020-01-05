---
category: Naming
online version: https://github.com/microsoft/PSRule.Rules.CAF/blob/master/docs/rules/en/CAF.Name.RG.md
---

# Use standard resource group names

## SYNOPSIS

Resource group names should use a standard prefix and meet naming requirements.

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

- [Recommended naming and tagging conventions](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging)

---
pillar: Operational Excellence
category: Tagging and resource naming
online version: https://github.com/microsoft/PSRule.Rules.CAF/blob/main/docs/rules/en/CAF.Name.NSG.md
---

# Use standard NSG names

## SYNOPSIS

Network security group (NSG) names should use a standard prefix and meet naming requirements.

## DESCRIPTION

An effective naming convention allows operators to quickly identify resource type, associated workload,
deployment environment and Azure region.

For NSGs, the Cloud Adoption Framework recommends using the `nsg-` prefix.

Requirements for NSG names:

- At least 1 character, but no more than 80.
- Can include alphanumeric, underscore, hyphen, period characters.
- Can only start with a letter or number, and end with a letter, number or underscore.
- NSG names must be unique within a resource group.

## RECOMMENDATION

Consider creating NSGs with a standard name.
Additionally consider using Azure Policy to only permit creation using a standard naming convention.

## NOTES

This rule does not check if NSG names are unique.

To configure this rule:

- Override the `CAF_NetworkSecurityGroupPrefix` configuration value with an array of allowed prefixes.

## LINKS

- [Recommended naming and tagging conventions](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging)

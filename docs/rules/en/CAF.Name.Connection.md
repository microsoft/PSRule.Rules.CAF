---
pillar: Operational Excellence
category: Resource naming
online version: https://github.com/microsoft/PSRule.Rules.CAF/blob/main/docs/rules/en/CAF.Name.Connection.md
---

# Use standard connection names

## SYNOPSIS

Virtual network gateway connection names should use a standard prefix.

## DESCRIPTION

An effective naming convention allows operators to quickly identify resource type, associated workload,
deployment environment and Azure region.

For virtual network gateway connections, the Cloud Adoption Framework recommends using the `cn-` prefix.

Requirements for virtual network gateway connection names:

- At least 1 character, but no more than 80.
- Can include alphanumeric, underscore, hyphen, period characters.
- Can only start with a letter or number, and end with a letter, number or underscore.
- Connection names must be unique within a resource group.

## RECOMMENDATION

Consider creating virtual network gateway connections with a standard name.
Additionally consider using Azure Policy to only permit creation using a standard naming convention.

## NOTES

This rule does not check if virtual network gateway connection names are unique.

To configure this rule:

- Override the `CAF_GatewayConnectionPrefix` configuration value with an array of allowed prefixes.
- Override `CAF_UseLowerNames` with `false` to allow mixed case in resource names.
By default only lower-case letters and other supported characters are allowed.
This option affects all resource name rules.

## LINKS

- [Recommended abbreviations for Azure resource types](https://docs.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
- [Azure Well-Architected Framework](https://docs.microsoft.com/azure/architecture/framework/devops/app-design#tagging-and-resource-naming)
- [Naming rules and restrictions for Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules)

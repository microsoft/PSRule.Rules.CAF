---
pillar: Operational Excellence
category: Resource naming
online version: https://github.com/microsoft/PSRule.Rules.CAF/blob/main/docs/rules/en/CAF.Name.VNG.md
---

# Use standard virtual network gateway names

## SYNOPSIS

Virtual network gateway names should use a standard prefix.

## DESCRIPTION

An effective naming convention allows operators to quickly identify resource type, associated workload,
deployment environment and Azure region.

For virtual network gateways, the Cloud Adoption Framework recommends using the `vgw-` prefix.

Requirements for virtual network gateway names:

- At least 1 character, but no more than 80.
- Can include alphanumeric, underscore, hyphen, period characters.
- Can only start with a letter or number, and end with a letter, number or underscore.
- Virtual network gateway names must be unique within a resource group.

## RECOMMENDATION

Consider creating virtual network gateways with a standard name.
Additionally consider using Azure Policy to only permit creation using a standard naming convention.

## NOTES

This rule does not check if virtual network gateway names are unique.

To configure this rule:

- Override the `CAF_VirtualNetworkGatewayPrefix` configuration value with an array of allowed prefixes.

## LINKS

- [Recommended abbreviations for Azure resource types](https://docs.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
- [Azure Well-Architected Framework](https://docs.microsoft.com/en-gb/azure/architecture/framework/devops/app-design#tagging-and-resource-naming)
- [Naming rules and restrictions for Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules)

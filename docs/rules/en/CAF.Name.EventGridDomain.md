---
pillar: Operational Excellence
category: Resource naming
online version: https://github.com/microsoft/PSRule.Rules.CAF/blob/main/docs/rules/en/CAF.Name.EventGridDomain.md
---

# Use standard EventGrid domain names

## SYNOPSIS

EventGrid domain names should use a standard prefix.

## DESCRIPTION

An effective naming convention allows operators to quickly identify resource type, associated workload,
deployment environment and Azure region.

For EventGrid domains, the Cloud Adoption Framework recommends using the `evgd-` prefix.

Requirements for EventGrid domain names:

- At least 3 character, but no more than 50.
- Can include alphanumeric, and hyphen characters.
- EventGrid domains must be unique within a resource group.

## RECOMMENDATION

Consider creating EventGrid domains with a standard name.
Additionally consider using Azure Policy to only permit creation using a standard naming convention.

## NOTES

This rule does not check if EventGrid domain names are unique.

To configure this rule:

- Override the `CAF_EventGridDomain` configuration value with an array of allowed prefixes.
- Override `CAF_UseLowerNames` with `false` to allow mixed case in resource names.
By default only lower-case letters and other supported characters are allowed.
This option affects all resource name rules.

## LINKS

- [Recommended abbreviations for Azure resource types](https://docs.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
- [Azure Well-Architected Framework](https://docs.microsoft.com/azure/architecture/framework/devops/app-design#tagging-and-resource-naming)
- [Naming rules and restrictions for Azure resources](https://docs.microsoft.com/azure/azure-resource-manager/management/resource-name-rules)
- [Azure template reference](https://docs.microsoft.com/azure/templates/microsoft.eventgrid/domains)

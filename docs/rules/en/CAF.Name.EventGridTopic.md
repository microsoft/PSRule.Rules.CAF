---
pillar: Operational Excellence
category: Resource naming
online version: https://github.com/microsoft/PSRule.Rules.CAF/blob/main/docs/rules/en/CAF.Name.EventGridTopic.md
---

# Use standard EventGrid topic names

## SYNOPSIS

EventGrid topic names should use a standard prefix.

## DESCRIPTION

An effective naming convention allows operators to quickly identify resource type, associated workload,
deployment environment and Azure region.

For EventGrid topics, the Cloud Adoption Framework recommends using the `evgt-` prefix.

Requirements for EventGrid topic names:

- At least 3 character, but no more than 50.
- Can include alphanumeric, and hyphen characters.
- EventGrid topics must be unique within a resource group.

## RECOMMENDATION

Consider creating EventGrid topics with a standard name.
Additionally consider using Azure Policy to only permit creation using a standard naming convention.

## NOTES

This rule does not check if EventGrid topics names are unique.

To configure this rule:

- Override the `CAF_EventGridTopic` configuration value with an array of allowed prefixes.
- Override `CAF_UseLowerNames` with `false` to allow mixed case in resource names.
By default only lower-case letters and other supported characters are allowed.
This option affects all resource name rules.

## LINKS

- [Recommended abbreviations for Azure resource types](https://docs.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
- [Azure Well-Architected Framework](https://docs.microsoft.com/azure/architecture/framework/devops/app-design#tagging-and-resource-naming)
- [Naming rules and restrictions for Azure resources](https://docs.microsoft.com/azure/azure-resource-manager/management/resource-name-rules)
- [Azure template reference](https://docs.microsoft.com/azure/templates/microsoft.eventgrid/topics)

---
pillar: Operational Excellence
category: Resource naming
online version: https://github.com/microsoft/PSRule.Rules.CAF/blob/main/docs/rules/en/CAF.Name.Storage.md
---

# Use standard storage account names

## SYNOPSIS

Storage account names should use a standard prefix.

## DESCRIPTION

An effective naming convention allows operators to quickly identify resource type, associated workload,
deployment environment and Azure region.

For storage accounts, the Cloud Adoption Framework recommends using the `st`, `stvm`, and `dls` prefix.
Use of different prefixes depends on the intended usage of the storage account.

Requirements for storage account names:

- At least 3 characters, but no more than 24.
- Can include alphanumeric characters only.
- Storage account names must be global unique, because they directly relate to a DNS host name.

## RECOMMENDATION

Consider creating storage accounts with a standard name.
Additionally consider using Azure Policy to only permit creation using a standard naming convention.

## NOTES

This rule does not check if storage account names are unique.

To configure this rule:

- Override the `CAF_StoragePrefix` configuration value with an array of allowed prefixes.
- Override `CAF_UseLowerNames` with `false` to allow mixed case in resource names.
By default only lower-case letters and other supported characters are allowed.
This option affects all resource name rules.

## LINKS

- [Recommended abbreviations for Azure resource types](https://docs.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations)
- [Azure Well-Architected Framework](https://docs.microsoft.com/en-gb/azure/architecture/framework/devops/app-design#tagging-and-resource-naming)
- [Naming rules and restrictions for Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules)

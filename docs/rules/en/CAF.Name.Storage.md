---
category: Naming
online version: https://github.com/microsoft/PSRule.Rules.CAF/blob/main/docs/rules/en/CAF.Name.Storage.md
---

# Use standard storage account names

## SYNOPSIS

Storage account names should use a standard prefix and meet naming requirements.

## DESCRIPTION

An effective naming convention allows operators to quickly identify resource type, associated workload,
deployment environment and Azure region.

For storage accounts, the Cloud Adoption Framework recommends using the `stor`, `stvm` and `dls` prefix.
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

## LINKS

- [Recommended naming and tagging conventions](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging)

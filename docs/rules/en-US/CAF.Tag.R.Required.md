---
online version: https://github.com/microsoft/PSRule.Rules.CAF/blob/master/docs/rules/en-US/CAF.Tag.R.Required.md
---

# Use mandatory tags

## SYNOPSIS

Tag resources with mandatory tags.

## DESCRIPTION

Metadata tags store additional information about the resource.
When used consistently, metadata tags can be used to identify resources for searching and reporting.

Additionally tags can store information useful to automated tasks.
Some examples include; de-provisioning, scaling and patching

Resources pass when they have the required tags.
If any of the tags are missing, this rule fails.
Resources that do not support tags are skipped.

By default, no mandatory tags are configured.

## RECOMMENDATION

Consider updating the resource with the required tags.
Additionally consider enforcing mandatory tags with Azure Policy.

## NOTES

A separate rule exists for resource groups.

To configure this rule.
Override the `CAF_ResourceMandatoryTags` configuration value with an array of required tags.

## LINKS

- [Metadata tags](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging#metadata-tags)
- [Use tags to organize your Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources)

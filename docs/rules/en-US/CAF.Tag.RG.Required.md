---
category: Tagging
online version: https://github.com/microsoft/PSRule.Rules.CAF/blob/master/docs/rules/en-US/CAF.Tag.RG.Required.md
---

# Use mandatory tags

## SYNOPSIS

Tag resource groups with mandatory tags.

## DESCRIPTION

Metadata tags store additional information about the resource group.
When used consistently, metadata tags can be used to identify resource groups for searching and reporting.

Additionally tags can store information useful to automated tasks.
Some examples include; de-provisioning, scaling and patching

Resource groups pass when they have the required tags.
If any of the tags are missing, this rule fails.

By default, no mandatory tags are configured.

## RECOMMENDATION

Consider updating the resource with the required tags.
Additionally consider enforcing mandatory tags for Azure Policy.

## NOTES

A separate rule exists for resources.

To configure this rule.
Override the `CAF_ResourceGroupMandatoryTags` configuration value with an array of required tags.

## LINKS

- [Metadata tags](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging#metadata-tags)
- [Use tags to organize your Azure resources](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources)

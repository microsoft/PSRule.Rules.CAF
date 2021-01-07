---
pillar: Cost Optimization
category: Metadata tagging
online version: https://github.com/microsoft/PSRule.Rules.CAF/blob/main/docs/rules/en/CAF.Tag.Required.md
---

# Tag resources

## SYNOPSIS

Tag resources with mandatory tags.

## DESCRIPTION

Metadata tags store additional information about resources.
Each tags is a key value pair, with a tag name and tag value.
When used consistently, metadata tags can be used to identify resources for searching and reporting.
Up to 50 tags can be set on most resource types (see [Tag support for Azure resources]).

Additionally tags can store information useful to automated tasks.
Some examples include; de-provisioning, scaling, and patching.

## RECOMMENDATION

Consider tagging the resources with the mandatory tags.
Additionally consider enforcing mandatory tags and using inheritance with Azure Policy.

## NOTES

Resources pass when they have the required tags.
If any of the tags are missing, this rule fails.
Resources that do not support tags are skipped.
By default:

- No mandatory tags are configured.
- Tag names are case-sensitive.

To configure this rule:

- Override the `CAF_ResourceMandatoryTags` configuration value with an array of required tags.

## LINKS

- [Define your tagging strategy](https://docs.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-tagging)
- [Use tags to organize your Azure resources](https://docs.microsoft.com/azure/azure-resource-manager/management/tag-resources)
- [Azure Well-Architected Framework](https://docs.microsoft.com/azure/architecture/framework/cost/design-governance#enforce-resource-tagging)
- [Tag support for Azure resources]

[Tag support for Azure resources]: https://docs.microsoft.com/azure/azure-resource-manager/management/tag-support

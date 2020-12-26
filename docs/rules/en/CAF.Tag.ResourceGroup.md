---
pillar: Cost Optimization
category: Metadata tagging
online version: https://github.com/microsoft/PSRule.Rules.CAF/blob/main/docs/rules/en/CAF.Tag.ResourceGroup.md
---

# Tag resource groups

## SYNOPSIS

Tag resource groups with mandatory tags.

## DESCRIPTION

Metadata tags store additional information about resource groups.
Each tags is a key value pair, with a tag name and tag value.
When used consistently, metadata tags can be used to identify resource groups for searching and reporting.
Up to 50 tags can be set on each resource group.

Additionally tags can store information useful to automated tasks.
Some examples include; de-provisioning, scaling, and patching.

## RECOMMENDATION

Consider tagging resource group with the mandatory tags.
Additionally consider enforcing mandatory tags with Azure Policy.

## NOTES

Resources group pass when they have the required tags.
If any of the tags are missing, this rule fails.
By default:

- No mandatory tags are configured.
- Tag names are case-sensitive.

To configure this rule:

- Override the `CAF_ResourceGroupMandatoryTags` configuration value with an array of required tags.

## LINKS

- [Metadata tags](https://docs.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-tagging)
- [Use tags to organize your Azure resources](https://docs.microsoft.com/azure/azure-resource-manager/management/tag-resources)
- [Azure Well-Architected Framework](https://docs.microsoft.com/azure/architecture/framework/cost/design-governance#enforce-resource-tagging)
- [Tag support for Azure resources](https://docs.microsoft.com/azure/azure-resource-manager/management/tag-support)

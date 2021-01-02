# Change log

## Unreleased

What's changed since pre-release v0.1.0-B2101004:

- Engineering:
  - Bump PSRule dependency to v1.0.1. [#49](https://github.com/microsoft/PSRule.Rules.CAF/issues/49)
  - Bump PSRule.Rules.Azure dependency to v0.19.0. [#49](https://github.com/microsoft/PSRule.Rules.CAF/issues/49)

## v0.1.0-B2101004 (pre-release)

What's changed since pre-release v0.1.0-B2012004:

- Bug fixes:
  - Fixed use of lower case `Tags` resource property. [#43](https://github.com/microsoft/PSRule.Rules.CAF/issues/43)

## v0.1.0-B2012004 (pre-release)

What's changed since pre-release v0.1.0-B2009009:

- General improvements:
  - Resource name rules are case-sensitive by default. [#36](https://github.com/microsoft/PSRule.Rules.CAF/issues/36)
  - Resource and resource group tagging rules are case-sensitive by default. [#35](https://github.com/microsoft/PSRule.Rules.CAF/issues/35)
  - **Breaking change**: Separated resource and resource group tagging rules. [#38](https://github.com/microsoft/PSRule.Rules.CAF/issues/38)
    - Renamed `CAF.Tag.Required` to `CAF.Tag.Resource`.
    - Moved resource group tagging requirements from `CAF.Tag.Resource` to `CAF.Tag.ResourceGroup`.
- Engineering:
  - Bump PSRule dependency to v1.0.0. [#37](https://github.com/microsoft/PSRule.Rules.CAF/issues/37)

## v0.1.0-B2009009 (pre-release)

What's changed since pre-release v0.1.0-B2008005:

- General improvements:
  - Updated rule content to align with Microsoft Azure Well-Architected Framework pillars. [#23](https://github.com/microsoft/PSRule.Rules.CAF/issues/23)
  - Updated naming rules to check for recommended naming prefixes. [#29](https://github.com/microsoft/PSRule.Rules.CAF/issues/29)
    - Checks to determine if a resource name is valid are available in `PSRule.Rules.Azure`.
- Engineering:
  - Bump PSRule dependency to v0.20.0. [#24](https://github.com/microsoft/PSRule.Rules.CAF/issues/24)
- Bug fixes:
  - Fixed Storage Account `st` prefix. [#28](https://github.com/microsoft/PSRule.Rules.CAF/issues/28)
  - Fixed Virtual Network Gateway `vgw-` prefix. [#30](https://github.com/microsoft/PSRule.Rules.CAF/issues/30)
  - Fixed Virtual Machine `vm` prefix. [#31](https://github.com/microsoft/PSRule.Rules.CAF/issues/31)
  - Fixed Load Balancer `lbe-` and `lbi-` prefixes. [#32](https://github.com/microsoft/PSRule.Rules.CAF/issues/32)
  - Fixed exclude `AzureFirewallSubnet` from `CAF.Name.Subnet`. [#27](https://github.com/microsoft/PSRule.Rules.CAF/issues/27)

## v0.1.0-B2008005 (pre-release)

What's changed since pre-release v0.1.0-B2001009:

- Bug fixes:
  - Fixed coexistence with PSRule.Rules.Azure. [#20](https://github.com/microsoft/PSRule.Rules.CAF/issues/20)

## v0.1.0-B2001009 (pre-release)

- Initial pre-release.

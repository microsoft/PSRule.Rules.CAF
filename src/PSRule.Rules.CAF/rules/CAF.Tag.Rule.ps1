# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Note:
# This contains rules for standard tagging suggested in the CAF.
# https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging

# Synopsis: Tag resources and resource groups with mandatory tags
Rule 'CAF.Tag.Required' -If { (SupportsTags) } {
    # Use resource or resource group mandatory tags
    $required = $Configuration.GetStringValues('CAF_ResourceMandatoryTags')
    if ($PSRule.TargetType -eq 'Microsoft.Resources/resourceGroups') {
        $required = $Configuration.GetStringValues('CAF_ResourceGroupMandatoryTags')
    }
    # Check mandatory tags
    if ($required.Length -eq 0) {
        return $True
    }
    else {
        Exists 'Tags'
        if ($Null -ne $TargetObject.Tags) {
            $TargetObject.Tags | Exists $required -All
        }
    }
}

# Synopsis: Use standard environment tag values
Rule 'CAF.Tag.Environment' -If { (SupportsTags) -and (Exists "Tags.$($Configuration.CAF_EnvironmentTag)") } {
    Within "Tags.$($Configuration.CAF_EnvironmentTag)" $Configuration.CAF_Environments
}

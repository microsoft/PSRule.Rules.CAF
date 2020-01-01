# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Note:
# This contains rules for standard tagging suggested in the CAF.
# https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging

# Synopsis: Tag resources with mandatory tags
Rule 'CAF.Tag.R.Required' -If { (SupportsTags) -and !(IsResourceGroup) } {
    $required = $Configuration.GetStringValues('CAF_ResourceMandatoryTags')
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

# Synopsis: Tag resource groups with mandatory tags
Rule 'CAF.Tag.RG.Required' -If { (IsResourceGroup) } {
    $required = $Configuration.GetStringValues('CAF_ResourceGroupMandatoryTags')
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

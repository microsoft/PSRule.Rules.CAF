# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Note:
# This contains rules for standard tagging suggested in the CAF.
# https://docs.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging

# Synopsis: Tag resources with mandatory tags.
Rule 'CAF.Tag.Resource' -If { (CAF_SupportsTags) -and !(CAF_IsResourceGroup) -and ($Configuration.GetStringValues('CAF_ResourceMandatoryTags').Length -gt 0) } {
    $required = $Configuration.GetStringValues('CAF_ResourceMandatoryTags')
    if ($required.Length -eq 0) {
        return $Assert.Pass();
    }
    $Assert.HasField($TargetObject, 'tags');
    if ($Null -ne $TargetObject.Tags) {
        $Assert.HasFields($TargetObject.Tags, $required, $Configuration.CAF_MatchTagNameCase);
    }
}

# Synopsis: Tag resource groups with mandatory tags.
Rule 'CAF.Tag.ResourceGroup' -Type 'Microsoft.Resources/resourceGroups' -If { ($Configuration.GetStringValues('CAF_ResourceGroupMandatoryTags').Length -gt 0) } {
    $required = $Configuration.GetStringValues('CAF_ResourceGroupMandatoryTags');
    if ($required.Length -eq 0) {
        return $Assert.Pass();
    }
    $Assert.HasField($TargetObject, 'tags');
    if ($Null -ne $TargetObject.Tags) {
        $Assert.HasFields($TargetObject.Tags, $required, $Configuration.CAF_MatchTagNameCase);
    }
}

# Synopsis: Tag resources and resource groups with a valid environment.
Rule 'CAF.Tag.Environment' -If { (CAF_SupportsTags) -and (Exists "tags.$($Configuration.CAF_EnvironmentTag)") } {
    $Assert.HasField($TargetObject, 'tags');
    if ($Null -ne $TargetObject.Tags) {
        $Assert.HasField($TargetObject.Tags, $Configuration.CAF_EnvironmentTag, $Configuration.CAF_MatchTagNameCase);
        $Assert.In($TargetObject.Tags, $Configuration.CAF_EnvironmentTag, $Configuration.CAF_Environments, $Configuration.CAF_MatchTagValueCase);
    }
}

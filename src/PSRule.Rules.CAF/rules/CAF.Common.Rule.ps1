# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Determines if the object supports tags
function global:SupportsTags {
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param ()
    process {
        if (
            ($PSRule.TargetType -eq 'Microsoft.Subscription') -or
            ($PSRule.TargetType -like 'Microsoft.Authorization/*') -or
            ($PSRule.TargetType -like 'Microsoft.Billing/*') -or
            ($PSRule.TargetType -like 'Microsoft.Classic*') -or
            ($PSRule.TargetType -like 'Microsoft.Consumption/*') -or
            ($PSRule.TargetType -like 'Microsoft.Gallery/*') -or
            ($PSRule.TargetType -like 'Microsoft.Security/*') -or
            ($PSRule.TargetType -like 'microsoft.support/*') -or
            ($PSRule.TargetType -like 'Microsoft.WorkloadMonitor/*') -or
            ($PSRule.TargetType -like '*/providers/roleAssignments') -or

            # Exclude sub-resources by default
            ($PSRule.TargetType -like 'Microsoft.*/*/*' -and !(
                $PSRule.TargetType -eq 'Microsoft.Automation/automationAccounts/runbooks' -or
                $PSRule.TargetType -eq 'Microsoft.Automation/automationAccounts/configurations' -or
                $PSRule.TargetType -eq 'Microsoft.Automation/automationAccounts/compilationjobs' -or
                $PSRule.TargetType -eq 'Microsoft.Automation/automationAccounts/modules' -or
                $PSRule.TargetType -eq 'Microsoft.Automation/automationAccounts/nodeConfigurations' -or
                $PSRule.TargetType -eq 'Microsoft.Automation/automationAccounts/python2Packages' -or
                $PSRule.TargetType -eq 'Microsoft.Automation/automationAccounts/watchers'
            )) -or

            # Some exception to resources (https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/tag-support#microsoftresources)
            ($PSRule.TargetType -like 'Microsoft.Resources/*' -and !(
                $PSRule.TargetType -eq 'Microsoft.Resources/deployments' -or
                $PSRule.TargetType -eq 'Microsoft.Resources/deploymentScripts' -or
                $PSRule.TargetType -eq 'Microsoft.Resources/resourceGroups'
            ))
        ) {
            return $False;
        }
        return $True;
    }
}

# Determines of the object is a Resource Group
function global:IsResourceGroup {
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param ()
    process {
        return $PSRule.TargetType -eq 'Microsoft.Resources/resourceGroups';
    }
}

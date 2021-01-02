# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# Unit tests for CAF name rules
#

[CmdletBinding()]
param ()

# Setup error handling
$ErrorActionPreference = 'Stop';
Set-StrictMode -Version latest;

if ($Env:SYSTEM_DEBUG -eq 'true') {
    $VerbosePreference = 'Continue';
}

# Setup tests paths
$rootPath = $PWD;
Import-Module (Join-Path -Path $rootPath -ChildPath out/modules/PSRule.Rules.CAF) -Force;

Describe 'CAF.Name' -Tag 'name' {
    $invokeParams = @{
        Module = 'PSRule.Rules.CAF'
        WarningAction = 'Ignore'
        ErrorAction = 'Stop'
    }

    Context 'CAF.Name.RG' {
        $validNames = @(
            'rg-test-001'
        )
        $invalidNames = @(
            'rg-Test-001'
            'rgtest001'
            'test-rg-001'
        )
        $testObject = [PSCustomObject]@{
            Name = ''
            ResourceType = 'Microsoft.Resources/resourceGroups'
        }

        # Pass
        foreach ($name in $validNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.RG';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Pass';
            }
        }

        # Fail
        foreach ($name in $invalidNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.RG';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Fail';
            }
        }
    }

    Context 'CAF.Name.VNET' {
        $validNames = @(
            'vnet-test-001'
        )
        $invalidNames = @(
            'vnet-Test-001'
            'vnetest001'
            'test-vnet-001'
        )
        $testObject = [PSCustomObject]@{
            Name = ''
            ResourceType = 'Microsoft.Network/virtualNetworks'
        }

        # Pass
        foreach ($name in $validNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.VNET';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Pass';
            }
        }

        # Fail
        foreach ($name in $invalidNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.VNET';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Fail';
            }
        }
    }

    Context 'CAF.Name.Subnet' {
        $validNames = @(
            'snet-test-001'
        )
        $invalidNames = @(
            'snet-Test-001'
            'snettest001'
            'test-snet-001'
        )
        $testObject = @(
            [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.Network/virtualNetworks/subnets'
            }
            [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.Network/virtualNetworks'
                Properties = @{
                    subnets = @(
                        @{
                            Name = ''
                        }
                    )
                }
            }
        )

        # Pass
        foreach ($name in $validNames) {
            It $name {
                $testObject[0].Name = $name;
                $testObject[1].Properties.Subnets[0].Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Subnet';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -BeIn 'Pass';
            }
        }

        # Fail
        foreach ($name in $invalidNames) {
            It $name {
                $testObject[0].Name = $name;
                $testObject[1].Properties.Subnets[0].Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Subnet';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -BeIn 'Fail';
            }
        }
    }

    Context 'CAF.Name.VNG' {
        $validNames = @(
            'vgw-test-001'
        )
        $invalidNames = @(
            'vgw-Test-001'
            'vgwtest001'
            'test-vgw-001'
        )
        $testObject = [PSCustomObject]@{
            Name = ''
            ResourceType = 'Microsoft.Network/virtualNetworkGateways'
        }

        # Pass
        foreach ($name in $validNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.VNG';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Pass';
            }
        }

        # Fail
        foreach ($name in $invalidNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.VNG';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Fail';
            }
        }
    }

    Context 'CAF.Name.Connection' {
        $validNames = @(
            'cn-test-001'
        )
        $invalidNames = @(
            'cn-Test-001'
            'cntest001'
            'test-cn-001'
        )
        $testObject = [PSCustomObject]@{
            Name = ''
            ResourceType = 'Microsoft.Network/connections'
        }

        # Pass
        foreach ($name in $validNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Connection';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Pass';
            }
        }

        # Fail
        foreach ($name in $invalidNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Connection';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Fail';
            }
        }
    }

    Context 'CAF.Name.NSG' {
        $validNames = @(
            'nsg-test-001'
        )
        $invalidNames = @(
            'nsg-Test-001'
            'nsgtest001'
            'test-nsg-001'
        )
        $testObject = [PSCustomObject]@{
            Name = ''
            ResourceType = 'Microsoft.Network/networkSecurityGroups'
        }

        # Pass
        foreach ($name in $validNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.NSG';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Pass';
            }
        }

        # Fail
        foreach ($name in $invalidNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.NSG';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Fail';
            }
        }
    }

    Context 'CAF.Name.Route' {
        $validNames = @(
            'route-test-001'
        )
        $invalidNames = @(
            'route-Test-001'
            'routetest001'
            'test-route-001'
        )
        $testObject = [PSCustomObject]@{
            Name = ''
            ResourceType = 'Microsoft.Network/routeTables'
        }

        # Pass
        foreach ($name in $validNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Route';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Pass';
            }
        }

        # Fail
        foreach ($name in $invalidNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Route';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Fail';
            }
        }
    }

    Context 'CAF.Name.VM' {
        $validNames = @(
            'vm-test-001'
            'vmtest001'
        )
        $invalidNames = @(
            'vm-Test-001'
            'test-vm-001'
        )
        $testObject = [PSCustomObject]@{
            Name = ''
            ResourceType = 'Microsoft.Compute/virtualMachines'
        }

        # Pass
        foreach ($name in $validNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.VM';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Pass';
            }
        }

        # Fail
        foreach ($name in $invalidNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.VM';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Fail';
            }
        }
    }

    Context 'CAF.Name.Storage' {
        $validNames = @(
            'storage001'
            'stvm001'
            'dls001'
        )
        $invalidNames = @(
            'sTest001'
            'testst001'
            'cs001'
        )
        $testObject = [PSCustomObject]@{
            Name = ''
            ResourceType = 'Microsoft.Storage/storageAccounts'
        }

        # Pass
        foreach ($name in $validNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Storage';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Pass';
            }
        }

        # Fail
        foreach ($name in $invalidNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Storage';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Fail';
            }
        }

        It 'Cloud Shell' {
            $testObject = [PSCustomObject]@{
                Name = 'cs001'
                ResourceType = 'Microsoft.Storage/storageAccounts'
                Tags = @{
                    'ms-resource-usage' = 'azure-cloud-shell'
                }
            }
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Storage' -Outcome All;
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'None';
        }
    }

    Context 'CAF.Name.PublicIP' {
        $validNames = @(
            'pip-test-001'
        )
        $invalidNames = @(
            'pip-Test-001'
            'piptest001'
            'test-pip-001'
        )
        $testObject = [PSCustomObject]@{
            Name = ''
            ResourceType = 'Microsoft.Network/publicIPAddresses'
        }

        # Pass
        foreach ($name in $validNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.PublicIP';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Pass';
            }
        }

        # Fail
        foreach ($name in $invalidNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.PublicIP';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Fail';
            }
        }
    }

    Context 'CAF.Name.LoadBalancer' {
        $validNames = @(
            'lbi-test-001'
            'lbe-test-001'
        )
        $invalidNames = @(
            'lbi-Test-001'
            'lbetest001'
            'test-lbi-001'
        )
        $testObject = [PSCustomObject]@{
            Name = ''
            ResourceType = 'Microsoft.Network/loadBalancers'
        }

        # Pass
        foreach ($name in $validNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.LoadBalancer';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Pass';
            }
        }

        # Fail
        foreach ($name in $invalidNames) {
            It $name {
                $testObject.Name = $name;
                $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.LoadBalancer';
                $ruleResult | Should -Not -BeNullOrEmpty;
                $ruleResult.Outcome | Should -Be 'Fail';
            }
        }
    }
}

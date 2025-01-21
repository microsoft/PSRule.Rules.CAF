# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# Unit tests for CAF name rules
#

[CmdletBinding()]
param ()

BeforeAll {
    # Setup error handling
    $ErrorActionPreference = 'Stop';
    Set-StrictMode -Version latest;

    if ($Env:SYSTEM_DEBUG -eq 'true') {
        $VerbosePreference = 'Continue';
    }

    # Setup tests paths
    $rootPath = $PWD;
    Import-Module (Join-Path -Path $rootPath -ChildPath out/modules/PSRule.Rules.CAF) -Force;
}

Describe 'CAF.Name' -Tag 'name' {
    BeforeAll {
        $invokeParams = @{
            Module = 'PSRule.Rules.CAF'
            WarningAction = 'Ignore'
            ErrorAction = 'Stop'
        }
    }

    Context 'CAF.Name.RG' {
        BeforeAll {
            $testObject = [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.Resources/resourceGroups'
            }
        }

        BeforeDiscovery {
            $validNames = @(
                'rg-test-001'
            )
            $invalidNames = @(
                'rg-Test-001'
                'rgtest001'
                'test-rg-001'
            )
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.RG';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.RG';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Fail';
        }
    }

    Context 'CAF.Name.VNET' {
        BeforeAll {
            $testObject = [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.Network/virtualNetworks'
            }
        }

        BeforeDiscovery {
            $validNames = @(
                'vnet-test-001'
            )
            $invalidNames = @(
                'vnet-Test-001'
                'vnetest001'
                'test-vnet-001'
            )
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.VNET';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.VNET';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Fail';
        }
    }

    Context 'CAF.Name.Subnet' {
        BeforeAll {
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
        }

        BeforeDiscovery {
            $validNames = @(
                'snet-test-001'
            )
            $invalidNames = @(
                'snet-Test-001'
                'snettest001'
                'test-snet-001'
            )
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject[0].Name = $_;
            $testObject[1].Properties.Subnets[0].Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Subnet';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -BeIn 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject[0].Name = $_;
            $testObject[1].Properties.Subnets[0].Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Subnet';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -BeIn 'Fail';
        }
    }

    Context 'CAF.Name.VNG' {
        BeforeAll {
            $testObject = [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.Network/virtualNetworkGateways'
            }
        }

        BeforeDiscovery {
            $validNames = @(
                'vgw-test-001'
            )
            $invalidNames = @(
                'vgw-Test-001'
                'vgwtest001'
                'test-vgw-001'
            )
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.VNG';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.VNG';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Fail';
        }
    }

    Context 'CAF.Name.Connection' {
        BeforeDiscovery {
            $validNames = @(
                'cn-test-001'
            )
            $invalidNames = @(
                'cn-Test-001'
                'cntest001'
                'test-cn-001'
            )
        }

        BeforeAll {
            $testObject = [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.Network/connections'
            }
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Connection';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Connection';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Fail';
        }
    }

    Context 'CAF.Name.NSG' {
        BeforeDiscovery {
            $validNames = @(
                'nsg-test-001'
            )
            $invalidNames = @(
                'nsg-Test-001'
                'nsgtest001'
                'test-nsg-001'
            )
        }

        BeforeAll {
            $testObject = [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.Network/networkSecurityGroups'
            }
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.NSG';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.NSG';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Fail';
        }
    }

    Context 'CAF.Name.Route' {
        BeforeDiscovery {
            $validNames = @(
                'rt-test-001'
            )
            $invalidNames = @(
                'route-Test-001'
                'routetest001'
                'route-test-001'
                'test-route-001'
            )
        }

        BeforeAll {
            $testObject = [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.Network/routeTables'
            }
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Route';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Route';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Fail';
        }
    }

    Context 'CAF.Name.VM' {
        BeforeDiscovery {
            $validNames = @(
                'vm-test-001'
                'vmtest001'
            )
            $invalidNames = @(
                'vm-Test-001'
                'test-vm-001'
            )
        }

        BeforeAll {
            $testObject = [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.Compute/virtualMachines'
            }
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.VM';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.VM';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Fail';
        }
    }

    Context 'CAF.Name.Storage' {
        BeforeDiscovery {
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
        }

        BeforeAll {
            $testObject = [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.Storage/storageAccounts'
            }
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Storage';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.Storage';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Fail';
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
        BeforeDiscovery {
            $validNames = @(
                'pip-test-001'
            )
            $invalidNames = @(
                'pip-Test-001'
                'piptest001'
                'test-pip-001'
            )
        }

        BeforeAll {
            $testObject = [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.Network/publicIPAddresses'
            }
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.PublicIP';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.PublicIP';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Fail';
        }
    }

    Context 'CAF.Name.LoadBalancer' {
        BeforeDiscovery {
            $validNames = @(
                'lbi-test-001'
                'lbe-test-001'
            )
            $invalidNames = @(
                'lbi-Test-001'
                'lbetest001'
                'test-lbi-001'
            )
        }

        BeforeAll {
            $testObject = [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.Network/loadBalancers'
            }
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.LoadBalancer';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.LoadBalancer';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Fail';
        }
    }

    Context 'CAF.Name.CognitiveSearch' {
        BeforeDiscovery {
            $validNames = @(
                'srch-test-001'
            )
            $invalidNames = @(
                'srch-Test-001'
                'srchtest001'
                'test-srch-001'
            )
        }

        BeforeAll {
            $testObject = [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.Search/searchServices'
            }
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.CognitiveSearch';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.CognitiveSearch';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Fail';
        }
    }

    Context 'CAF.Name.CognitiveServices' {
        BeforeDiscovery {
            $validNames = @(
                'cog-test-001'
            )
            $invalidNames = @(
                'cog-Test-001'
                'cogtest001'
                'test-cog-001'
            )
        }

        BeforeAll {
            $testObject = [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.CognitiveServices/accounts'
            }
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.CognitiveServices';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.CognitiveServices';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Fail';
        }
    }

    Context 'CAF.Name.EventGridDomain' {
        BeforeDiscovery {
            $validNames = @(
                'evgd-test-001'
            )
            $invalidNames = @(
                'evgd-Test-001'
                'evgdtest001'
                'test-evgd-001'
            )
        }

        BeforeAll {
            $testObject = [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.EventGrid/domains'
            }
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.EventGridDomain';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.EventGridDomain';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Fail';
        }
    }

    Context 'CAF.Name.EventGridTopic' {
        BeforeDiscovery {
            $validNames = @(
                'evgt-test-001'
            )
            $invalidNames = @(
                'evgt-Test-001'
                'evgttest001'
                'test-evgt-001'
            )
        }

        BeforeAll {
            $testObject = [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.EventGrid/topics'
            }
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.EventGridTopic';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.EventGridTopic';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Fail';
        }
    }

    Context 'CAF.Name.EventGridSystemTopic' {
        BeforeDiscovery {
            $validNames = @(
                'evgt-test-001'
            )
            $invalidNames = @(
                'evgt-Test-001'
                'evgttest001'
                'test-evgt-001'
            )
        }

        BeforeAll {
            $testObject = [PSCustomObject]@{
                Name = ''
                ResourceType = 'Microsoft.EventGrid/systemTopics'
            }
        }

        # Pass
        It '<_>' -ForEach $validNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.EventGridSystemTopic';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Pass';
        }

        # Fail
        It '<_>' -ForEach $invalidNames {
            $testObject.Name = $_;
            $ruleResult = $testObject | Invoke-PSRule @invokeParams -Name 'CAF.Name.EventGridSystemTopic';
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Outcome | Should -Be 'Fail';
        }
    }
}

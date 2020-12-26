# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# Unit tests for CAF tag rules
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

Describe 'CAF.Tag' -Tag 'tag' {
    Context 'Conditions' {
        $invokeParams = @{
            Module = 'PSRule.Rules.CAF'
            WarningAction = 'Ignore'
            ErrorAction = 'Stop'
        }
        $testObject = @(
            @{
                Name = 'rg-A'
                ResourceType = 'Microsoft.Resources/resourceGroups'
                Tags = @{
                    Env = 'Prod'
                    OtherTag = 'Value1'
                    Environment = 'Prod'
                }
            }
            @{
                Name = 'rg-B'
                ResourceType = 'Microsoft.Resources/resourceGroups'
            }
            @{
                Name = 'rg-C'
                ResourceType = 'Microsoft.Resources/resourceGroups'
                Tags = @{
                    OtherTag = 'Value1'
                    Environment = 'Production'
                }
            }
            @{
                Name = 'GatewaySubnet'
                Type = 'Microsoft.Network/virtualNetworks/subnets'
            }
            @{
                Name = 'vnet-A'
                Type = 'Microsoft.Network/virtualNetworks'
                Tags = @{
                    Env = 'Prod'
                }
            },
            @{
                Name = 'vnet-B'
                Type = 'Microsoft.Network/virtualNetworks'
                Tags = @{
                    Environment = 'Prod'
                }
            },
            @{
                Name = 'vnet-C'
                Type = 'Microsoft.Network/virtualNetworks'
                Tags = @{
                    env = 'prod'
                }
            }
        )

        It 'CAF.Tag.Resource' {
            # Not set
            $result = $testObject | Invoke-PSRule @invokeParams -Outcome All;
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'CAF.Tag.Resource' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -BeNullOrEmpty;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -BeNullOrEmpty;

            # With resource tags set
            $result = $testObject | Invoke-PSRule @invokeParams -Outcome All -Option @{
                'Configuration.CAF_ResourceMandatoryTags' = @('Env')
            };
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'CAF.Tag.Resource' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'vnet-B', 'vnet-C';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'vnet-A';

            # None
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'None' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 4;
            $ruleResult.TargetName | Should -BeIn 'rg-A', 'rg-B', 'rg-C', 'GatewaySubnet';

            # With resource tags set, non-case-sensitive
            $result = $testObject | Invoke-PSRule @invokeParams -Outcome All -Option @{
                'Configuration.CAF_ResourceMandatoryTags' = 'Env'
                'Configuration.CAF_MatchTagNameCase' = $False
            };
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'CAF.Tag.Resource' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'vnet-B';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'vnet-A', 'vnet-C';

            # None
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'None' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 4;
            $ruleResult.TargetName | Should -BeIn 'rg-A', 'rg-B', 'rg-C', 'GatewaySubnet';
        }

        It 'CAF.Tag.ResourceGroup' {
            # Not set
            $result = $testObject | Invoke-PSRule @invokeParams -Outcome All;
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'CAF.Tag.ResourceGroup' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -BeNullOrEmpty;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -BeNullOrEmpty;

            # With resource group tags set
            $result = $testObject | Invoke-PSRule @invokeParams -Outcome All -Option @{ 'Configuration.CAF_ResourceGroupMandatoryTags' = @('Env') };
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'CAF.Tag.ResourceGroup' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'rg-B', 'rg-C';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'rg-A', 'vnet-A', 'vnet-B';

            # None
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'None' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 4;
            $ruleResult.TargetName | Should -BeIn 'vnet-A', 'vnet-B', 'vnet-C', 'GatewaySubnet';
        }

        It 'CAF.Tag.Environment' {
            # Not set
            $result = $testObject | Invoke-PSRule @invokeParams -Outcome All;
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'CAF.Tag.Environment' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'vnet-C';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'rg-A', 'vnet-A';

            # None
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'None' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 4;
            $ruleResult.TargetName | Should -BeIn 'rg-B', 'rg-C', 'GatewaySubnet', 'vnet-B';

            # With custom environment tag
            $result = $testObject | Invoke-PSRule @invokeParams -Outcome All -Option @{ 'Configuration.CAF_EnvironmentTag' = @('Environment') };
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'CAF.Tag.Environment' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -BeIn 'rg-C';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -BeIn 'rg-A', 'vnet-B';

            # None
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'None' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 4;
            $ruleResult.TargetName | Should -BeIn 'rg-B', 'vnet-A', 'vnet-C', 'GatewaySubnet';
        }
    }
}

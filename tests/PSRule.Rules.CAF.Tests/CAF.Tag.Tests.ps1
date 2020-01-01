# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

#
# Unit tests for CAF tag rules
#

[CmdletBinding()]
param (

)

# Setup error handling
$ErrorActionPreference = 'Stop';
Set-StrictMode -Version latest;

if ($Env:SYSTEM_DEBUG -eq 'true') {
    $VerbosePreference = 'Continue';
}

# Setup tests paths
$rootPath = $PWD;
Import-Module (Join-Path -Path $rootPath -ChildPath out/modules/PSRule.Rules.CAF) -Force;
$here = (Resolve-Path $PSScriptRoot).Path;

Describe 'CAF.Tag' -Tag 'tag' {
    $dataPath = Join-Path -Path $here -ChildPath 'Resources.*.json';

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
            }
        )

        It 'CAF.Tag.R.Required' {
            # Not set
            $result = $testObject | Invoke-PSRule @invokeParams -Outcome All;
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'CAF.Tag.R.Required' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -BeNullOrEmpty;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -Be 'vnet-A', 'vnet-B';

            # With tags set
            $result = $testObject | Invoke-PSRule @invokeParams -Outcome All -Option @{ 'Configuration.CAF_ResourceMandatoryTags' = @('Env') };
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'CAF.Tag.R.Required' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -Be 'vnet-B';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -Be 'vnet-A';
        }

        It 'CAF.Tag.RG.Required' {
            # Not set
            $result = $testObject | Invoke-PSRule @invokeParams -Outcome All;
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'CAF.Tag.RG.Required' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -BeNullOrEmpty;

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 3;

            # With tags set
            $result = $testObject | Invoke-PSRule @invokeParams -Outcome All -Option @{ 'Configuration.CAF_ResourceGroupMandatoryTags' = @('Env') };
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'CAF.Tag.RG.Required' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 2;
            $ruleResult.TargetName | Should -Be 'rg-B', 'rg-C';

            # Pass
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Pass' });
            $ruleResult | Should -Not -BeNullOrEmpty;
            $ruleResult.Length | Should -Be 1;
            $ruleResult.TargetName | Should -Be 'rg-A';
        }

        It 'CAF.Tag.Environment' {
            # Not set
            $result = $testObject | Invoke-PSRule @invokeParams -Outcome All;
            $filteredResult = $result | Where-Object { $_.RuleName -eq 'CAF.Tag.Environment' };

            # Fail
            $ruleResult = @($filteredResult | Where-Object { $_.Outcome -eq 'Fail' });
            $ruleResult | Should -BeNullOrEmpty;

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
            $ruleResult.Length | Should -Be 3;
            $ruleResult.TargetName | Should -BeIn 'rg-B', 'vnet-A', 'GatewaySubnet';
        }
    }
}

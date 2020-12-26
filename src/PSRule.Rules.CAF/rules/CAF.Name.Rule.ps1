# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Note:
# This contains rules for standard naming suggested in the CAF.
# https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging
# https://docs.microsoft.com/en-us/azure/architecture/best-practices/resource-naming

# Synopsis: Use standard resource groups names.
Rule 'CAF.Name.RG' -Type 'Microsoft.Resources/resourceGroups' -If { !(CAF_IsManagedRG) } {
    $Assert.StartsWith($PSRule, 'TargetName', $Configuration.CAF_ResourceGroupPrefix, $True);
    if ($Configuration.CAF_UseLowerNames -eq $True) {
        $Assert.IsLower($PSRule, 'TargetName');
    }
}

# Synopsis: Use standard virtual networks names.
Rule 'CAF.Name.VNET' -Type 'Microsoft.Network/virtualNetworks' {
    $Assert.StartsWith($PSRule, 'TargetName', $Configuration.CAF_VirtualNetworkPrefix, $True);
    if ($Configuration.CAF_UseLowerNames -eq $True) {
        $Assert.IsLower($PSRule, 'TargetName');
    }
}

# Synopsis: Use standard subnets names.
Rule 'CAF.Name.Subnet' -Type 'Microsoft.Network/virtualNetworks', 'Microsoft.Network/virtualNetworks/subnets' {
    $subnets = @($TargetObject);
    if ($PSRule.TargetType -eq 'Microsoft.Network/virtualNetworks') {
        $subnets = @($TargetObject.Properties.subnets);
    }
    if ($subnets.Length -eq 0) {
        $Assert.Pass();
    }
    foreach ($subnet in $subnets) {
        if ($subnet.Name -in 'GatewaySubnet', 'AzureFirewallSubnet') {
            $Assert.Pass();
        }
        else {
            $Assert.StartsWith($subnet, 'Name', $Configuration.CAF_SubnetPrefix);
            if ($Configuration.CAF_UseLowerNames -eq $True) {
                $Assert.IsLower($subnet, 'Name');
            }
        }
    }
}

# Synopsis: Use standard virtual network gateway names.
Rule 'CAF.Name.VNG' -Type 'Microsoft.Network/virtualNetworkGateways' {
    $Assert.StartsWith($PSRule, 'TargetName', $Configuration.CAF_VirtualNetworkGatewayPrefix, $True);
    if ($Configuration.CAF_UseLowerNames -eq $True) {
        $Assert.IsLower($PSRule, 'TargetName');
    }
}

# Synopsis: Use standard virtual networks gateway connection names.
Rule 'CAF.Name.Connection' -Type 'Microsoft.Network/connections' {
    $Assert.StartsWith($PSRule, 'TargetName', $Configuration.CAF_GatewayConnectionPrefix, $True);
    if ($Configuration.CAF_UseLowerNames -eq $True) {
        $Assert.IsLower($PSRule, 'TargetName');
    }
}

# Synopsis: Use standard network security group names.
Rule 'CAF.Name.NSG' -Type 'Microsoft.Network/networkSecurityGroups' {
    $Assert.StartsWith($PSRule, 'TargetName', $Configuration.CAF_NetworkSecurityGroupPrefix, $True);
    if ($Configuration.CAF_UseLowerNames -eq $True) {
        $Assert.IsLower($PSRule, 'TargetName');
    }
}

# Synopsis: Use standard route table names.
Rule 'CAF.Name.Route' -Type 'Microsoft.Network/routeTables' {
    $Assert.StartsWith($PSRule, 'TargetName', $Configuration.CAF_RouteTablePrefix, $True);
    if ($Configuration.CAF_UseLowerNames -eq $True) {
        $Assert.IsLower($PSRule, 'TargetName');
    }
}

# Synopsis: Use standard virtual machines names.
Rule 'CAF.Name.VM' -Type 'Microsoft.Compute/virtualMachines' {
    $Assert.StartsWith($PSRule, 'TargetName', $Configuration.CAF_VirtualMachinePrefix, $True);
    if ($Configuration.CAF_UseLowerNames -eq $True) {
        $Assert.IsLower($PSRule, 'TargetName');
    }
}

# Synopsis: Use standard storage accounts names.
Rule 'CAF.Name.Storage' -Type 'Microsoft.Storage/storageAccounts' {
    $Assert.StartsWith($PSRule, 'TargetName', $Configuration.CAF_StoragePrefix, $True);
    $Assert.IsLower($PSRule, 'TargetName');
}

# Synopsis: Use standard public IP address names.
Rule 'CAF.Name.PublicIP' -Type 'Microsoft.Network/publicIPAddresses' {
    $Assert.StartsWith($PSRule, 'TargetName', $Configuration.CAF_PublicIPPrefix, $True);
    if ($Configuration.CAF_UseLowerNames -eq $True) {
        $Assert.IsLower($PSRule, 'TargetName');
    }
}

# Synopsis: Use standard load balancer names.
Rule 'CAF.Name.LoadBalancer' -Type 'Microsoft.Network/loadBalancers' -If { !(CAF_IsManagedLB) } {
    $Assert.StartsWith($PSRule, 'TargetName', $Configuration.CAF_LoadBalancerPrefix, $True);
    if ($Configuration.CAF_UseLowerNames -eq $True) {
        $Assert.IsLower($PSRule, 'TargetName');
    }
}

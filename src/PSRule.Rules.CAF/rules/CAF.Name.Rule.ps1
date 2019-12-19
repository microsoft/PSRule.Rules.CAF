# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Note:
# This contains rules for standard naming suggested in the CAF.
# https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging

# Synopsis: Use a standard prefix for resource groups
Rule 'CAF.Name.RG' -Type 'Microsoft.Resources/resourceGroups' {
    $Assert.StartsWith($TargetObject, 'ResourceGroupName', $Configuration.CAF_ResourceGroupPrefix)
}

# Synopsis: Use a standard prefix for virtual networks and subnets
Rule 'CAF.Name.VNET' -Type 'Microsoft.Network/virtualNetworks', 'Microsoft.Network/virtualNetworks/subnets' {
    if ($PSRule.TargetType -eq 'Microsoft.Network/virtualNetworks') {
        $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_VirtualNetworkPrefix)
        foreach ($subnet in $TargetObject.Properties.subnets) {
            if ($subnet.name -eq 'GatewaySubnet') {
                $Assert.Pass();
            }
            else {
                $Assert.StartsWith($subnet, 'Name', $Configuration.CAF_SubnetPrefix)
            }
        }
    }
    elseif ($PSRule.TargetType -eq 'Microsoft.Network/virtualNetworks/subnets') {
        if ($PSRule.TargetName -eq 'GatewaySubnet') {
            $Assert.Pass();
        }
        else {
            $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_SubnetPrefix)
        }
    }
}

# Synopsis: Use a standard prefix for virtual network gateways
Rule 'CAF.Name.VNG' -Type 'Microsoft.Network/virtualNetworkGateways' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_VirtualNetworkGatewayPrefix)
}

# Synopsis: Use a standard prefix for virtual networks gateway connections
Rule 'CAF.Name.Connection' -Type 'Microsoft.Network/connections' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_GatewayConnectionPrefix)
}

# Synopsis: Use a standard prefix for network security groups
Rule 'CAF.Name.NSG' -Type 'Microsoft.Network/networkSecurityGroups' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_NetworkSecurityGroupPrefix)
}

# Synopsis: Use a standard prefix for route tables
Rule 'CAF.Name.Route' -Type 'Microsoft.Network/routeTables' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_RouteTablePrefix)
}

# Synopsis: Use a standard prefix for virtual machines
Rule 'CAF.Name.VM' -Type 'Microsoft.Compute/virtualMachines' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_VirtualMachinePrefix)
}

# Synopsis: Use a standard prefix for storage accounts
Rule 'CAF.Name.Storage' -Type 'Microsoft.Storage/storageAccounts' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_StoragePrefix)
}

# Synopsis: Use a standard prefix for public IPs
Rule 'CAF.Name.IP' {

}

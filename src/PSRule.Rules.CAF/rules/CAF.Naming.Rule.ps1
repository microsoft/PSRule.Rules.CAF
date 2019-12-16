# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Synopsis: Use a standard prefix for resource groups
Rule 'CAF.RG.Name' -Type 'Microsoft.Resources/resourceGroups' {
    $Assert.StartsWith($TargetObject, 'ResourceGroupName', $Configuration.ACF_ResourceGroupPrefix)
}

# Synopsis: Use a standard prefix for virtual networks and subnets
Rule 'CAF.VNET.Name' -Type 'Microsoft.Network/virtualNetworks', 'Microsoft.Network/virtualNetworks/subnets' {
    if ($PSRule.TargetType -eq 'Microsoft.Network/virtualNetworks') {
        $Assert.StartsWith($TargetObject, 'Name', $Configuration.ACF_VirtualNetworkPrefix)
        foreach ($subnet in $TargetObject.Properties.subnets) {
            if ($subnet.name -eq 'GatewaySubnet') {
                $Assert.Pass();
            }
            else {
                $Assert.StartsWith($subnet, 'Name', $Configuration.ACF_SubnetPrefix)
            }
        }
    }
    elseif ($PSRule.TargetType -eq 'Microsoft.Network/virtualNetworks/subnets') {
        if ($PSRule.TargetName -eq 'GatewaySubnet') {
            $Assert.Pass();
        }
        else {
            $Assert.StartsWith($TargetObject, 'Name', $Configuration.ACF_SubnetPrefix)
        }
    }
}

# Synopsis: Use a standard prefix for virtual network gateways
Rule 'CAF.VNG.Name' -Type 'Microsoft.Network/virtualNetworkGateways' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.ACF_VirtualNetworkGatewayPrefix)
}

# Synopsis: Use a standard prefix for virtual networks gateway connections
Rule 'CAF.Connection.Name' -Type 'Microsoft.Network/connections' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.ACF_GatewayConnectionPrefix)
}

# Synopsis: Use a standard prefix for network security groups
Rule 'CAF.NSG.Name' -Type 'Microsoft.Network/networkSecurityGroups' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.ACF_NetworkSecurityGroupPrefix)
}

# Synopsis: Use a standard prefix for route tables
Rule 'CAF.Route.Name' -Type 'Microsoft.Network/routeTables' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.ACF_RouteTablePrefix)
}

# Synopsis: Use a standard prefix for virtual machines
Rule 'CAF.VM.Name' -Type 'Microsoft.Compute/virtualMachines' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.ACF_VirtualMachinePrefix)
}

# Synopsis: Use a standard prefix for storage accounts
Rule 'CAF.Storage.Name' -Type 'Microsoft.Storage/storageAccounts' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.ACF_StoragePrefix)
}

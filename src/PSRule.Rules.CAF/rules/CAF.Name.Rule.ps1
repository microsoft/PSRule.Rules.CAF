# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Note:
# This contains rules for standard naming suggested in the CAF.
# https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging
# https://docs.microsoft.com/en-us/azure/architecture/best-practices/resource-naming

# Synopsis: Use standard resource groups names
Rule 'CAF.Name.RG' -Type 'Microsoft.Resources/resourceGroups' -If { !(IsManagedRG) } {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_ResourceGroupPrefix)

    # Name requirements
    $Assert.GreaterOrEqual($TargetObject, 'Name', 1)
    $Assert.LessOrEqual($TargetObject, 'Name', 90)
    Match 'Name' '^[-\w\._\(\)]*[-\w_\(\)]$'
}

# Synopsis: Use standard virtual networks names
Rule 'CAF.Name.VNET' -Type 'Microsoft.Network/virtualNetworks' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_VirtualNetworkPrefix)

    # Name requirements
    $Assert.GreaterOrEqual($TargetObject, 'Name', 2)
    $Assert.LessOrEqual($TargetObject, 'Name', 64)
    Match 'Name' '^[\w][-\w_\.]*[\w_]$'
}

# Synopsis: Use standard subnets names
Rule 'CAF.Name.Subnet' -Type 'Microsoft.Network/virtualNetworks', 'Microsoft.Network/virtualNetworks/subnets' {
    if ($PSRule.TargetType -eq 'Microsoft.Network/virtualNetworks') {
        foreach ($subnet in $TargetObject.Properties.subnets) {
            if ($subnet.name -eq 'GatewaySubnet') {
                $Assert.Pass();
            }
            else {
                $Assert.StartsWith($subnet, 'Name', $Configuration.CAF_SubnetPrefix)

                # Name requirements
                $Assert.GreaterOrEqual($subnet, 'Name', 2)
                $Assert.LessOrEqual($subnet, 'Name', 80)
                $subnet | Match 'Name' '^[\w][-\w_\.]*[\w_]$'
            }
        }
    }
    elseif ($PSRule.TargetType -eq 'Microsoft.Network/virtualNetworks/subnets') {
        if ($PSRule.TargetName -eq 'GatewaySubnet') {
            $Assert.Pass();
        }
        else {
            $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_SubnetPrefix)

            # Name requirements
            $Assert.GreaterOrEqual($subnet, 'Name', 2)
            $Assert.LessOrEqual($subnet, 'Name', 80)
            $subnet | Match 'Name' '^[\w][-\w_\.]*[\w_]$'
        }
    }
}

# Synopsis: Use standard virtual network gateway names
Rule 'CAF.Name.VNG' -Type 'Microsoft.Network/virtualNetworkGateways' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_VirtualNetworkGatewayPrefix)

    # Name requirements
    $Assert.GreaterOrEqual($TargetObject, 'Name', 1)
    $Assert.LessOrEqual($TargetObject, 'Name', 80)
    Match 'Name' '^[\w][-\w_\.]*[\w_]$'
}

# Synopsis: Use standard virtual networks gateway connection names
Rule 'CAF.Name.Connection' -Type 'Microsoft.Network/connections' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_GatewayConnectionPrefix)

    # Name requirements
    $Assert.GreaterOrEqual($TargetObject, 'Name', 1)
    $Assert.LessOrEqual($TargetObject, 'Name', 80)
    Match 'Name' '^[\w][-\w_\.]*[\w_]$'
}

# Synopsis: Use standard network security group names
Rule 'CAF.Name.NSG' -Type 'Microsoft.Network/networkSecurityGroups' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_NetworkSecurityGroupPrefix)

    # Name requirements
    $Assert.GreaterOrEqual($TargetObject, 'Name', 1)
    $Assert.LessOrEqual($TargetObject, 'Name', 80)
    Match 'Name' '^[\w][-\w_\.]*[\w_]$'
}

# Synopsis: Use standard route table names
Rule 'CAF.Name.Route' -Type 'Microsoft.Network/routeTables' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_RouteTablePrefix)

    # Name requirements
    $Assert.GreaterOrEqual($TargetObject, 'Name', 1)
    $Assert.LessOrEqual($TargetObject, 'Name', 80)
    Match 'Name' '^[\w][-\w_\.]*[\w_]$'
}

# Synopsis: Use standard virtual machines names
Rule 'CAF.Name.VM' -Type 'Microsoft.Compute/virtualMachines' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_VirtualMachinePrefix)
}

# Synopsis: Use standard storage accounts names
Rule 'CAF.Name.Storage' -Type 'Microsoft.Storage/storageAccounts' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_StoragePrefix)

    # Name requirements
    $Assert.GreaterOrEqual($TargetObject, 'Name', 3)
    $Assert.LessOrEqual($TargetObject, 'Name', 24)
    Match 'Name' '^[a-z0-9]+$' -CaseSensitive
}

# Synopsis: Use standard public IP address names
Rule 'CAF.Name.PublicIP' -Type 'Microsoft.Network/publicIPAddresses' {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_PublicIPPrefix)

    # Name requirements
    $Assert.GreaterOrEqual($TargetObject, 'Name', 1)
    $Assert.LessOrEqual($TargetObject, 'Name', 80)
    Match 'Name' '^[\w][-\w_\.]*[\w_]$'
}

# Synopsis: Use standard load balancer names
Rule 'CAF.Name.LoadBalancer' -Type 'Microsoft.Network/loadBalancers' -If { !(IsManagedLB) } {
    $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_LoadBalancerPrefix)

    # Name requirements
    $Assert.GreaterOrEqual($TargetObject, 'Name', 1)
    $Assert.LessOrEqual($TargetObject, 'Name', 80)
    Match 'Name' '^[\w][-\w_\.]*[\w_]$'
}

# Rule 'CAF.Name.ACR' -Type 'Microsoft.ContainerRegistry/registries' {
#     $Assert.StartsWith($TargetObject, 'Name', $Configuration.CAF_ACRPrefix)

#     # Name requirements
#     $Assert.GreaterOrEqual($TargetObject, 'Name', 5)
#     $Assert.LessOrEqual($TargetObject, 'Name', 50)

#     # Match 'Name' '^[a-zA-Z0-9]*$'
# }

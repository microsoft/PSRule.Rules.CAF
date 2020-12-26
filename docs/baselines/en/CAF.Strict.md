# CAF.Strict

The default baseline for Azure Cloud Adoption Framework

## Rules

The following rules are included within `CAF.Strict`. This baseline includes a total of 14 rules.

Name | Synopsis
---- | --------
[CAF.Name.Connection](CAF.Name.Connection.md) | Virtual network gateway connection names should use a standard prefix.
[CAF.Name.LoadBalancer](CAF.Name.LoadBalancer.md) | Load balancer names should use a standard prefix.
[CAF.Name.NSG](CAF.Name.NSG.md) | Network security group (NSG) names should use a standard prefix.
[CAF.Name.PublicIP](CAF.Name.PublicIP.md) | Public IP address names should use a standard prefix.
[CAF.Name.RG](CAF.Name.RG.md) | Resource group names should use a standard prefix.
[CAF.Name.Route](CAF.Name.Route.md) | Route table names should use a standard prefix.
[CAF.Name.Storage](CAF.Name.Storage.md) | Storage account names should use a standard prefix.
[CAF.Name.Subnet](CAF.Name.Subnet.md) | Subnet names should use a standard prefix.
[CAF.Name.VM](CAF.Name.VM.md) | Virtual machine names should use a standard prefix.
[CAF.Name.VNET](CAF.Name.VNET.md) | Virtual network names should use a standard prefix.
[CAF.Name.VNG](CAF.Name.VNG.md) | Virtual network gateway names should use a standard prefix.
[CAF.Tag.Environment](CAF.Tag.Environment.md) | Tag resources and resource groups with a valid environment.
[CAF.Tag.Resource](CAF.Tag.Resource.md) | Tag resources with mandatory tags.
[CAF.Tag.ResourceGroup](CAF.Tag.ResourceGroup.md) | Tag resource groups with mandatory tags.

## Configuration

Name | Default value
---- | -------------
CAF_UseLowerNames | `true`
CAF_ManagementGroupPrefix | `mg-`
CAF_ResourceGroupPrefix | `rg-`
CAF_PolicyDefinitionPrefix | `policy-`
CAF_APIManagementPrefix | `apim-`
CAF_ManagedIdentityPrefix | `id-`
CAF_VirtualNetworkPrefix | `vnet-`
CAF_SubnetPrefix | `snet-`
CAF_VirtualNetworkPeeringPrefix | `peer-`
CAF_NetworkInterfacePrefix | `nic-`
CAF_PublicIPPrefix | `pip-`
CAF_LoadBalancerPrefix | `lbi- lbe-`
CAF_NetworkSecurityGroupPrefix | `nsg-`
CAF_ApplicationSecurityGroupPrefix | `asg-`
CAF_LocalNetworkGatewayPrefix | `lgw-`
CAF_VirtualNetworkGatewayPrefix | `vgw-`
CAF_GatewayConnectionPrefix | `cn-`
CAF_ApplicationGatewayPrefix | `agw-`
CAF_RouteTablePrefix | `route-`
CAF_TrafficManagerProfilePrefix | `traf-`
CAF_FrontDoorPrefix | `fd-`
CAF_CDNProfilePrefix | `cdnp-`
CAF_CDNEndpointPrefix | `cdne-`
CAF_VirtualMachinePrefix | `vm`
CAF_VirtualMachineScaleSetPrefix | `vmss-`
CAF_AvailabilitySetPrefix | `avail-`
CAF_ContainerInstancePrefix | `aci-`
CAF_AKSClusterPrefix | `aks-`
CAF_AppServicePlanPrefix | `plan-`
CAF_WebAppPrefix | `app-`
CAF_FunctionAppPrefix | `func-`
CAF_CloudServicePrefix | `cld-`
CAF_NotificationHubPrefix | `ntf-`
CAF_NotificationHubNamespacePrefix | `ntfns-`
CAF_SQLDatabaseServerPrefix | `sql-`
CAF_SQLDatabasePrefix | `sqldb-`
CAF_CosmosDbPrefix | `cosmos-`
CAF_RedisCachePrefix | `redis-`
CAF_MySQLDatabasePrefix | `mysql-`
CAF_PostgreSQLDatabasePrefix | `psql-`
CAF_SQLDataWarehousePrefix | `sqldw-`
CAF_SynapseAnalyticsPrefix | `syn-`
CAF_SQLStretchDbPrefix | `sqlstrdb-`
CAF_StoragePrefix | `st stvm dls`
CAF_StorSimplePrefix | `ssimp`
CAF_SearchPrefix | `srch-`
CAF_CognitiveServicesPrefix | `cog-`
CAF_MachineLearningWorkspacePrefix | `mlw-`
CAF_StreamAnalyticsPrefix | `asa-`
CAF_DataFactoryPrefix | `adf-`
CAF_DataLakeStorePrefix | `dla`
CAF_EventHubsPrefix | `evh-`
CAF_HDInsightsHadoopPrefix | `hadoop-`
CAF_HDInsightsHBasePrefix | `hbase-`
CAF_HDInsightsSparkPrefix | `spark-`
CAF_IoTHubPrefix | `iot-`
CAF_PowerBIEmbeddedPrefix | `pbi-`
CAF_LogicAppsPrefix | `logic-`
CAF_ServiceBusPrefix | `sb-`
CAF_ServiceBusQueuePrefix | `sbq-`
CAF_ServiceBusTopicPrefix | `sbt-`
CAF_KeyVaultPrefix | `kv-`
CAF_MatchTagNameCase | `true`
CAF_MatchTagValueCase | `true`
CAF_ResourceMandatoryTags |
CAF_ResourceGroupMandatoryTags |
CAF_EnvironmentTag | `Env`
CAF_Environments | `Prod Dev QA Stage Test`

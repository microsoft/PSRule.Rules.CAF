# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Synopsis: Use short rule names
Rule 'Rule.Name' -Type 'PSRule.Rules.Rule' {
    Recommend 'Rule name should be less than 35 characters to prevent being truncated.'
    Reason "The rule name is too long."
    $TargetObject.RuleName.Length -le 35
    $TargetObject.RuleName.StartsWith('CAF.')
}

# Synopsis: Complete help documentation
Rule 'Rule.Help' -Type 'PSRule.Rules.Rule' {
    $Assert.HasFieldValue($TargetObject, 'Info.Synopsis')
    $Assert.HasFieldValue($TargetObject, 'Info.Description')
    $Assert.HasFieldValue($TargetObject, 'Info.Recommendation')
}

# Synopsis: Use online help
Rule 'Rule.OnlineHelp' -Type 'PSRule.Rules.Rule' {
    $Assert.HasFieldValue($TargetObject, 'Info.Annotations.''online version''')
}

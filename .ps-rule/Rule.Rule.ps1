# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Synopsis: Use short rule names
Rule 'Rule.Name' -Type 'PSRule.Rules.Rule' {
    Recommend 'Rule name should be less than 35 characters to prevent being truncated.'
    Reason "The rule name is too long."
    $Assert.LessOrEqual($TargetObject, 'RuleName', 35);
    $Assert.StartsWith($TargetObject, 'RuleName', 'CAF.');
}

# Synopsis: Complete help documentation
Rule 'Rule.Help' -Type 'PSRule.Rules.Rule' {
    $Assert.HasFieldValue($TargetObject, 'Info.Synopsis')
    $Assert.HasFieldValue($TargetObject, 'Info.Description')
    $Assert.HasFieldValue($TargetObject, 'Info.Recommendation')
}

# Synopsis: Use Microsoft Azure Well-Architected Framework pillars
Rule 'Rule.AWAF' -Type 'PSRule.Rules.Rule' {
    $Assert.HasFieldValue($TargetObject, 'Info.Annotations.category')
    $Assert.HasFieldValue($TargetObject, 'Info.Annotations.pillar')
    $Assert.In($TargetObject, 'Info.Annotations.pillar', @(
        'Cost Optimization'
        'Operational Excellence'
        'Performance Efficiency'
        'Reliability'
        'Security'
    ))
}

# Synopsis: Use online help
Rule 'Rule.OnlineHelp' -Type 'PSRule.Rules.Rule' {
    $Assert.HasFieldValue($TargetObject, 'Info.Annotations.''online version''')
}

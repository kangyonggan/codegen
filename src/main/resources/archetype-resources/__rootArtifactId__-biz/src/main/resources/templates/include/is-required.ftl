<#assign isRequired=false/>
<#list columns as column>
    <#if column.field==columnName && !column.default??>
        <#assign isRequired=true/>
    </#if>
</#list>
${isRequired?string}
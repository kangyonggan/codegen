<#assign isString=false/>
<#list columns as column>
    <#if column.field==columnName && column.type?starts_with('varchar')>
        <#assign isString=true/>
        <#assign maxLength="${column.type?substring(column.type?index_of('(') + 1, column.type?length-1)}"/>
    </#if>
</#list>
<#if isString>,
                rangelength: [1, ${maxLength}]</#if>
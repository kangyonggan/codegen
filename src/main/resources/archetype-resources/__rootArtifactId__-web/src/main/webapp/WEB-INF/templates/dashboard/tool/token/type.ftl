<#list types as e>
<#if e.type==token.type>
    ${e.getName()}[${e.getType()}]
</#if>
</#list>
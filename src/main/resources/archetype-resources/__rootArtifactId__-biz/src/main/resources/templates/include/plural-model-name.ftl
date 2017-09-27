<#--倒数第二个字母-->
<#assign penult="${modelName?substring(modelName?length-2, modelName?length-1)}"/>
<#--倒数第一个字母-->
<#assign last="${modelName?substring(modelName?length-1, modelName?length)}"/>
<#if modelName?ends_with("s") || modelName?ends_with("x") || modelName?ends_with("ch") || modelName?ends_with("sh")>${modelName}es<#elseif !"aeiou"?contains(penult) && "y"==last >${modelName?substring(0, modelName?length-1)}ies<#elseif modelName?ends_with("f") || modelName?ends_with("fe")><#if last=='e'>${modelName?substring(0, modelName?length-1)}ves<#else>${modelName?substring(0, modelName?length-2)}ves</#if><#elseif !"aeiou"?contains(penult) && last=='o'>${modelName}es<#else>${modelName}s</#if>
<#list columns as column><#if column.field==columnName><#if column.type?starts_with("bigint")>Long<#elseif column.type?starts_with("integer")>Integer<#elseif column.type?starts_with("tinyint")>Byte<#elseif column.type?starts_with("timestamp")>Date<#else>String</#if></#if></#list>
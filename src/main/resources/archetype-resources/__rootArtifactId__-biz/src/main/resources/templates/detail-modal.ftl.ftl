${'<'}#assign modal_title="<#include "include/table-comment.ftl"/>详情" /${'>'}

${'<'}@override name="modal-body">
<table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
    <tbody>
    <#list step1.columns as columnName>
    <tr>
        <th <#if columnName_index==0>width="25%"</#if>><#include "include/field-comment.ftl"/></th>
        <#if columnName=='is_deleted'>
        <td <#if columnName_index==0>width="75%"</#if>>${'<'}#include "delete.ftl"/${'>'}</td>
        <#elseif columnName?ends_with('_time')>
        <td <#if columnName_index==0>width="75%"</#if>>${'<'}@c.relative_date datetime=${modelName?uncap_first}.<#include "include/field-name.ftl"/>/></td>
        <#else>
        <td <#if columnName_index==0>width="75%"</#if>>${'$'}{${modelName?uncap_first}.<#include "include/field-name.ftl"/>}</td>
        </#if>
    <tr>
    </#list>
    </tbody>
</table>
${'<'}/@override${'>'}

${'<'}@override name="modal-footer"${'>'}
<button class="btn btn-sm" data-dismiss="modal">
    <i class="ace-icon fa fa-times"></i>
    ${'<'}@s.message "app.button.close"/${'>'}
</button>
${'<'}/@override${'>'}

<#assign len=code.menuName?split("_")?size/>
${'<'}@extends name="../<#list 1..len as l>../</#list>modal-layout.ftl"/${'>'}
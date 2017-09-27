${'<'}#assign ctx="${"$"}{(rca.contextPath)!''}"${'>'}

<#list step1.searchColumns as columnName>
${'<'}#assign <#include "include/field-name.ftl"/>= RequestParameters.<#include "include/field-name.ftl"/>!'' /${'>'}
</#list>

<div class="page-header">
    <h1>
        <#include "include/table-comment.ftl"/>列表
        <small class="pull-right">
            <#if step1.addBtnType=='1'>
            <a href="${"$"}{ctx}/dashboard/${code.menuName?lower_case?replace('_', '/')}/create" class="btn btn-sm btn-inverse" data-backdrop="static" data-toggle="modal" data-target="#myModal">${step1.addBtnName}</a>
            <#else>
            <a href="#${code.menuName?lower_case?replace('_', '/')}/create" class="btn btn-sm btn-inverse">${step1.addBtnName}</a>
            </#if>
        </small>
    </h1>
</div>

<div class="space-10"></div>

<#if step1.searchColumns?size gt 0>
<form class="form-inline" method="get">
    <#list step1.searchColumns as columnName>
    <div class="form-group">
        <input type="text" class="form-control" name="<#include "include/field-name.ftl"/>" value="${"$"}{<#include "include/field-name.ftl"/>}" placeholder="<#include "include/field-comment.ftl"/>"/>
    </div>
    </#list>

    <button class="btn btn-sm btn-inverse" data-toggle="search-submit">
        搜索
        <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
    </button>
</form>

<div class="space-10"></div>
</#if>

<table id="${code.tableName}-table" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
    <#list step1.columns as columnName>
        <th><#include "include/field-comment.ftl"/></th>
    </#list>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    ${'<'}#if page.list?size gt 0>
        ${'<'}#list page.list as ${modelName?uncap_first}${'>'}
            ${'<'}#include "table-tr.ftl"/${'>'}
        ${'<'}/#list${'>'}
    ${'<'}#else${'>'}
    <tr>
        <td colspan="20">
            <div class="empty">暂无查询记录</div>
        </td>
    </tr>
    ${'<'}/#if${'>'}
    </tbody>
</table>
<#if step1.needPage=='on'>
${'<'}@c.pagination url="#${code.menuName?lower_case?replace('_', '/')}" param="<#list step1.searchColumns as columnName><#if columnName_index gt 0>&</#if><#include "include/field-name.ftl"/>=${'$'}{<#include "include/field-name.ftl"/>}</#list>"/${'>'}
</#if>

<script src="${"$"}{ctx}/static/app/js/dashboard/${code.menuName?lower_case?replace('_', '/')}/list.js"></script>


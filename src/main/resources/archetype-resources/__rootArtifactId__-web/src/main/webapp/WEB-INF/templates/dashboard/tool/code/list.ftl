<#assign ctx="${(rca.contextPath)!''}">

<div class="page-header">
    <h1>
        生成记录
        <small class="pull-right">
            <a href="${ctx}/dashboard/tool/code/create" class="btn btn-sm btn-inverse" data-toggle="modal" data-target="#myModal"
               data-backdrop="static">新增</a>
        </small>
    </h1>
</div>

<div class="space-10"></div>

<table id="code-table" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>ID</th>
        <th>表名称</th>
        <th>菜单名称</th>
        <th>基础包名</th>
        <th>创建人</th>
        <th>状态</th>
        <th>创建时间</th>
        <th>更新时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <#if page.list?size gt 0>
        <#list page.list as code>
            <#include "table-tr.ftl"/>
        </#list>
    <#else>
    <tr>
        <td colspan="20">
            <div class="empty">暂无查询记录</div>
        </td>
    </tr>
    </#if>
    </tbody>
</table>

<script src="${ctx}/static/app/js/dashboard/tool/code/list.js"></script>

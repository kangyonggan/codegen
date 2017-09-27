<#assign ctx="${(rca.contextPath)!''}">
<#assign type = RequestParameters.type!'' />
<#assign mobile = RequestParameters.mobile!'' />

<div class="page-header">
    <h1>
        验证码列表
    </h1>
</div>

<div class="space-10"></div>

<form class="form-inline" method="get" novalidate>
    <div class="form-group">
        <select name="type" class="form-control">
            <option value="">全部类型</option>
        <#list types as e>
            <option value="${e.getType()}" <#if type=='${e.getType()}'>selected</#if>>${e.getName()}</option>
        </#list>
        </select>
    </div>
    <div class="form-group">
        <input type="text" class="form-control" name="mobile" value="${mobile}" placeholder="手机号"/>
    </div>

    <button class="btn btn-sm btn-inverse" data-toggle="search-submit">
        搜索
        <span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
    </button>
</form>

<div class="space-10"></div>

<table id="token-table" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th>类型</th>
        <th>手机号</th>
        <th>验证码</th>
        <th>逻辑删除</th>
        <th>发送时间</th>
        <th>更新时间</th>
    </tr>
    </thead>
    <tbody>
    <#if page.list?size gt 0>
        <#list page.list as token>
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
<@c.pagination url="#tool/token" param="type=${type}&mobile=${mobile}"/>

<script src="${ctx}/static/app/js/dashboard/tool/token/list.js"></script>

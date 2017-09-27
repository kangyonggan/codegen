<#assign ctx="${(rca.contextPath)!''}">
<#assign modal_title="新增代码生成向导" />

<@override name="modal-body">
<form class="form-horizontal" role="form" id="modal-form" method="post"
      action="${ctx}/dashboard/tool/code/save">
    <div class="row">
        <div class="row form-group">
            <div class="col-md-3 control-label">
                <label>数据库表</label>
            </div>
            <div class="col-md-7 controls">
                <select class="form-control" name="tableName">
                    <#list tables as table>
                        <option value="${table.tableName}">${table.tableComment}[${table.tableName}]</option>
                    </#list>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="row form-group">
            <div class="col-md-3 control-label">
                <label>关联菜单</label>
            </div>
            <div class="col-md-7 controls">
                <select class="form-control" name="menuName">
                    <#list menus as menu>
                        <option value="${menu.code}">${menu.name}[${menu.code}]</option>
                    </#list>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="row form-group">
            <div class="col-md-3 control-label">
                <label>基础包名<span class="red">*</span></label>
            </div>
            <div class="col-md-7 controls">
                <input type="text" name="packageName" value="${packageName!''}" class="form-control" placeholder="请输入基础包名"/>
            </div>
        </div>
    </div>
</form>
</@override>

<@override name="modal-footer">
<button class="btn btn-sm" data-dismiss="modal">
    <i class="ace-icon fa fa-times"></i>
    <@s.message "app.button.cancel"/>
</button>

<button class="btn btn-sm btn-inverse" id="submit" data-loading-text="正在<@s.message "app.button.save"/>..." data-toggle="form-submit" data-target="#modal-form">
    <i class="ace-icon fa fa-check"></i>
    <@s.message "app.button.save"/>
</button>

<script src="${ctx}/static/app/js/dashboard/tool/code/form-modal.js"></script>
</@override>

<@extends name="../../../modal-layout.ftl"/>
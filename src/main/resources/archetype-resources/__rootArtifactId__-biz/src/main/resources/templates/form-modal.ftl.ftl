${'<'}#assign modal_title="${'$'}{${modelName?uncap_first}.id???string('编辑', '${step1.addBtnName}')}<#include "include/table-comment.ftl"/>" /${'>'}

${'<'}@override name="modal-body"${'>'}
<form class="form-horizontal" role="form" id="${code.tableName}-form" method="post"
      action="${'$'}{ctx}/dashboard/${code.menuName?lower_case?replace('_', '/')}/${'$'}{${modelName?uncap_first}.id???string('update', 'save')}">
    ${'<'}#if ${modelName?uncap_first}.id??${'>'}
        <input type="hidden" name="id" value="${'$'}{${modelName?uncap_first}.id}"/>
    ${'<'}/#if${'>'}

    <#list step2.formColumns as columnName>
    <div class="row">
        <div class="row form-group">
            <div class="col-md-3 control-label">
                <label for="<#include "include/field-name.ftl"/>"><#include "include/field-comment.ftl"/><#include "include/required.ftl"/></label>
            </div>
            <div class="col-md-7 controls">
            ${'<'}@s.formInput "${modelName?uncap_first}.<#include "include/field-name.ftl"/>" 'class="form-control" placeholder="请输入<#include "include/field-comment.ftl"/>"' /${'>'}
            </div>
        </div>
    </div>

    </#list>
${'<'}/@override>

${'<'}@override name="modal-footer">
    <button class="btn btn-sm" data-dismiss="modal">
        <i class="ace-icon fa fa-times"></i>
        ${'<'}@s.message "app.button.cancel"/>
    </button>

<button class="btn btn-sm btn-inverse" id="submit" data-loading-text="正在${'<'}@s.message "app.button.save"/${'>'}..." data-toggle="form-submit"
        data-target="#${code.tableName}-form">
    <i class="ace-icon fa fa-check"></i>
    ${'<'}@s.message "app.button.save"/${'>'}

    <script src="${'$'}{ctx}/static/app/js/dashboard/${code.menuName?lower_case?replace('_', '/')}/form-modal.js"></script>
${'<'}/@override${'>'}

<#assign len=code.menuName?split("_")?size/>
${'<'}@extends name="../<#list 1..len as l>../</#list>modal-layout.ftl"/${'>'}
<#assign formName="${(step1.addBtnType=='0')?string('form', 'form-modal')}"/>
${'<'}#assign ctx="${'$'}{(rca.contextPath)!''}"${'>'}
<div class="page-header">
    <h1>
    ${'$'}{${modelName?uncap_first}.id???string('编辑', '${step1.addBtnName}')}<#include "include/table-comment.ftl"/>
    </h1>
</div>

<div class="col-xs-12">
    <form id="${code.tableName}-form" method="post" class="form-horizontal" action="${'$'}{ctx}/dashboard/${code.menuName?lower_case?replace('_', '/')}/${'$'}{${modelName?uncap_first}.id???string('update', 'save')}">

    ${'<'}#if ${modelName?uncap_first}.id??${'>'}
        <input type="hidden" name="id" value="${'$'}{${modelName?uncap_first}.id}"/>
    ${'<'}/#if${'>'}

        <#list step2.formColumns as columnName>
        <div class="form-group">
            <label for="<#include "include/field-name.ftl"/>" class="col-sm-3 control-label no-padding-right"><#include "include/field-comment.ftl"/><#include "include/required.ftl"/></label>
            <div class="col-xs-12 col-sm-5">
            ${'<'}@s.formInput "${modelName?uncap_first}.<#include "include/field-name.ftl"/>" 'class="form-control" placeholder="请输入<#include "include/field-comment.ftl"/>"' /${'>'}
            </div>
        </div>
        </#list>

        <div class="clearfix form-actions">
            <div class="col-xs-10 align-center">
                <button class="btn btn-inverse" id="submit" data-toggle="form-submit" data-loading-text="正在${'<'}@s.message "app.button.save"/${'>'}...">
                    <i class="ace-icon fa fa-check bigger-110"></i>
                ${'<'}@s.message "app.button.save"/${'>'}
                </button>
            </div>
        </div>
    </form>
</div>

<script src="${'$'}{ctx}/static/app/js/dashboard/${code.menuName?lower_case?replace('_', '/')}/${formName}.js"></script>
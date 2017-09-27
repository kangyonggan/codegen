<#assign ctx="${(rca.contextPath)!''}">

<link rel="stylesheet" href="${ctx}/static/ace/dist/css/select2.min.css"/>

<div class="page-header">
    <h1>
    ${table.tableComment}
    </h1>
</div>

<div class="space-10"></div>

<div class="row">
    <div class="col-xs-12">
        <div class="widget-box">
            <div class="widget-header widget-header-blue widget-header-flat">
                <h4 class="widget-title lighter">生成向导</h4>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <div id="fuelux-wizard-container">
                        <div>
                            <ul class="steps">
                                <li data-step="1" class="active">
                                    <span class="step">1</span>
                                    <span class="title">列表界面</span>
                                </li>

                                <li data-step="2">
                                    <span class="step">2</span>
                                    <span class="title">表单界面</span>
                                </li>

                                <li data-step="3">
                                    <span class="step">3</span>
                                    <span class="title">详情界面</span>
                                </li>

                                <li data-step="4">
                                    <span class="step">4</span>
                                    <span class="title">完成</span>
                                </li>
                            </ul>
                        </div>

                        <hr/>

                        <div class="step-content pos-rel">
                        <#include "step1.ftl">

                        <#include "step2.ftl">

                        <#include "step3.ftl">
                            <div class="step-pane" data-step="4">
                                <div class="alert alert-block alert-success">
                                    <p>
                                        <strong>
                                            <i class="ace-icon fa fa-check"></i>
                                            恭喜!
                                        </strong>
                                        您已经完成了代码生成的配置，请点击"完成"结束所有配置操作。
                                    </p>
                                </div>
                            </div>
                        </div>

                        <form id="finish-form" action="${ctx}/dashboard/tool/code/finish" method="post">
                            <input name="codeId" value="${code.id}" type="hidden"/>
                        </form>
                    </div>

                    <div class="clearboth"></div>

                    <hr/>

                    <div class="wizard-actions">
                        <button class="btn btn-prev">
                            <i class="ace-icon fa fa-arrow-left"></i>
                            上一步
                        </button>

                        <button class="btn btn-inverse btn-next" data-last="Finish">
                            下一步
                            <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // 表格的列
    var columns = [];
    var tempIndex = 0;
    <#list columns as column>
        <#if step1.columns??>
            <#if step1.columns?seq_contains(column.field)>
            columns[tempIndex++] = {"field": "${column.field}", "comment": "${column.comment}"};
            </#if>
        <#else>
        columns[tempIndex++] = {"field": "${column.field}", "comment": "${column.comment}"};
        </#if>
    </#list>

    // 搜索的列
    var searchColumns = [];
    tempIndex = 0;
    <#list columns as column>
        <#if column.field != 'id' && column.field != 'is_deleted' && column.field != 'created_time' && column.field != 'updated_time'>
            <#if step1.searchColumns??>
                <#if step1.searchColumns?seq_contains(column.field)>
                searchColumns[tempIndex++] = {"field": "${column.field}", "comment": "${column.comment}"};
                </#if>
            </#if>
        </#if>
    </#list>

    // 表单的列
    var formColumns = [];
    tempIndex = 0;
    <#list columns as column>
        <#if column.field != 'id' && column.field != 'is_deleted' && column.field != 'created_time' && column.field != 'updated_time'>
            <#if step2.formColumns??>
                <#if step2.formColumns?seq_contains(column.field)>
                formColumns[tempIndex++] = {"field": "${column.field}", "comment": "${column.comment}"};
                </#if>
            <#else>
            formColumns[tempIndex++] = {"field": "${column.field}", "comment": "${column.comment}"};
            </#if>
        </#if>
    </#list>

    // 详情的列
    var detailColumns = [];
    tempIndex = 0;
    <#list columns as column>
        <#if step3.detailColumns??>
            <#if step3.detailColumns?seq_contains(column.field)>
            detailColumns[tempIndex++] = {"field": "${column.field}", "comment": "${column.comment}"};
            </#if>
        <#else>
        detailColumns[tempIndex++] = {"field": "${column.field}", "comment": "${column.comment}"};
        </#if>
    </#list>
</script>
<script src="${ctx}/static/ace/dist/js/select2.min.js"></script>
<script src="${ctx}/static/ace/dist/js/fuelux/fuelux.wizard.min.js"></script>
<script src="${ctx}/static/app/js/dashboard/tool/code/generate.js"></script>

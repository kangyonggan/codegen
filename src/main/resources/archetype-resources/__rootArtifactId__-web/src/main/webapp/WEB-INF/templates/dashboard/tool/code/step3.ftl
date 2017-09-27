<div class="step-pane" data-step="3">
    <div class="col-sm-6 col-xs-12">
        <div class="widget-box">
            <div class="widget-header">
                <h4 class="widget-title">
                    <i class="ace-icon fa fa-cogs"></i>
                    配置详情界面
                </h4>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <form class="form-horizontal" id="step3-form" action="${ctx}/dashboard/tool/code/step3"
                          method="post">
                        <input name="codeId" value="${code.id}" type="hidden"/>

                        <div class="form-group">
                            <label class="col-xs-12 col-sm-4 control-label no-padding-right">选择显示字段
                                <span class="red">*</span>
                            </label>

                            <div class="col-xs-12 col-sm-8">
                                <select multiple="" id="detailColumns" name="detailColumns" class="select2"
                                        data-placeholder="选择显示字段...">
                                <#list columns as column>
                                    <#if step3.detailColumns??>
                                        <#if step3.detailColumns?seq_contains(column.field)>
                                            <option value="${column.field}" selected>${column.comment}</option>
                                        <#else>
                                            <option value="${column.field}">${column.comment}</option>
                                        </#if>
                                    <#else>
                                        <option value="${column.field}" selected>${column.comment}</option>
                                    </#if>
                                </#list>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="space-30 hidden-lg hidden-md hidden-sm"></div>

<#include "step3-priview.ftl">
</div>
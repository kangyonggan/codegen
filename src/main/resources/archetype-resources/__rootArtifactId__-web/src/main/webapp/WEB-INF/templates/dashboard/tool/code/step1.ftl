<div class="step-pane active" data-step="1">
    <div class="col-sm-6 col-xs-12">
        <div class="widget-box">
            <div class="widget-header">
                <h4 class="widget-title">
                    <i class="ace-icon fa fa-cogs"></i>
                    配置列表界面
                </h4>
            </div>

            <div class="widget-body">
                <div class="widget-main">
                    <form class="form-horizontal" id="step1-form" action="${ctx}/dashboard/tool/code/step1"
                          method="post">
                        <input name="codeId" value="${code.id}" type="hidden"/>

                        <div class="form-group">
                            <label class="col-xs-12 col-sm-4 control-label no-padding-right">界面名称<span
                                    class="red">*</span></label>

                            <div class="col-xs-12 col-sm-8">
                                <input type="text" id="pageName" name="pageName" class="form-control"
                                       value="${step1.pageName!'${table.tableComment?substring(0, table.tableComment?length-1)}列表'}"
                                       placeholder="请输入界面名称">
                            </div>
                        </div>

                        <div class="form-group" id="topBtnName">
                            <label class="col-xs-12 col-sm-4 control-label no-padding-right">按钮名称<span
                                    class="red">*</span></label>
                            <div class="col-xs-12 col-sm-8">
                                <input type="text" class="form-control" id="addBtnName" name="addBtnName"
                                       value="${step1.addBtnName!'新增'}"
                                       placeholder="请输入新增按钮的名称"/>
                            </div>
                        </div>

                        <div class="form-group" id="topBtnType">
                            <label class="col-xs-12 col-sm-4 control-label no-padding-right">
                                按钮模式
                            </label>

                            <div class="col-xs-12 col-sm-8">
                                <div class="space-4"></div>
                                <label>
                                    <input name="addBtnType" value="0"
                                           <#if !step1.addBtnType?? || step1.addBtnType=='0'>checked</#if> type="radio"
                                           class="ace">
                                    <span class="lbl"> 界面跳转 </span>
                                </label>

                                <label>
                                    <input name="addBtnType"
                                           <#if step1.addBtnType?? && step1.addBtnType=='1'>checked</#if> value="1"
                                           type="radio" class="ace">
                                    <span class="lbl"> 弹出层</span>
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-12 col-sm-4 control-label no-padding-right">是否需要分页功能</label>

                            <div class="col-xs-12 col-sm-8">
                                <div class="col-xs-3">
                                    <div class="space-4"></div>
                                    <label>
                                        <input name="needPage" id="needPage" class="ace ace-switch ace-switch-2" checked
                                               type="checkbox">
                                        <span class="lbl"></span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-12 col-sm-4 control-label no-padding-right">表格的列<span
                                    class="red">*</span></label>

                            <div class="col-xs-12 col-sm-8">
                                <select multiple="" id="columns" name="columns" class="select2"
                                        data-placeholder="选择想要显示的列...">
                                <#list columns as column>
                                    <#if step1.columns??>
                                        <#if step1.columns?seq_contains(column.field)>
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

                        <div class="form-group">
                            <label class="col-xs-12 col-sm-4 control-label no-padding-right">搜索的列</label>

                            <div class="col-xs-12 col-sm-8">
                                <select multiple="" id="searchColumns" name="searchColumns" class="select2"
                                        data-placeholder="选择想要搜索的列...">
                                <#list columns as column>
                                    <#if column.field != 'id' && column.field != 'is_deleted' && column.field != 'created_time' && column.field != 'updated_time'>
                                        <#if step1.searchColumns??>
                                            <#if step1.searchColumns?seq_contains(column.field)>
                                                <option value="${column.field}" selected>${column.comment}</option>
                                            <#else>
                                                <option value="${column.field}">${column.comment}</option>
                                            </#if>
                                        <#else>
                                            <option value="${column.field}">${column.comment}</option>
                                        </#if>
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

<#include "step1-priview.ftl">
</div>
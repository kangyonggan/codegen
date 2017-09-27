$(function () {
    updateState("${code.menuName?lower_case?replace('_', '/')}");

    var $form = $('#${code.tableName}-form');
    var $btn = $("#submit");

    // 表单校验
    $form.validate({
        rules: {
        <#list step2.formColumns as columnName>
            <#include "include/field-name.ftl"/>: {
                required: <#include "include/is-required.ftl"/><#include "include/rangelength.ftl"/>
            }<#if columnName_has_next>,</#if>
        </#list>
        },
        submitHandler: function (form, event) {
            event.preventDefault();
            $btn.button('loading');
            $(form).ajaxSubmit({
                dataType: 'json',
                success: function (response) {
                    if (response.errCode == 'success') {
                        <#if step1.addBtnType=='1'>
                        window.location.reload();
                        <#else>
                        window.location.href = ctx + "/dashboard#${code.menuName?lower_case?replace('_', '/')}";
                        </#if>
                    } else {
                        Message.error(response.errMsg);
                    }
                    $btn.button('reset');
                },
                error: function () {
                    Message.error("服务器内部错误，请稍后再试。");
                    $btn.button('reset');
                }
            });
        },
        errorPlacement: function (error, element) {
            error.appendTo(element.parent());
        },
        errorElement: "div",
        errorClass: "error"
    });
});
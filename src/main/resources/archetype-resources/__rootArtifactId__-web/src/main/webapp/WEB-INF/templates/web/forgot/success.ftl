<#assign ctx="${(rca.contextPath)!''}">
<#assign mobile = RequestParameters.mobile!'' />

<@override name="content">
<div class="alert alert-block alert-success">
    <p class="center">
        <strong>
            <i class="ace-icon fa fa-check"></i>
            找回密码成功！！！
        </strong>
        对应的手机号码为${mobile}
    </p>

    <p class="center">
        <a class="btn btn-sm btn-success" href="#index" id="to-login">去登录(5s)</a>
    </p>
</div>
</@override>

<@override name="script">
<script src="${ctx}/static/app/js/web/forgot/success.js"></script>
</@override>

<@extends name="../auth-layout.ftl"/>
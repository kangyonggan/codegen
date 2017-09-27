<#assign ctx="${(rca.contextPath)!''}">

<@override name="content">
<div id="login-box" class="login-box visible widget-box no-border">
    <div class="widget-body">
        <div class="widget-main">
            <h4 class="header grey lighter bigger">
                <i class="ace-icon fa fa-coffee dark"></i>
                注册
            </h4>

            <div class="space-6"></div>

            <form id="register-form" action="${ctx}/user/register" method="post" novalidate="novalidate">
                <div>
                    <label for="username">手机号<span class="red">*</span></label>
                    <div class="input-icon input-icon-right">
                        <input type="text" id="username" name="username" class="form-control"
                               placeholder="请输入可以正常接收短信的手机号" autocomplete="off"/>
                        <i class="ace-icon fa fa-user"></i>
                    </div>
                </div>

                <div class="space space-8"></div>

                <div>
                    <label for="password">密码<span class="red">*</span></label>
                    <div class="input-icon input-icon-right">
                        <input type="password" id="password" name="password" class="form-control"
                               placeholder="8至20位的字母和数字的组合" autocomplete="off">
                        <i class="ace-icon fa fa-key"></i>
                    </div>
                </div>

                <div class="space space-8"></div>

                <div>
                    <label for="password">确认密码<span class="red">*</span></label>
                    <div class="input-icon input-icon-right">
                        <input type="password" name="rePassword" class="form-control"
                               placeholder="8至20位的字母和数字的组合" autocomplete="off">
                        <i class="ace-icon fa fa-key"></i>
                    </div>
                </div>

                <div class="space space-8"></div>

                <div>
                    <label for="captcha">短信验证码<span class="red">*</span></label>
                    <div class="input-icon input-icon-right">
                        <input type="text" id="captcha" name="captcha" class="col-xs-9" placeholder="请输入4位数字的短信验证码" autocomplete="off">
                        <a href="javascript:" class="col-xs-3 btn btn-sm btn-grey" id="sendSms"><i class='ace-icon fa fa-mobile bigger-130'></i>获取</a>
                    </div>
                </div>

                <div class="space-14 clearboth"></div>

                <div class="clearfix">
                    <button id="reset" type="reset" class="width-30 pull-left btn btn-sm">
                        <i class="ace-icon fa fa-refresh"></i>
                        重置
                    </button>
                    <button id="submit" class="width-35 pull-right btn btn-sm btn-inverse"
                            data-loading-text="正在注册...">
                        <i class="ace-icon fa fa-key"></i>
                        注册
                    </button>
                </div>
            </form>
        </div>

        <div class="toolbar clearfix">
            <div>
                <a href="#index" class="forgot-password-link">
                    <i class="ace-icon fa fa-arrow-left"></i>
                    已有账号？去登录
                </a>
            </div>
        </div>
    </div>
</div>
</@override>

<@override name="script">
<script src="${ctx}/static/app/js/web/register/index.js"></script>
</@override>

<@extends name="../auth-layout.ftl"/>
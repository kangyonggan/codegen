<#assign ctx="${(rca.contextPath)!''}">

<@override name="content">
<div id="login-box" class="login-box visible widget-box no-border">
    <div class="widget-body">
        <div class="widget-main">
            <h4 class="header grey lighter bigger">
                <i class="ace-icon fa fa-coffee dark"></i>
                忘记密码
            </h4>

            <div class="space-6"></div>

            <form id="forgot-form" action="${ctx}/user/forgot" method="post" novalidate="novalidate">
                <div>
                    <label for="username">手机号<span class="red">*</span></label>
                    <div class="input-icon input-icon-right">
                        <input type="text" id="username" name="username" class="form-control"
                               placeholder="请输入您要找回密码的手机号" autocomplete="off"/>
                        <i class="ace-icon fa fa-user"></i>
                    </div>
                </div>

                <div class="space space-8"></div>

                <div>
                    <label for="password">新密码<span class="red">*</span></label>
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
                        <input type="text" id="captcha" name="captcha" class="col-xs-9" placeholder="请输入4位数字的短信验证码"
                               autocomplete="off">
                        <a href="javascript:" class="col-xs-3 btn btn-sm btn-grey" id="sendSms"><i
                                class='ace-icon fa fa-mobile bigger-130'></i>获取</a>
                    </div>
                </div>

                <div class="space-14 clearboth"></div>

                <div class="clearfix">
                    <button id="reset" type="reset" class="width-30 pull-left btn btn-sm">
                        <i class="ace-icon fa fa-refresh"></i>
                        重置
                    </button>
                    <button id="submit" class="width-35 pull-right btn btn-sm btn-inverse"
                            data-loading-text="正在找回...">
                        <i class="ace-icon fa fa-key"></i>
                        找回密码
                    </button>
                </div>
            </form>
        </div>

        <div class="toolbar clearfix">
            <div>
                <a href="#register" class="forgot-password-link">
                    <i class="ace-icon fa fa-arrow-left"></i>
                    重新注册
                </a>
            </div>
            <div>
                <a href="#register" class="user-signup-link">
                    记得密码？去登录
                    <i class="ace-icon fa fa-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>
</div>
</@override>

<@override name="script">
<script src="${ctx}/static/app/js/web/forgot/index.js"></script>
</@override>

<@extends name="../auth-layout.ftl"/>
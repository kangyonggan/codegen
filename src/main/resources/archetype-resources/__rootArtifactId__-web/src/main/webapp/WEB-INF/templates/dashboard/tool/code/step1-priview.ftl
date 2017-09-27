<div class="col-sm-6 col-xs-12">
    <div class="widget-box">
        <div class="widget-header">
            <h4 class="widget-title">
                <i class="ace-icon fa fa-eye"></i>
                实时预览
            </h4>
        </div>

        <div class="widget-body">
            <div class="widget-main">
                <div class="page-header">
                    <h1>
                        <span class="pageNumDisp">${step1.pageName!'${table.tableComment?substring(0, table.tableComment?length-1)}列表'}</span>
                        <small class="pull-right" id="topBtnGroup">
                            <a href="javascript:" class="btn btn-inverse btn-sm btnNameDisp">${step1.addBtnName!'新增'}</a>
                        </small>
                    </h1>
                </div>

                <div class="space-10"></div>

                <form class="form-inline" id="search-form" method="get" novalidate>

                </form>

                <div class="space-10"></div>

                <table class="demo-table table table-striped table-bordered table-hover">
                    <thead>
                    <tr id="columns-header">

                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td colspan="20">
                            <div class="empty">暂无查询记录</div>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <div class="pageDisp">
                    <div class="pull-right">
                        <ul class="pagination">
                            <li><a href="javascript:" class="page-info">第 1~10 条, 共 23 条,
                                第 1 页,
                                共 3 页</a></li>
                        </ul>
                    </div>
                    <div class="pull-left">
                        <ul class="pagination">
                            <li>
                                <a href="javascript:">
                                    <i class="ace-icon fa fa-angle-double-left"></i>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:">
                                    <i class="ace-icon fa fa-angle-left"></i>
                                </a>
                            </li>

                        <#list 1..3 as nav>
                            <#if nav == 1>
                                <li class="active">
                                    <a href="javascript:">${nav}</a>
                                </li>
                            <#else>
                                <li>
                                    <a href="javascript:">${nav}</a>
                                </li>
                            </#if>
                        </#list>
                            <li>
                                <a href="javascript:">
                                    <i class="ace-icon fa fa-angle-right"></i>
                                </a>
                            </li>

                            <li>
                                <a href="javascript:">
                                    <i class="ace-icon fa fa-angle-double-right"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="clearboth"></div>
            </div>
        </div>
    </div>
</div>

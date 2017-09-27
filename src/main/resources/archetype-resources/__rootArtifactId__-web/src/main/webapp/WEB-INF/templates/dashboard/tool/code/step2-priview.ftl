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
                <div class="form-horizontal" role="form">
                    <div class="page-header">
                        <h1>
                        ${step1.addBtnName}${table.tableComment?substring(0, table.tableComment?length-1)}
                        </h1>
                    </div>

                    <div id="form-container"></div>

                    <div class="center">
                        <button class="btn btn-sm btn-inverse">
                            <i class="ace-icon fa fa-check"></i>
                            <span><@s.message "app.button.save"/></span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

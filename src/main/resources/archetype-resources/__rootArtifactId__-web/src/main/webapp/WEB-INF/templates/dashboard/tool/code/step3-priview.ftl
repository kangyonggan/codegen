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
                    ${table.tableComment?substring(0, table.tableComment?length-1)}详情
                    </h1>
                </div>

                <table class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
                    <tbody id="detail-container">
                    </tbody>
                </table>

                <div class="space-10"></div>

                <div class="center">
                    <button class="btn btn-sm" data-dismiss="modal">
                        <i class="ace-icon fa fa-times"></i>
                    <@s.message "app.button.close"/>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

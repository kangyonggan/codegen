${'<'}#if ${modelName?uncap_first}.isDeleted == 1${'>'}
<a href="javascript:" data-role="${code.tableName}-delete" title="恢复<#include "include/table-comment.ftl"/>"
   data-url="${'$'}{ctx}/dashboard/${code.menuName?lower_case?replace('_', '/')}/${'$'}{${modelName?uncap_first}.id}/undelete">
    <span class="label label-danger arrowed-in">已删除</span>
</a>
${'<'}#else${'>'}
<a href="javascript:" data-role="${code.tableName}-delete" title="删除<#include "include/table-comment.ftl"/>"
   data-url="${'$'}{ctx}/dashboard/${code.menuName?lower_case?replace('_', '/')}/${'$'}{${modelName?uncap_first}.id}/delete">
    <span class="label label-success arrowed-in">未删除</span>
</a>
${'<'}/#if${'>'}
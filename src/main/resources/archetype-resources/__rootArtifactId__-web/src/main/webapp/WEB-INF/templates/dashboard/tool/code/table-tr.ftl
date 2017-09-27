<#assign ctx="${(rca.contextPath)!''}">

<tr id="code-${code.id}">
    <td>${code.id}</td>
    <td>${code.tableName}</td>
    <td>${code.menuName}</td>
    <td>${code.packageName}</td>
    <td>${code.createdUsername}</td>
    <td><#include "status.ftl"/></td>
    <td><@c.relative_date datetime=code.createdTime/></td>
    <td><@c.relative_date datetime=code.updatedTime/></td>
    <td>
        <div class="btn-group">
            <a class="btn btn-xs btn-inverse" href="#tool/code/${code.id}">生成向导</a>

            <button data-toggle="dropdown" class="btn btn-xs btn-inverse dropdown-toggle">
                <span class="ace-icon fa fa-caret-down icon-only"></span>
            </button>

            <ul class="dropdown-menu dropdown-menu-right dropdown-inverse">
                <#if code.status=='complete'>
                    <li>
                        <a href="javascript:" data-role="code-tr" title="生成代码"
                           data-url="${ctx}/dashboard/tool/code/${code.id}/generate">
                            一键生成
                        </a>
                    </li>
                <#else>
                    <li>
                        <a href="javascript:" data-role="code-tr" title="重置配置"
                           data-url="${ctx}/dashboard/tool/code/${code.id}/reset">
                            重置配置
                        </a>
                    </li>
                </#if>
            </ul>
        </div>
    </td>
</tr>

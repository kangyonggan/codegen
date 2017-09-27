package ${servicePackage};


import ${modelPackage}.${modelName};

import java.util.List;

/**
 * <#include "include/table-comment.ftl"/>相关的业务逻辑接口定义
 *
 * @author ${author}
 */
public interface ${modelName}Service {

    /**
     * 搜索<#include "include/table-comment.ftl"/>
     *
    <#if step1.needPage=='on'>
     * @param pageNum 当前页码
    </#if>
    <#list step1.searchColumns as column>
     * @param ${column} <#include "include/column-comment.ftl"/>
    </#list>
     * @return
     */
    List<${modelName}> search<#include "include/plural-model-name.ftl">(<#if step1.needPage=='on'>int pageNum</#if><#list step1.searchColumns as columnName><#if step1.needPage=='on' || columnName_index gt 0>, </#if><#include "include/field-type2.ftl"/> <#include "include/field-name.ftl"/></#list>);

    /**
     * 查找<#include "include/table-comment.ftl"/>，包含逻辑删除的
     *
     * @param id 主键
     * @return
     */
    ${modelName} get${modelName}(Long id);

    /**
     * 查找<#include "include/table-comment.ftl"/>，不包含逻辑删除的
     *
     * @param id 主键
     * @return
     */
    ${modelName} find${modelName}ById(Long id);

    /**
     * 保存<#include "include/table-comment.ftl"/>，只保存不为null的字段
     *
     * @param ${modelName?uncap_first} <#include "include/table-comment.ftl"/>
     */
    void save${modelName}(${modelName} ${modelName?uncap_first});

    /**
     * 更新<#include "include/table-comment.ftl"/>，只更新不为null的字段
     *
     * @param ${modelName?uncap_first} <#include "include/table-comment.ftl"/>
     */
    void update${modelName}(${modelName} ${modelName?uncap_first});

    /**
     * 删除<#include "include/table-comment.ftl"/>
     *
     * @param id 主键
     */
    void delete${modelName}(Long id);
}

package ${modelPackage};

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * <#include "include/table-comment.ftl"/>对应的实体
 *
 * @author ${author}
 */
@Data
@Table(name = "${code.tableName}")
public class ${modelName} implements Serializable {
    <#list columns as column>

    /**
     * ${column.comment}
     */
    <#if column.field=='id'>
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    </#if>
    <#if column.field?contains("_")>
    @Column(name = "${column.field}")
    </#if>
    <#assign columnName=column.field/>
    private <#include "include/field-type.ftl"/> <#include "include/field-name.ftl"/>;
    </#list>

    private static final long serialVersionUID = 1L;
}
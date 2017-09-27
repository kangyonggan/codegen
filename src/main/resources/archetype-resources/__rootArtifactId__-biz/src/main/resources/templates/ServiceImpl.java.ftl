package ${serviceImplPackage};

import com.github.pagehelper.PageHelper;
import ${servicePackage}.${modelName}Service;
import ${code.packageName}.model.annotation.LogTime;
import ${code.packageName}.model.constants.AppConstants;
import ${modelPackage}.${modelName};
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * <#include "include/table-comment.ftl"/>相关的业务逻辑接口的实现
 *
 * @author ${author}
 */
@Service
public class ${modelName}ServiceImpl extends BaseService<${modelName}> implements ${modelName}Service {

    @Override
    public List<${modelName}> search<#include "include/plural-model-name.ftl">(<#if step1.needPage=='on'>int pageNum</#if><#list step1.searchColumns as columnName><#if step1.needPage=='on' || columnName_index gt 0>, </#if><#include "include/field-type2.ftl"/> <#include "include/field-name.ftl"/></#list>) {
        Example example = new Example(${modelName}.class);

        <#if step1.searchColumns?size gt 0>
        Example.Criteria criteria = example.createCriteria();
        </#if>
        <#list step1.searchColumns as columnName>
        if (StringUtils.isNotEmpty(<#include "include/field-name.ftl"/>)) {
            criteria.andEqualTo("<#include "include/field-name.ftl"/>", <#include "include/field-name.ftl"/>);
        }
        </#list>

        example.selectProperties("id"<#list step1.columns as columnName><#if columnName!='id'>, "<#include "include/field-name.ftl"/>"</#if></#list>);
        example.setOrderByClause("id desc");

        <#if step1.needPage=='on'>
        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        </#if>
        return myMapper.selectByExample(example);
    }

    @Override
    @LogTime
    public ${modelName} get${modelName}(Long id) {
        return myMapper.selectByPrimaryKey(id);
    }

    @Override
    @LogTime
    public ${modelName} find${modelName}ById(Long id) {
        ${modelName} ${modelName?uncap_first} = new ${modelName}();
        ${modelName?uncap_first}.setId(id);
        ${modelName?uncap_first}.setIsDeleted(AppConstants.IS_DELETED_NO);

        return myMapper.selectOne(${modelName?uncap_first});
    }

    @Override
    @LogTime
    public void save${modelName}(${modelName} ${modelName?uncap_first}) {
        myMapper.insertSelective(${modelName?uncap_first});
    }

    @Override
    @LogTime
    public void update${modelName}(${modelName} ${modelName?uncap_first}) {
        myMapper.updateByPrimaryKeySelective(${modelName?uncap_first});
    }

    @Override
    @LogTime
    public void delete${modelName}(Long id) {
        myMapper.deleteByPrimaryKey(id);
    }
}

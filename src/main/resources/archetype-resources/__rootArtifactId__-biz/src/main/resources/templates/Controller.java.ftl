package ${controllerPackage};

import com.github.pagehelper.PageInfo;
import ${code.packageName}.biz.service.${modelName}Service;
import ${modelPackage}.${modelName};
import ${code.packageName}.web.controller.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * <#include "include/table-comment.ftl"/>相关的请求控制
 *
 * @author ${author}
 */
@Controller
@RequestMapping("dashboard/${code.menuName?lower_case?replace('_', '/')}")
public class Dashboard<#assign list=code.menuName?lower_case?split("_")/><#list list as str>${str?cap_first}</#list>Controller extends BaseController {

    @Autowired
    private ${modelName}Service ${modelName?uncap_first}Service;

    /**
     * <#include "include/table-comment.ftl"/>列表
     *
     <#if step1.needPage=='on'>
     * @param pageNum 当前页码
     </#if>
     <#list step1.searchColumns as column>
     * @param ${column} <#include "include/column-comment.ftl"/>
     </#list>
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("${code.menuName}")
    public String list(<#if step1.needPage=='on'>@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum</#if><#if step1.searchColumns?size gt 0>,</#if>
                       <#list step1.searchColumns as columnName>
                       @RequestParam(value = "<#include "include/field-name.ftl"/>", required = false, defaultValue = "") <#include "include/field-type2.ftl"/> <#include "include/field-name.ftl"/>,
                       </#list>
                       Model model) {
        List<${modelName}> ${modelName?uncap_first}List = ${modelName?uncap_first}Service.search<#include "include/plural-model-name.ftl">(<#if step1.needPage=='on'>pageNum</#if><#list step1.searchColumns as columnName><#if step1.needPage=='on' || columnName_index gt 0>, </#if><#include "include/field-name.ftl"/></#list>);
        PageInfo<${modelName}> page = new PageInfo(${modelName?uncap_first}List);

        model.addAttribute("page", page);
        return getPathList();
    }

    /**
     * ${step1.addBtnName}
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "create", method = RequestMethod.GET)
    @RequiresPermissions("${code.menuName}")
    public String create(Model model) {
        model.addAttribute("${modelName?uncap_first}", new ${modelName}());
        <#if step1.addBtnType=='1'>
        return getPathFormModal();
        <#else>
        return getPathForm();
        </#if>
    }

    /**
     * 保存
     *
     * @param ${modelName?uncap_first}
     * @param result
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @RequiresPermissions("${code.menuName}")
    @ResponseBody
    public Map<String, Object> save(@ModelAttribute("${modelName?uncap_first}") @Valid ${modelName} ${modelName?uncap_first}, BindingResult result) {
        Map<String, Object> resultMap = getResultMap();

        if (!result.hasErrors()) {
            ${modelName?uncap_first}Service.save${modelName}(${modelName?uncap_first});
        } else {
            setResultMapFailure(resultMap);
        }

        return resultMap;
    }

    /**
     * 逻辑删除/恢复
     *
     * @param id
     * @param isDeleted
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/{isDeleted:\\bundelete\\b|\\bdelete\\b}", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    @RequiresPermissions("${code.menuName}")
    public String delete(@PathVariable("id") Long id, @PathVariable("isDeleted") String isDeleted, Model model) {
        ${modelName} ${modelName?uncap_first} = ${modelName?uncap_first}Service.get${modelName}(id);
        ${modelName?uncap_first}.setIsDeleted((byte) (isDeleted.equals("delete") ? 1 : 0));
        ${modelName?uncap_first}Service.update${modelName}(${modelName?uncap_first});

        model.addAttribute("${modelName?uncap_first}", ${modelName?uncap_first});
        return getPathTableTr();
    }

    /**
     * 编辑
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/edit", method = RequestMethod.GET)
    @RequiresPermissions("${code.menuName}")
    public String edit(@PathVariable("id") Long id, Model model) {
        model.addAttribute("${modelName?uncap_first}", ${modelName?uncap_first}Service.get${modelName}(id));
        <#if step1.addBtnType=='1'>
        return getPathFormModal();
        <#else>
        return getPathForm();
        </#if>
    }

    /**
     * 更新
     *
     * @param ${modelName?uncap_first}
     * @param result
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @RequiresPermissions("${code.menuName}")
    @ResponseBody
    public Map<String, Object> update(@ModelAttribute("${modelName?uncap_first}") @Valid ${modelName} ${modelName?uncap_first}, BindingResult result) {
        Map<String, Object> resultMap = getResultMap();

        if (!result.hasErrors()) {
            ${modelName?uncap_first}Service.update${modelName}(${modelName?uncap_first});
        } else {
            setResultMapFailure(resultMap);
        }

        return resultMap;
    }

    /**
     * 物理删除
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}/remove", method = RequestMethod.GET)
    @RequiresPermissions("${code.menuName}")
    @ResponseBody
    public Map<String, Object> remove(@PathVariable("id") Long id) {
        ${modelName?uncap_first}Service.delete${modelName}(id);
        return super.getResultMap();
    }

    /**
     * 详情
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[\\d]+}", method = RequestMethod.GET)
    @RequiresPermissions("${code.menuName}")
    public String detail(@PathVariable("id") Long id, Model model) {
        model.addAttribute("${modelName?uncap_first}", ${modelName?uncap_first}Service.get${modelName}(id));
        return super.getPathDetailModal();
    }

}

#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.web.controller.dashboard;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import ${package}.biz.service.CodeService;
import ${package}.biz.service.MenuService;
import ${package}.biz.service.TableService;
import ${package}.biz.service.UserService;
import ${package}.model.dto.Step1;
import ${package}.model.dto.Step2;
import ${package}.model.dto.Step3;
import ${package}.model.vo.*;
import ${package}.web.controller.BaseController;
import lombok.extern.log4j.Log4j2;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

/**
 * @author kangyonggan
 * @since 9/18/17
 */
@Controller
@RequestMapping("dashboard/tool/code")
@Log4j2
public class DashboardToolCodeController extends BaseController {

    @Autowired
    private CodeService codeService;

    @Autowired
    private TableService tableService;

    @Autowired
    private UserService userService;

    @Autowired
    private MenuService menuService;

    /**
     * 代码列表
     *
     * @param pageNum
     * @param tableName
     * @param menuName
     * @param model
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    @RequiresPermissions("TOOL_CODE")
    public String list(@RequestParam(value = "p", required = false, defaultValue = "1") int pageNum,
                       @RequestParam(value = "tableName", required = false, defaultValue = "") String tableName,
                       @RequestParam(value = "menuName", required = false, defaultValue = "") String menuName,
                       Model model) {
        List<Code> codes = codeService.searchCodes(pageNum, tableName, menuName);
        PageInfo<Code> page = new PageInfo(codes);

        model.addAttribute("page", page);
        return getPathList();
    }

    /**
     * 新增
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "create", method = RequestMethod.GET)
    @RequiresPermissions("TOOL_CODE")
    public String create(Model model) {
        List<DbTable> tables = tableService.findAllTables();
        List<Menu> menus = menuService.findAllMenus();

        String name = this.getClass().getName();
        name = name.substring(0, name.indexOf(".controller"));
        name = name.substring(0, name.lastIndexOf("."));

        model.addAttribute("tables", tables);
        model.addAttribute("menus", menus);
        model.addAttribute("packageName", name);
        return getPathFormModal();
    }

    /**
     * 保存代码
     *
     * @param code
     * @param result
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("TOOL_CODE")
    public Map<String, Object> save(@ModelAttribute("code") @Valid Code code, BindingResult result) {
        Map<String, Object> resultMap = getResultMap();
        ShiroUser shiroUser = userService.getShiroUser();

        if (!result.hasErrors()) {
            code.setCreatedUsername(shiroUser.getUsername());
            codeService.saveCode(code);
        } else {
            setResultMapFailure(resultMap);
        }

        return resultMap;
    }

    /**
     * 生成向导
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "{id:[${symbol_escape}${symbol_escape}d]+}", method = RequestMethod.GET)
    @RequiresPermissions("TOOL_CODE")
    public String generate(@PathVariable("id") Long id, Model model) {
        Code code = codeService.findCodeById(id);
        List<DbColumn> columns = tableService.findTableColumns(code.getTableName());
        JSONObject step1 = JSON.parseObject(code.getStep1());
        JSONObject step2 = JSON.parseObject(code.getStep2());
        JSONObject step3 = JSON.parseObject(code.getStep3());

        model.addAttribute("table", tableService.findTableByName(code.getTableName()));
        model.addAttribute("columns", columns);
        model.addAttribute("code", code);
        model.addAttribute("step1", step1 == null ? new Object() : step1);
        model.addAttribute("step2", step2 == null ? new Object() : step2);
        model.addAttribute("step3", step3 == null ? new Object() : step3);
        return getPathRoot() + "/generate";
    }

    /**
     * 提交第一步的表单
     *
     * @param step1
     * @param result
     * @return
     */
    @RequestMapping(value = "step1", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("TOOL_CODE")
    public Map<String, Object> step1(@ModelAttribute("step1") @Valid Step1 step1, BindingResult result) {
        Map<String, Object> resultMap = getResultMap();

        if (!result.hasErrors()) {
            codeService.updateStep1(step1);
        } else {
            setResultMapFailure(resultMap);
        }

        return resultMap;
    }

    /**
     * 提交第二步的表单
     *
     * @param step2
     * @param result
     * @return
     */
    @RequestMapping(value = "step2", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("TOOL_CODE")
    public Map<String, Object> step2(@ModelAttribute("step2") @Valid Step2 step2, BindingResult result) {
        Map<String, Object> resultMap = getResultMap();

        if (!result.hasErrors()) {
            codeService.updateStep2(step2);
        } else {
            setResultMapFailure(resultMap);
        }

        return resultMap;
    }

    /**
     * 提交第三步的表单
     *
     * @param step3
     * @param result
     * @return
     */
    @RequestMapping(value = "step3", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("TOOL_CODE")
    public Map<String, Object> step3(@ModelAttribute("step3") @Valid Step3 step3, BindingResult result) {
        Map<String, Object> resultMap = getResultMap();

        if (!result.hasErrors()) {
            codeService.updateStep3(step3);
        } else {
            setResultMapFailure(resultMap);
        }

        return resultMap;
    }

    /**
     * 提交完成的表单
     *
     * @param step3
     * @param result
     * @return
     */
    @RequestMapping(value = "finish", method = RequestMethod.POST)
    @ResponseBody
    @RequiresPermissions("TOOL_CODE")
    public Map<String, Object> finish(@ModelAttribute("step3") @Valid Step3 step3, BindingResult result) {
        Map<String, Object> resultMap = getResultMap();

        if (!result.hasErrors()) {
            Code code = new Code();
            code.setId(step3.getCodeId());
            code.setStatus("complete");
            codeService.updateCode(code);
        } else {
            setResultMapFailure(resultMap);
        }

        return resultMap;
    }

    /**
     * 生成代码
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "{id:[${symbol_escape}${symbol_escape}d]+}/generate", method = RequestMethod.GET)
    @ResponseBody
    @RequiresPermissions("TOOL_CODE")
    public Map<String, Object> generate(@PathVariable("id") Long id) {
        Map<String, Object> resultMap = getResultMap();

        codeService.generateCode(id);

        return resultMap;
    }

    /**
     * 重置配置
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "{id:[${symbol_escape}${symbol_escape}d]+}/reset", method = RequestMethod.GET)
    @ResponseBody
    @RequiresPermissions("TOOL_CODE")
    public Map<String, Object> reset(@PathVariable("id") Long id) {
        Map<String, Object> resultMap = getResultMap();

        Code code = new Code();
        code.setId(id);
        code.setStep1("");
        code.setStep2("");
        code.setStep3("");
        codeService.updateCode(code);

        return resultMap;
    }
}

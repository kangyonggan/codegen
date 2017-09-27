#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.biz.service;

import ${package}.model.dto.Step1;
import ${package}.model.dto.Step2;
import ${package}.model.dto.Step3;
import ${package}.model.vo.Code;

import java.util.List;

/**
 * @author kangyonggan
 * @since 2017/9/24 0024
 */
public interface CodeService {

    /**
     * 搜索代码
     *
     * @param pageNum
     * @param tableName
     * @param menuName
     * @return
     */
    List<Code> searchCodes(int pageNum, String tableName, String menuName);

    /**
     * 保存代码
     *
     * @param code
     */
    void saveCode(Code code);

    /**
     * 查找代码
     *
     * @param id
     * @return
     */
    Code findCodeById(Long id);

    /**
     * 更新第一步
     *
     * @param step1
     */
    void updateStep1(Step1 step1);

    /**
     * 更新第二步
     *
     * @param step2
     */
    void updateStep2(Step2 step2);

    /**
     * 更新第三步
     *
     * @param step3
     */
    void updateStep3(Step3 step3);

    /**
     * 更新代码
     *
     * @param code
     */
    void updateCode(Code code);

    /**
     * 生成代码
     *
     * @param id
     */
    void generateCode(Long id);
}

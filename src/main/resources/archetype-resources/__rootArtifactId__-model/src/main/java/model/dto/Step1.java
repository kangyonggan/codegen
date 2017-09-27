#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.model.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @author kangyonggan
 * @since 2017/9/24 0024
 */
@Data
public class Step1 implements Serializable {

    private Long codeId;

    private String pageName;

    private String addBtnName;

    private String addBtnType;

    private String needPage;

    private List<String> columns;

    private List<String> searchColumns;

}

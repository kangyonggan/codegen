#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.model.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author kangyonggan
 * @since 9/22/17
 */
@Data
public class DbTable implements Serializable {

    /**
     * 表名
     */
    private String tableName;

    /**
     * 表备注
     */
    private String tableComment;

    /**
     * 记录数
     */
    private Long tableRows;

    /**
     * 创建时间
     */
    private Date createdTime;

    /**
     * 更新时间
     */
    private Date updatedTime;

}

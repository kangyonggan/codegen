#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.biz.service;

import ${package}.model.vo.DbColumn;
import ${package}.model.vo.DbTable;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/22/17
 */
public interface TableService {

    /**
     * 查找所有表信息
     *
     * @return
     */
    List<DbTable> findAllTables();

    /**
     * 查找表的所有列
     *
     * @param tableName
     * @return
     */
    List<DbColumn> findTableColumns(String tableName);

    /**
     * 查找table
     *
     * @param tableName
     * @return
     */
    DbTable findTableByName(String tableName);

}

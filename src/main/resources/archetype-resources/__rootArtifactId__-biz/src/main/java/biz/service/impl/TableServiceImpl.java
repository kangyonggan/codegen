#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.biz.service.impl;

import ${package}.biz.service.TableService;
import ${package}.mapper.TableMapper;
import ${package}.model.annotation.LogTime;
import ${package}.model.vo.DbColumn;
import ${package}.model.vo.DbTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author kangyonggan
 * @since 9/22/17
 */
@Service
public class TableServiceImpl implements TableService {

    @Autowired
    private TableMapper tableMapper;

    @Override
    @LogTime
    public List<DbTable> findAllTables() {
        return tableMapper.selectAllTables();
    }

    @Override
    @LogTime
    public List<DbColumn> findTableColumns(String tableName) {
        return tableMapper.selectTableColumns(tableName);
    }

    @Override
    public DbTable findTableByName(String tableName) {
        List<DbTable> tables = findAllTables();
        for (DbTable table : tables) {
            if (tableName.equals(table.getTableName())) {
                return table;
            }
        }

        return null;
    }

}

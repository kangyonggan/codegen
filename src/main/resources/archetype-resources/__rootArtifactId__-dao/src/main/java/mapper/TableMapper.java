#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.mapper;

import ${package}.model.vo.DbColumn;
import ${package}.model.vo.DbTable;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TableMapper {

    List<DbTable> selectAllTables();

    List<DbColumn> selectTableColumns(@Param("tableName") String tableName);
}
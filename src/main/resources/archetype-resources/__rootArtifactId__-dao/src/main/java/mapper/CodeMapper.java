#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.mapper;

import ${package}.model.vo.Code;
import org.springframework.stereotype.Repository;

/**
 * 代码生成表
 *
 * @author Generator
 */
@Repository
public interface CodeMapper extends MyMapper<Code> {

}
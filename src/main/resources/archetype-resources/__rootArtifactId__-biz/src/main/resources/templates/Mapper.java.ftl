package ${mapperPackage};

import ${modelPackage}.${modelName};
import org.springframework.stereotype.Repository;

/**
 * <#include "include/table-comment.ftl"/>相关的数据访问接口定义
 *
 * @author ${author}
 */
@Repository
public interface ${modelName}Mapper extends MyMapper<${modelName}> {

}
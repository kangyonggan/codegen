#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.biz.service.impl;

import ${package}.mapper.MyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author kangyonggan
 * @since 16/5/23
 */
@Service
public abstract class BaseService<T> {

    @Autowired
    protected MyMapper<T> myMapper;

    /**
     * 判断是否存在
     *
     * @param entity
     * @return
     */
    public boolean exists(T entity) {
        return myMapper.selectCount(entity) > 0;
    }

}


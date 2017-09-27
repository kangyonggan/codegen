#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.mapper;

import ${package}.model.vo.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper extends MyMapper<User> {

    /**
     * 保存用户角色
     *
     * @param username
     * @param roleCodes
     */
    void insertUserRoles(@Param("username") String username, @Param("roleCodes") List<String> roleCodes);

    /**
     * 查找消息接收人
     *
     * @param messageId
     * @return
     */
    List<User> selectMessageUsers(Long messageId);

    /**
     * 查找所有管理员
     *
     * @return
     */
    List<User> selectAllAdmin();

}
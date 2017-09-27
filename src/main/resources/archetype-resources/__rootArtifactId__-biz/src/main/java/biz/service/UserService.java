#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.biz.service;

import ${package}.model.vo.ShiroUser;
import ${package}.model.vo.User;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/4/17
 */
public interface UserService {

    /**
     * 获取登录的用户信息
     *
     * @return
     */
    ShiroUser getShiroUser();

    /**
     * 根据用户名查找用户
     *
     * @param username
     * @return
     */
    User findUserByUsername(String username);

    /**
     * 按条件搜索用户
     *
     * @param pageNum
     * @param username
     * @param realname
     * @param email
     * @return
     */
    List<User> searchUsers(int pageNum, String username, String realname, String email);

    /**
     * 保存用户
     *
     * @param user
     */
    void saveUserWithDefaultRole(User user);

    /**
     * 根据用户名更新用户信息
     *
     * @param user
     */
    void updateUserByUsername(User user);

    /**
     * 根据用户id查找用户
     *
     * @param id
     * @return
     */
    User findUserById(Long id);

    /**
     * 更新用户密码
     *
     * @param user
     */
    void updateUserPassword(User user);

    /**
     * 更新用户角色
     *
     * @param username
     * @param roleCodes
     */
    void updateUserRoles(String username, String roleCodes);

    /**
     * 判断手机号是否存在
     *
     * @param username
     * @return
     */
    boolean existsUsername(String username);

    /**
     * 判断密码是否一样
     *
     * @param password
     * @param user
     * @return
     */
    boolean isEqualPassword(String password, User user);

    /**
     * 查找所有用户
     *
     * @return
     */
    List<User> findAllUsers();

    /**
     * 查询消息接收人
     *
     * @param messageId
     * @return
     */
    List<User> findMessageUsers(Long messageId);

    /**
     * 查找所有管理员
     *
     * @return
     */
    List<User> findAllAdmin();

}

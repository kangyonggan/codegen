#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.model.constants;

import lombok.Getter;

/**
 * @author kangyonggan
 * @since 5/5/17
 */
public enum TokenType {

    REGISTER("REGISTER", "注册验证码"),
    FORGOT("FORGOT", "找回密码验证码"),
    LOGIN("LOGIN", "登录的token");

    /**
     * 类型
     */
    @Getter
    private final String type;

    /**
     * 类型名称
     */
    @Getter
    private final String name;

    TokenType(String type, String name) {
        this.type = type;
        this.name = name;
    }

}

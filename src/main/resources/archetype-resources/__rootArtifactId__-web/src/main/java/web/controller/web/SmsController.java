#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.web.controller.web;

import ${package}.biz.service.SmsService;
import ${package}.biz.service.TokenService;
import ${package}.model.vo.Token;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author kangyonggan
 * @since 8/7/17
 */
@RestController
@RequestMapping("sms")
public class SmsController {

    @Autowired
    private SmsService smsService;

    @Autowired
    private TokenService tokenService;

    /**
     * 发送验证码
     *
     * @param mobile
     * @param type
     * @return
     */
    @RequestMapping(value = "send", method = RequestMethod.POST)
    public boolean sendSms(@RequestParam("mobile") String mobile, @RequestParam("type") String type) {
        if (StringUtils.isEmpty(mobile) || StringUtils.isEmpty(type)) {
            return false;
        }

        // 60s内不准重复发送
        Token token = tokenService.findActiveTokenByMobileAndType(mobile, type);
        if (token != null) {
            return false;
        }

        smsService.sendSms(mobile, type);
        return true;
    }

}

#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.biz.service.impl;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.aliyuncs.sms.model.v20160927.SingleSendSmsRequest;
import com.aliyuncs.sms.model.v20160927.SingleSendSmsResponse;
import ${package}.biz.service.SmsService;
import ${package}.biz.service.TokenService;
import ${package}.common.util.StringUtil;
import ${package}.model.annotation.LogTime;
import ${package}.model.constants.TokenType;
import ${package}.model.vo.Token;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Random;

/**
 * @author kangyonggan
 * @since 2017/2/9
 */
@Log4j2
public class SmsServiceImpl implements SmsService {

    @Autowired
    private TokenService tokenService;

    @Setter
    private String signName;

    @Setter
    private String templateCode;

    @Setter
    private String debug;

    private IAcsClient client;

    public SmsServiceImpl(String regionId, String accessKeyId, String secret, String domain) {
        try {
            IClientProfile profile = DefaultProfile.getProfile(regionId, accessKeyId, secret);
            DefaultProfile.addEndpoint(regionId, regionId, "Sms", domain);
            client = new DefaultAcsClient(profile);
        } catch (Exception e) {
            log.error("初始化短信配置失败", e);
        }
    }

    @Override
    @LogTime
    public void sendSms(String mobile, String type) {
        // 校验手机号是否正确
        if (!StringUtil.isMobile(mobile)) {
            log.info("手机号码不正确，停止发短信");
            return;
        }

        String code = getTokenCode();

        SingleSendSmsRequest request = new SingleSendSmsRequest();
        request.setSignName(signName);
        request.setTemplateCode(templateCode);
        request.setRecNum(mobile);
        request.setParamString("{${symbol_escape}"token${symbol_escape}":${symbol_escape}"" + code + "${symbol_escape}"}");

        // 发送
        try {
            SingleSendSmsResponse response;
            if (!"true".equals(debug)) {
                response = client.getAcsResponse(request);
            } else {
                log.info("调试阶段不真正的发短信");
                response = new SingleSendSmsResponse();
                response.setRequestId("BFDBE6CE-C2C5-46C0-8EC6-8A6628AAF53F");
                response.setModel("105862070614^1107954709798");
            }

            // 落库
            Token token = new Token();
            token.setType(type);
            token.setCode(code);
            token.setMobile(mobile);
            tokenService.saveToken(token);

            log.info("请求ID:{}", response.getRequestId());
            log.info("响应结果:{}", response.getModel());
            log.info("短信发送成功");
        } catch (Exception e) {
            log.error("评论后的短信通知发送失败", e);
        }
    }

    /**
     * 获取4位随机验证码
     *
     * @return
     */
    private String getTokenCode() {
        Random random = new Random();
        StringBuilder captcha = new StringBuilder();
        for (int i = 0; i < 4; i++) {
            String code = String.valueOf(random.nextInt(10));
            captcha.append(code);
        }

        return captcha.toString();
    }
}

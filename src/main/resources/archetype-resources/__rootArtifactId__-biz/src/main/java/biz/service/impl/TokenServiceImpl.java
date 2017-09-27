#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.biz.service.impl;

import com.github.pagehelper.PageHelper;
import ${package}.biz.service.TokenService;
import ${package}.common.util.DateUtil;
import ${package}.model.annotation.LogTime;
import ${package}.model.constants.AppConstants;
import ${package}.model.vo.Token;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author kangyonggan
 * @since 8/7/17
 */
@Service
@Log4j2
public class TokenServiceImpl extends BaseService<Token> implements TokenService {

    @Override
    @LogTime
    public void saveToken(Token token) {
        myMapper.insertSelective(token);
    }

    @Override
    @LogTime
    public Token findTokenByMobileAndType(String mobile, String type) {
        Example example = new Example(Token.class);
        example.createCriteria().andEqualTo("mobile", mobile)
                .andEqualTo("type", type)
                .andEqualTo("isDeleted", AppConstants.IS_DELETED_NO)
                .andGreaterThanOrEqualTo("createdTime", DateUtil.plusMinutes(-30));
        example.setOrderByClause("id desc");

        PageHelper.startPage(1, 1);
        List<Token> tokens = myMapper.selectByExample(example);
        if (!tokens.isEmpty()) {
            return tokens.get(0);
        }
        return null;
    }

    @Override
    @LogTime
    public Token findTokenByCodeAndType(String code, String type) {
        Token token = new Token();
        token.setCode(code);
        token.setType(type);
        try {
            token = myMapper.selectOne(token);
        } catch (Exception e) {
            log.warn("查找登录的token出错", e);
            return null;
        }
        return token;
    }

    @Override
    @LogTime
    public void deleteTokenById(Long id) {
        Token token = new Token();
        token.setId(id);
        token.setIsDeleted(AppConstants.IS_DELETED_YES);

        myMapper.updateByPrimaryKeySelective(token);
    }

    @Override
    public Token findActiveTokenByMobileAndType(String mobile, String type) {
        Example example = new Example(Token.class);
        example.createCriteria().andEqualTo("mobile", mobile)
                .andEqualTo("type", type)
                .andEqualTo("isDeleted", AppConstants.IS_DELETED_NO)
                .andGreaterThanOrEqualTo("createdTime", DateUtil.plusMinutes(-1));
        example.setOrderByClause("id desc");

        PageHelper.startPage(1, 1);
        List<Token> tokens = myMapper.selectByExample(example);
        if (!tokens.isEmpty()) {
            return tokens.get(0);
        }
        return null;
    }

    @Override
    @LogTime
    public void deleteTokensByMobileAndType(String mobile, String type) {
        Token token = new Token();
        token.setType(type);
        token.setMobile(mobile);

        myMapper.delete(token);
    }

    @Override
    @LogTime
    public List<Token> searchTokens(int pageNum, String type, String mobile) {
        Example example = new Example(Token.class);

        Example.Criteria criteria = example.createCriteria();
        if (StringUtils.isNotEmpty(type)) {
            criteria.andEqualTo("type", type);
        }
        if (StringUtils.isNotEmpty(mobile)) {
            criteria.andEqualTo("mobile", mobile);
        }

        example.setOrderByClause("id desc");

        PageHelper.startPage(pageNum, AppConstants.PAGE_SIZE);
        return myMapper.selectByExample(example);
    }
}

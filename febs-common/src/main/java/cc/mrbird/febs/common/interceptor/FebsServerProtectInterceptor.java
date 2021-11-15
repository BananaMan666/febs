package cc.mrbird.febs.common.interceptor;

import cc.mrbird.febs.common.entity.FebsConstant;
import cc.mrbird.febs.common.entity.FebsResponse;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.util.Base64Utils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author llx
 * @date 2021/9/29 16:30
 * @Description
 * 定义好Zuul过滤器后，我们需要在各个微服务里定义一个全局拦截器拦截请求，并校验Zuul Token。
 * 这个拦截器需要被众多微服务模块使用，所以把它定义在通用模块febs-common里。
 *
 * FebsServerProtectInterceptor实现了HandlerInterceptor的preHandle方法，该拦截器可以拦截所有Web请求。
 * 在preHandle方法中，我们通过HttpServletRequest获取请求头中的Zuul Token，并校验其正确性，当校验不通过的时候返回403错误。
 */
public class FebsServerProtectInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        // 从请求头中获取 Zuul Token
        String token = request.getHeader(FebsConstant.ZUUL_TOKEN_HEADER);
        String zuulToken = new String(Base64Utils.encode(FebsConstant.ZUUL_TOKEN_VALUE.getBytes()));
        // 校验 Zuul Token的正确性
        if (StringUtils.equals(zuulToken, token)) {
            return true;
        } else {
            FebsResponse febsResponse = new FebsResponse();
            response.setContentType(MediaType.APPLICATION_JSON_UTF8_VALUE);
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            response.getWriter().write(JSONObject.toJSONString(febsResponse.message("请通过网关获取资源")));
            return false;
        }
    }
}
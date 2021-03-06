package cc.mrbird.febs.common.configure;

import cc.mrbird.febs.common.handler.FebsAccessDeniedHandler;
import cc.mrbird.febs.common.handler.FebsAuthExceptionEntryPoint;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;

/**
 * @author llx
 * @date 2021/9/28 14:53
 * @Description
 * 因为febs-common模块是一个普通的maven项目，并不是一个Spring Boot项目，
 * 所以即使在这两个类上使用@Component注解标注，它们也不能被成功注册到各个微服务子系统的Spring IOC容器中。
 * 我们可以使用@Enable模块驱动的方式来解决这个问题。
 * ，我们注册了FebsAccessDeniedHandler和FebsAuthExceptionEntryPoint。
 * @ConditionalOnMissingBean注解的意思是，当IOC容器中没有指定名称或类型的Bean的时候，就注册它。
 * 以@ConditionalOnMissingBean(name = "accessDeniedHandler")为例，当微服务系统的Spring IOC容器中没有名称为accessDeniedHandler的Bean的时候，
 * 就将FebsAccessDeniedHandler注册为一个Bean。这样做的好处在于，子系统可以自定义自个儿的资源服务器异常处理器，覆盖我们在febs-common通用模块里定义的。
 */
public class FebsAuthExceptionConfigure {
    @Bean
    @ConditionalOnMissingBean(name = "accessDeniedHandler")
    public FebsAccessDeniedHandler accessDeniedHandler() {
        return new FebsAccessDeniedHandler();
    }

    @Bean
    @ConditionalOnMissingBean(name = "authenticationEntryPoint")
    public FebsAuthExceptionEntryPoint authenticationEntryPoint() {
        return new FebsAuthExceptionEntryPoint();
    }
}

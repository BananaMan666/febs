package cc.mrbird.febs.gateway.configure;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * @author llx
 * @date 2021/9/28 9:46
 *
 * @Description:
 * 因为febs-gateway引入了febs-common模块，febs-common模块包含了Spring Cloud Security依赖，
 * 所以我们需要定义一个自己的WebSecurity配置类，来覆盖默认的。这里主要是关闭了csrf功能，否则会报csrf相关异常。
 */
@EnableWebSecurity
public class FebsGatewaySecurityConfigure extends WebSecurityConfigurerAdapter {
    //没有添加监测之前代码
    /*@Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
    }*/

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests().antMatchers("/actuator/**").permitAll()
                .and().csrf().disable();
    }
}

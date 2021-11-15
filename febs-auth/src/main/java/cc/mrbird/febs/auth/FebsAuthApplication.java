package cc.mrbird.febs.auth;

import cc.mrbird.febs.common.annotation.EnableFebsLettuceRedis;
import cc.mrbird.febs.common.annotation.FebsCloudApplication;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * 通过该注解(@EnableFebsAuthExceptionHandler)，
 * febs-auth模块的IOC容器里就已经注册了FebsAccessDeniedHandler和FebsAuthExceptionEntryPoint。
 * 然后在资源服务器配置类FebsResourceServerConfigurer里注入它们，并配置：
 */
@EnableFebsLettuceRedis
@FebsCloudApplication
@EnableDiscoveryClient
@MapperScan("cc.mrbird.febs.auth.mapper")
@SpringBootApplication
public class FebsAuthApplication {

    public static void main(String[] args) {
        SpringApplication.run(FebsAuthApplication.class, args);
    }

}

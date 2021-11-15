package cc.mrbird.febs.server.system;

import cc.mrbird.febs.common.annotation.FebsCloudApplication;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * EnableGlobalMethodSecurity注解，表示开启Spring Cloud Security权限注解
 */

@EnableGlobalMethodSecurity(prePostEnabled = true)
@FebsCloudApplication
@EnableDiscoveryClient
@SpringBootApplication
@EnableTransactionManagement
@MapperScan("cc.mrbird.febs.server.system.mapper")
public class FebsServerSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(FebsServerSystemApplication.class, args);
    }

}

package cc.mrbird.febs.server.system.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

/**
 * @author llx
 * @date 2021/9/28 11:05
 * @Description
 */
@Slf4j
@RestController
public class TestController {

    @GetMapping("info")
    public String test(){
        return "febs-server-system";
    }

    @GetMapping("hello")
    public String hello(String name) {
        log.info("/hello服务被调用");
        return "hello" + name;
    }

    @GetMapping("currentUser")
    public Principal currentUser(Principal principal) {
        return principal;
    }
}

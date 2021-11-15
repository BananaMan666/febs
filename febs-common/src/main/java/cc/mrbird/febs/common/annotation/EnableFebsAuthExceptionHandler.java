package cc.mrbird.febs.common.annotation;

import cc.mrbird.febs.common.configure.FebsAuthExceptionConfigure;
import org.springframework.context.annotation.Import;

import java.lang.annotation.*;

/**
 * @author llx
 * @date 2021/9/28 14:55
 * @Description
 * 在该注解上，我们使用@Import将FebsAuthExceptionConfigure配置类引入了进来。
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Import(FebsAuthExceptionConfigure.class)
public @interface EnableFebsAuthExceptionHandler {

}

package cc.mrbird.febs.common.annotation;

import cc.mrbird.febs.common.configure.FebsOAuth2FeignConfigure;
import org.springframework.context.annotation.Import;

import java.lang.annotation.*;

/**
 * @author llx
 * @date 2021/9/28 17:03
 * @Description
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Import(FebsOAuth2FeignConfigure.class)
public @interface EnableFebsOauth2FeignClient {

}

package cc.mrbird.febs.auth.handler;

import cc.mrbird.febs.common.handler.BaseExceptionHandler;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @author llx
 * @date 2021/9/28 15:15
 * @Description
 * 对于通用的异常类型捕获可以在BaseExceptionHandler中定义，
 * 而当前微服务系统独有的异常类型捕获可以在GlobalExceptionHandler中定义。
 *
 * febs-server-system和febs-server-test模块处理方式和febs-auth一致，这里就不演示了。
 */
@RestControllerAdvice
@Order(value = Ordered.HIGHEST_PRECEDENCE)
public class GlobalExceptionHandler extends BaseExceptionHandler {
}

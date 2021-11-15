package cc.mrbird.febs.common.exception;

/**
 * @author liulongxiang
 * @description: 验证码异常类
 * @date 2021/10/8
 */
public class ValidateCodeException extends Exception{

    private static final long serialVersionUID = 7514854456967620043L;

    public ValidateCodeException(String message){
        super(message);
    }
}

package cc.mrbird.febs.common.exception;

/**
 * @author liulongxiang
 * @description: 自定义异常类
 * @date 2021/9/27
 */
public class FebsAuthException  extends Exception{

    private static final long serialVersionUID = -6916154462432027437L;

    public FebsAuthException(String message){
        super(message);
    }
}

package cc.mrbird.febs.common.selector;

import cc.mrbird.febs.common.configure.FebsAuthExceptionConfigure;
import cc.mrbird.febs.common.configure.FebsOAuth2FeignConfigure;
import cc.mrbird.febs.common.configure.FebsServerProtectConfigure;
import org.springframework.context.annotation.ImportSelector;
import org.springframework.core.type.AnnotationMetadata;

/**
 * @author llx
 * @date 2021/10/11 15:17
 * @Description 多个类进行注册：selector
 */
public class FebsCloudApplicationSelector implements ImportSelector {

    @Override
    public String[] selectImports(AnnotationMetadata annotationMetadata) {
        return new String[]{
                FebsAuthExceptionConfigure.class.getName(),
                FebsOAuth2FeignConfigure.class.getName(),
                FebsServerProtectConfigure.class.getName()
        };
    }
}

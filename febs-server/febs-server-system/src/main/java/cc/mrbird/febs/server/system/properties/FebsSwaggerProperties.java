package cc.mrbird.febs.server.system.properties;

import lombok.Data;

/**
 * @author liulongxiang
 * @description: TODO
 * @date 2021/10/11
 */
@Data
public class FebsSwaggerProperties{

    private String basePackage;
    private String title;
    private String description;
    private String version;
    private String author;
    private String url;
    private String email;
    private String license;
    private String licenseUrl;

    private String grantUrl;
    private String name;
    private String scope;

}

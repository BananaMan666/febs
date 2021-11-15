package cc.mrbird.febs.auth.properties;

import lombok.Data;

/**
 * @author llx
 * @date 2021/9/28 14:21
 * @Description
 */
@Data
public class FebsClientsProperties {

    private String client;
    private String secret;
    private String grantType = "password,authorization_code,refresh_token";
    private String scope = "all";
}

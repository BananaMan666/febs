package cc.mrbird.febs.auth.manager;

import cc.mrbird.febs.auth.mapper.MenuMapper;
import cc.mrbird.febs.auth.mapper.UserMapper;
import cc.mrbird.febs.common.entity.system.Menu;
import cc.mrbird.febs.common.entity.system.SystemUser;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author llx
 * @date 2021/9/29 17:35
 * @Description
 */
@Service
public class UserManager {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private MenuMapper menuMapper;

    public SystemUser findByName(String username) {
        return userMapper.findByName(username);
    }

    public String findUserPermissions(String username) {
        List<Menu> userPermissions = menuMapper.findUserPermissions(username);
        return userPermissions.stream().map(Menu::getPerms).collect(Collectors.joining(","));
    }
}

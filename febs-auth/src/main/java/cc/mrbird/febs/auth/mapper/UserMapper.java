package cc.mrbird.febs.auth.mapper;

import cc.mrbird.febs.common.entity.system.SystemUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author llx
 * @date 2021/9/29 17:33
 * @Description
 */
@Mapper
public interface UserMapper extends BaseMapper<SystemUser> {
    SystemUser findByName(String username);
}

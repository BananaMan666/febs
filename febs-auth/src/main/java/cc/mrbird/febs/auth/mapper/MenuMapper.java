package cc.mrbird.febs.auth.mapper;

import cc.mrbird.febs.common.entity.system.Menu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author llx
 * @date 2021/9/29 17:33
 * @Description
 */
@Mapper
public interface MenuMapper extends BaseMapper<Menu> {
    List<Menu> findUserPermissions(String username);
}
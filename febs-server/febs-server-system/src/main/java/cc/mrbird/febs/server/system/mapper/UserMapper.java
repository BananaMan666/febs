package cc.mrbird.febs.server.system.mapper;

import cc.mrbird.febs.common.entity.system.SystemUser;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import feign.Param;

/**
 * @author liulongxiang
 * @description: TODO
 * @date 2021/10/9
 */
public interface UserMapper extends BaseMapper<SystemUser> {

    /**
     * 查找用户详细信息
     *
     * @param page 分页对象
     * @param user 用户对象，用于传递查询条件
     * @return Ipage
     */
    IPage<SystemUser> findUserDetailPage(Page page, @Param("user") SystemUser user);
}
package com.dao;

import com.entity.LaoshiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.LaoshiView;

/**
 *  Dao 接口
 *
 * @since 2021-03-17
 */
public interface LaoshiDao extends BaseMapper<LaoshiEntity> {

   List<LaoshiView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}

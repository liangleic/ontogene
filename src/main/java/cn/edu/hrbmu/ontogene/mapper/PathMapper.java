package cn.edu.hrbmu.ontogene.mapper;

import cn.edu.hrbmu.ontogene.domain.Path;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-10-13 10:10
 */
@Mapper
public interface PathMapper {
    @Select("select * from path where term_id = #{term_id}")
    public Path getPathByName(Path path);
}

package cn.edu.hrbmu.ontogene.mapper;

import cn.edu.hrbmu.ontogene.domain.Tree;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-10-11 10:40
 */
@Mapper
public interface TreeMapper {
    @Select("select * from tree where target_term_id = #{target_term_id}")
    public List<Tree> getTreeByTargetId(Tree tree);

}

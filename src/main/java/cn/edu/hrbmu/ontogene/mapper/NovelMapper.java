package cn.edu.hrbmu.ontogene.mapper;

import cn.edu.hrbmu.ontogene.domain.Novel;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 17:15
 */
//指定这是一个操作数据库的mapper
@Mapper
public interface NovelMapper {

    @Insert("insert into novel(geneSymbol,geneID,termName,termID,PMID,email,detail) values (#{geneSymbol},#{geneID},#{termName},#{termID},#{PMID},#{email},#{detail})")
    public int insertNov(Novel novel);



}

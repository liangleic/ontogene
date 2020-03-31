package cn.edu.hrbmu.ontogene.mapper;

import cn.edu.hrbmu.ontogene.domain.Annotation;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 17:15
 */
//指定这是一个操作数据库的mapper
@Mapper
public interface AnnotationMapper {
    @Select("select * from annotation where term_id=#{term_id}")
    public List<Annotation> getAnnById(Annotation annotation);

    @Select("select * from annotation where rna_hgnc_id=#{rna_hgnc_id}")
    public List<Annotation> getAnnByRna_hgnc_id(Annotation annotation);

    @Delete("delete from annotation where term_id=#{term_id}")
    public int deleteAnnById(String term_id);

    @Insert("insert into annotation(term_id,term_name,rna_symbol,rna_type,rna_hgnc_id,weights,source,term_type,entity_id) values (#{term_id},#{term_name},#{rna_symbol},#{rna_type},#{rna_hgnc_id},#{weights},#{source},#{term_type},#{entity_id})")
    public int insertAnn(Annotation annotation);

    @Update("update annotation set term_name=#{term_name} where term_id=#{term_id}")
    public int updateAnn(Annotation annotation);

    @Select("select * from annotation where term_id =#{term_id} limit 0,500")
    public List<Annotation> getAnnByIdLimit(Annotation annotation);


}

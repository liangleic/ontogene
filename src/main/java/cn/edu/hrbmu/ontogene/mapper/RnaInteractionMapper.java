package cn.edu.hrbmu.ontogene.mapper;

import cn.edu.hrbmu.ontogene.domain.Rna_Interaction;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-10-11 10:40
 */
@Mapper
public interface RnaInteractionMapper {
    @Select("<script>"
            + "SELECT * FROM rna_interaction WHERE rna1_hgnc_id IN "
            + "<foreach item='item' index='index' collection='rna1_hgnc_id' open='(' separator=',' close=')'>"
            + "#{item}"
            + "</foreach>"
            +" and "
            + "rna2_hgnc_id IN "
            + "<foreach item='item' index='index' collection='rna2_hgnc_id' open='(' separator=',' close=')'>"
            + "#{item}"
            + "</foreach>"
            + "</script>")
//    @Select("SELECT * FROM rna_interaction WHERE rna1_hgnc_id IN (#{rna1_hgnc_id}) and rna2_hgnc_id in (#{rna2_hgnc_id})")
    public List<Rna_Interaction> getRnaIntByRnaHgncId(@Param("rna1_hgnc_id") List<String> rna1_hgnc_id,@Param("rna2_hgnc_id") List<String> rna2_hgnc_id);


}

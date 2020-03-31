package cn.edu.hrbmu.ontogene.mapper;

import cn.edu.hrbmu.ontogene.domain.Rna;
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
public interface RnaMapper {
    @Select("<script>" + "SELECT * FROM rna WHERE hgnc_id IN " + "<foreach item='item' index='index' collection='hgnc_id' open='(' separator=',' close=')'>" + "#{item}" + "</foreach>" + "</script>")
    public List<Rna> getRnaByHgnc(@Param("hgnc_id") List<String> hgnc_id);

    @Select("select * from rna where hgnc_id = ${hgnc_id}")
    public List<Rna> getRnaByHgnc_id(Rna rna);

    @Select("select * from rna where rna_symbol like '%${rna_symbol}%' limit 0,10")
    public List<Rna> getRnaByRna_symbol(Rna rna);

    @Select("select * from rna where rna_symbol= #{rna_symbol}")
    public Rna getOneRnaByRan_symbol(Rna rna);


}

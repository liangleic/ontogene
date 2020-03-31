package cn.edu.hrbmu.ontogene.mapper;

import cn.edu.hrbmu.ontogene.domain.Term;
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
public interface TermMapper {
    @Select("select * from term where term_name = #{term_name}")
    public Term getTermByName(Term term);

    @Select("select * from term where term_id = #{term_id}")
    public List<Term> getTermById(Term term);

    @Select("select * from term where is_root='1'")
    public List<Term> GetTermByIsRoot();

    @Select("select * from term where term_name like '%${term_name}%' limit 0,10")
    public List<Term> getTermsByName(Term term);


//    @Select("<script>" + "SELECT * FROM term WHERE term_id IN " + "<foreach item='item' index='index' collection='term_id' open='(' separator=',' close=')'>" + "#{item}" + "</foreach>" + "</script>")
//    public List<Term> getTermById(@Param("term_id") List<String> term_id);

    @Select("<script>" + "SELECT * FROM term WHERE term_id IN " + "<foreach item='item' index='index' collection='term_id' open='(' separator=',' close=')'>" + "#{item}" + "</foreach>" + "</script>")
    public List<Term> getTermByInId(@Param("term_id") List<String> term_id);


}

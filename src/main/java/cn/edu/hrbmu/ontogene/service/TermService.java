package cn.edu.hrbmu.ontogene.service;

import cn.edu.hrbmu.ontogene.domain.Term;
import cn.edu.hrbmu.ontogene.mapper.TermMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 17:36
 */
@Service
public class TermService {

    @Autowired
    TermMapper termMapper;


    public Term getTerm(Term term) {
        return termMapper.getTermByName(term);
    }

    public List<Term> getTermListID(Term term) {
        return termMapper.getTermById(term);
    }

    public List<Term> getTermList(Term term) {
        return termMapper.getTermsByName(term);
    }

    public List<Term> getTermIsRoot() {
        return termMapper.GetTermByIsRoot();
    }

    public List<Term> getTermByInId(List<String> term_id){
        return termMapper.getTermByInId(term_id);
    }


}

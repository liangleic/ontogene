package cn.edu.hrbmu.ontogene.service;

import cn.edu.hrbmu.ontogene.domain.Rna;
import cn.edu.hrbmu.ontogene.mapper.RnaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 17:36
 */
@Service
public class RnaService {

    @Autowired
    RnaMapper rnaMapper;


    public List<Rna> getRnaList(List<String> hgnc_id) {
        return rnaMapper.getRnaByHgnc(hgnc_id);
    }

    public List<Rna> getRnaByRna_symbol(Rna rna) {
        return rnaMapper.getRnaByRna_symbol(rna);
    }


    public List<Rna> getRnaByHgnc_id(Rna rna) {
        return rnaMapper.getRnaByHgnc_id(rna);
    }



    public Rna getOneRnaByRan_symbol(Rna rna){
        return rnaMapper.getOneRnaByRan_symbol(rna);
    }

}

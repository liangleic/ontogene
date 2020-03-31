package cn.edu.hrbmu.ontogene.service;

import cn.edu.hrbmu.ontogene.domain.Rna_Interaction;
import cn.edu.hrbmu.ontogene.mapper.RnaInteractionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 17:36
 */
@Service
public class RnaInteractionService {

    @Autowired
    RnaInteractionMapper rnaInteractionMapper;


    public  List<Rna_Interaction> getRnaInteraction(List<String> rna1_hgnc_id,List<String> rna2_hgnc_id) {
        return rnaInteractionMapper.getRnaIntByRnaHgncId(rna1_hgnc_id,rna2_hgnc_id);
    }


}

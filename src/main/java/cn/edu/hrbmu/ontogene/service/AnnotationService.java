package cn.edu.hrbmu.ontogene.service;


import cn.edu.hrbmu.ontogene.domain.Annotation;
import cn.edu.hrbmu.ontogene.mapper.AnnotationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 17:36
 */
@Service
public class AnnotationService {

    @Autowired
    AnnotationMapper annotationMapper;

    public List<Annotation> getAnn(Annotation annotation) {
        return annotationMapper.getAnnById(annotation);
    }

    public List<Annotation> getAnnByRna_hgnc_id(Annotation annotation) {
        return annotationMapper.getAnnByRna_hgnc_id(annotation);
    }

    public List<Annotation> getAnnById(Annotation annotation) {
        return annotationMapper.getAnnByIdLimit(annotation);
    }

    public int deleteAnnById(String term_id) {
        return annotationMapper.deleteAnnById(term_id);
    }

    public int insertAnn(Annotation annotation) {
        return annotationMapper.insertAnn(annotation);
    }

    public int updateAnn(Annotation annotation) {
        return annotationMapper.insertAnn(annotation);
    }


}

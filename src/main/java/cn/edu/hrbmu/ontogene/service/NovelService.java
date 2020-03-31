package cn.edu.hrbmu.ontogene.service;

import cn.edu.hrbmu.ontogene.domain.Novel;
import cn.edu.hrbmu.ontogene.mapper.NovelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 17:36
 */
@Service
public class NovelService {

    @Autowired
    NovelMapper novelMapper;


    public int insertNov(Novel novel) {
        return novelMapper.insertNov(novel);
    }

}

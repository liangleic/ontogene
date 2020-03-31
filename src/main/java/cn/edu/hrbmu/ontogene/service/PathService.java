package cn.edu.hrbmu.ontogene.service;

import cn.edu.hrbmu.ontogene.domain.Path;
import cn.edu.hrbmu.ontogene.mapper.PathMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 17:36
 */
@Service
public class PathService {

    @Autowired
    PathMapper pathMapper;


    public Path getPath(Path path) {
        return pathMapper.getPathByName(path);
    }


}

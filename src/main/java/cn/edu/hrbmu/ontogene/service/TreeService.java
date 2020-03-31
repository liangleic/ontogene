package cn.edu.hrbmu.ontogene.service;

import cn.edu.hrbmu.ontogene.domain.Tree;
import cn.edu.hrbmu.ontogene.mapper.TreeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 17:36
 */
@Service
public class TreeService {

    @Autowired
    TreeMapper treeMapper;


    public  List<Tree> getTreeList(Tree tree) {
        return treeMapper.getTreeByTargetId(tree);
    }


}

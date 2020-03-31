package cn.edu.hrbmu.ontogene.domain;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 16:44
 */
public class Tree {
    private String source_term_id;
    private String source_term_name;
    private String target_term_id;
    private String target_term_name;
    private String relationship;
    private String is_leaf;

    public String getSource_term_id() {
        return source_term_id;
    }

    public void setSource_term_id(String source_term_id) {
        this.source_term_id = source_term_id;
    }

    public String getSource_term_name() {
        return source_term_name;
    }

    public void setSource_term_name(String source_term_name) {
        this.source_term_name = source_term_name;
    }

    public String getTarget_term_id() {
        return target_term_id;
    }

    public void setTarget_term_id(String target_term_id) {
        this.target_term_id = target_term_id;
    }

    public String getTarget_term_name() {
        return target_term_name;
    }

    public void setTarget_term_name(String target_term_name) {
        this.target_term_name = target_term_name;
    }

    public String getRelationship() {
        return relationship;
    }

    public void setRelationship(String relationship) {
        this.relationship = relationship;
    }

    public String getIs_leaf() {
        return is_leaf;
    }

    public void setIs_leaf(String is_leaf) {
        this.is_leaf = is_leaf;
    }

    @Override
    public String toString() {
        return "Tree{" +
                "source_term_id='" + source_term_id + '\'' +
                ", source_term_name='" + source_term_name + '\'' +
                ", target_term_id='" + target_term_id + '\'' +
                ", target_term_name='" + target_term_name + '\'' +
                ", relationship='" + relationship + '\'' +
                ", is_leaf='" + is_leaf + '\'' +
                '}';
    }
}

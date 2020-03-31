package cn.edu.hrbmu.ontogene.domain;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 16:31
 */
public class Path {
    private String term_id;
    private String term_name;
    private String path_ids;
    private String path_names;
    private String is_leaf;

    public String getTerm_id() {
        return term_id;
    }

    public void setTerm_id(String term_id) {
        this.term_id = term_id;
    }

    public String getTerm_name() {
        return term_name;
    }

    public void setTerm_name(String term_name) {
        this.term_name = term_name;
    }

    public String getPath_ids() {
        return path_ids;
    }

    public void setPath_ids(String path_ids) {
        this.path_ids = path_ids;
    }

    public String getPath_names() {
        return path_names;
    }

    public void setPath_names(String path_names) {
        this.path_names = path_names;
    }

    public String getIs_leaf() {
        return is_leaf;
    }

    public void setIs_leaf(String is_leaf) {
        this.is_leaf = is_leaf;
    }

    @Override
    public String toString() {
        return "Path{" +
                "term_id='" + term_id + '\'' +
                ", term_name='" + term_name + '\'' +
                ", path_ids='" + path_ids + '\'' +
                ", path_names='" + path_names + '\'' +
                ", is_leaf='" + is_leaf + '\'' +
                '}';
    }
}

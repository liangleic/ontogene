package cn.edu.hrbmu.ontogene.domain;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 16:43
 */
public class Term {
    private String term_id;
    private String term_name;
    private String term_category;
    private String is_root;
    private double weights;
    private String term_description;
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

    public String getTerm_category() {
        return term_category;
    }

    public void setTerm_category(String term_category) {
        this.term_category = term_category;
    }

    public String getIs_root() {
        return is_root;
    }

    public void setIs_root(String is_root) {
        this.is_root = is_root;
    }

    public double getWeights() {
        return weights;
    }

    public void setWeights(double weights) {
        this.weights = weights;
    }

    public String getTerm_description() {
        return term_description;
    }

    public void setTerm_description(String term_description) {
        this.term_description = term_description;
    }

    public String getIs_leaf() {
        return is_leaf;
    }

    public void setIs_leaf(String is_leaf) {
        this.is_leaf = is_leaf;
    }

    @Override
    public String toString() {
        return "Term{" +
                "term_id='" + term_id + '\'' +
                ", term_name='" + term_name + '\'' +
                ", term_category='" + term_category + '\'' +
                ", is_root='" + is_root + '\'' +
                ", weights=" + weights +
                ", term_description='" + term_description + '\'' +
                ", is_leaf='" + is_leaf + '\'' +
                '}';
    }
}

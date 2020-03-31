package cn.edu.hrbmu.ontogene.domain;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 16:28
 */
public class AnnotationDetail {
    private String term_id;
    private String term_name;
    private String rna_symbol;
    private String rna_type;
    private String rna_hgnc_id;
    private double weights;
    private String source;
    private String term_type;
    private String entity_id;
    private String description;

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

    public String getRna_symbol() {
        return rna_symbol;
    }

    public void setRna_symbol(String rna_symbol) {
        this.rna_symbol = rna_symbol;
    }

    public String getRna_type() {
        return rna_type;
    }

    public void setRna_type(String rna_type) {
        this.rna_type = rna_type;
    }

    public String getRna_hgnc_id() {
        return rna_hgnc_id;
    }

    public void setRna_hgnc_id(String rna_hgnc_id) {
        this.rna_hgnc_id = rna_hgnc_id;
    }

    public double getWeights() {
        return weights;
    }

    public void setWeights(double weights) {
        this.weights = weights;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getTerm_type() {
        return term_type;
    }

    public void setTerm_type(String term_type) {
        this.term_type = term_type;
    }

    public String getEntity_id() {
        return entity_id;
    }

    public void setEntity_id(String entity_id) {
        this.entity_id = entity_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "AnnotationDetail{" +
                "term_id='" + term_id + '\'' +
                ", term_name='" + term_name + '\'' +
                ", rna_symbol='" + rna_symbol + '\'' +
                ", rna_type='" + rna_type + '\'' +
                ", rna_hgnc_id='" + rna_hgnc_id + '\'' +
                ", weights=" + weights +
                ", source='" + source + '\'' +
                ", term_type='" + term_type + '\'' +
                ", entity_id='" + entity_id + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}

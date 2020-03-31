package cn.edu.hrbmu.ontogene.domain;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 16:38
 */
public class Rna_Interaction {
    private String rna1_symbol;
    private String rna1_type;
    private String rna1_hgnc_id;
    private String rna2_symbol;
    private String rna2_type;
    private String rna2_hgnc_id;
    private double weights;

    public String getRna1_symbol() {
        return rna1_symbol;
    }

    public void setRna1_symbol(String rna1_symbol) {
        this.rna1_symbol = rna1_symbol;
    }

    public String getRna1_type() {
        return rna1_type;
    }

    public void setRna1_type(String rna1_type) {
        this.rna1_type = rna1_type;
    }

    public String getRna1_hgnc_id() {
        return rna1_hgnc_id;
    }

    public void setRna1_hgnc_id(String rna1_hgnc_id) {
        this.rna1_hgnc_id = rna1_hgnc_id;
    }

    public String getRna2_symbol() {
        return rna2_symbol;
    }

    public void setRna2_symbol(String rna2_symbol) {
        this.rna2_symbol = rna2_symbol;
    }

    public String getRna2_type() {
        return rna2_type;
    }

    public void setRna2_type(String rna2_type) {
        this.rna2_type = rna2_type;
    }

    public String getRna2_hgnc_id() {
        return rna2_hgnc_id;
    }

    public void setRna2_hgnc_id(String rna2_hgnc_id) {
        this.rna2_hgnc_id = rna2_hgnc_id;
    }

    public double getWeights() {
        return weights;
    }

    public void setWeights(double weights) {
        this.weights = weights;
    }

    @Override
    public String toString() {
        return "Rna_Interaction{" +
                "rna1_symbol='" + rna1_symbol + '\'' +
                ", rna1_type='" + rna1_type + '\'' +
                ", rna1_hgnc_id='" + rna1_hgnc_id + '\'' +
                ", rna2_symbol='" + rna2_symbol + '\'' +
                ", rna2_type='" + rna2_type + '\'' +
                ", rna2_hgnc_id='" + rna2_hgnc_id + '\'' +
                ", weights=" + weights +
                '}';
    }
}

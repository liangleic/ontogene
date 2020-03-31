package cn.edu.hrbmu.ontogene.domain;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 16:33
 */
public class Rna {
    private String rna_symbol;
    private String hgnc_id;
    private String rna_type;
    private double weights;
    private String description;

    public String getRna_symbol() {
        return rna_symbol;
    }

    public void setRna_symbol(String rna_symbol) {
        this.rna_symbol = rna_symbol;
    }


    public String getHgnc_id() {
        return hgnc_id;
    }

    public void setHgnc_id(String hgnc_id) {
        this.hgnc_id = hgnc_id;
    }

    public String getRna_type() {
        return rna_type;
    }

    public void setRna_type(String rna_type) {
        this.rna_type = rna_type;
    }

    public double getWeights() {
        return weights;
    }

    public void setWeights(double weights) {
        this.weights = weights;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Rna{" +
                "rna_symbol='" + rna_symbol + '\'' +
                ", hgnc_id='" + hgnc_id + '\'' +
                ", rna_type='" + rna_type + '\'' +
                ", weights=" + weights +
                ", description='" + description + '\'' +
                '}';
    }

}

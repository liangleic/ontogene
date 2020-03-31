package cn.edu.hrbmu.ontogene.domain;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 16:32
 */
public class Pubmed {
    private String term1_id;
    private String term1_name;
    private String term2_id;
    private String term2_name;
    private double zscore;
    private double pvalue;

    public String getTerm1_id() {
        return term1_id;
    }

    public void setTerm1_id(String term1_id) {
        this.term1_id = term1_id;
    }

    public String getTerm1_name() {
        return term1_name;
    }

    public void setTerm1_name(String term1_name) {
        this.term1_name = term1_name;
    }

    public String getTerm2_id() {
        return term2_id;
    }

    public void setTerm2_id(String term2_id) {
        this.term2_id = term2_id;
    }

    public String getTerm2_name() {
        return term2_name;
    }

    public void setTerm2_name(String term2_name) {
        this.term2_name = term2_name;
    }

    public double getZscore() {
        return zscore;
    }

    public void setZscore(double zscore) {
        this.zscore = zscore;
    }

    public double getPvalue() {
        return pvalue;
    }

    public void setPvalue(double pvalue) {
        this.pvalue = pvalue;
    }

    @Override
    public String toString() {
        return "Pubmed{" +
                "term1_id='" + term1_id + '\'' +
                ", term1_name='" + term1_name + '\'' +
                ", term2_id='" + term2_id + '\'' +
                ", term2_name='" + term2_name + '\'' +
                ", zscore=" + zscore +
                ", pvalue=" + pvalue +
                '}';
    }
}

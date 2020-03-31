package cn.edu.hrbmu.ontogene.domain;

/**
 * @author Lianglei
 * @function 函数的功能：
 * @create 2019-09-17 16:29
 */
public class Novel {
    private String geneSymbol;
    private String geneID;
    private String termName;
    private String termID;
    private String PMID;
    private String email;
    private String detail;

    public String getGeneSymbol() {
        return geneSymbol;
    }

    public void setGeneSymbol(String geneSymbol) {
        this.geneSymbol = geneSymbol;
    }

    public String getGeneID() {
        return geneID;
    }

    public void setGeneID(String geneID) {
        this.geneID = geneID;
    }

    public String getTermName() {
        return termName;
    }

    public void setTermName(String termName) {
        this.termName = termName;
    }

    public String getTermID() {
        return termID;
    }

    public void setTermID(String termID) {
        this.termID = termID;
    }

    public String getPMID() {
        return PMID;
    }

    public void setPMID(String PMID) {
        this.PMID = PMID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Override
    public String toString() {
        return "Novel{" +
                "geneSymbol='" + geneSymbol + '\'' +
                ", geneID='" + geneID + '\'' +
                ", termName='" + termName + '\'' +
                ", termID='" + termID + '\'' +
                ", PMID='" + PMID + '\'' +
                ", email='" + email + '\'' +
                ", detail='" + detail + '\'' +
                '}';
    }
}

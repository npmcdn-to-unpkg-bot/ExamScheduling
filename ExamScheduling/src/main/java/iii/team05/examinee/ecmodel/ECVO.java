package iii.team05.examinee.ecmodel;

public class ECVO implements java.io.Serializable{
	private String ecno;
	private String ecname;
	private String ecemail;
	private String ecpsd;
	private Boolean ecstatus;
	private String ecremark1;
	private ESVO eSVO;
	private ScoreVO scoreVO;
	
	public String getEcno() {
		return ecno;
	}
	public void setEcno(String ecno) {
		this.ecno = ecno;
	}
	public ESVO geteSVO() {
		return eSVO;
	}
	public void seteSVO(ESVO eSVO) {
		this.eSVO = eSVO;
	}
	public ScoreVO getScoreVO() {
		return scoreVO;
	}
	public void setScoreVO(ScoreVO scoreVO) {
		this.scoreVO = scoreVO;
	}
	public String getEcname() {
		return ecname;
	}
	public void setEcname(String ecname) {
		this.ecname = ecname;
	}
	public String getEcemail() {
		return ecemail;
	}
	public void setEcemail(String ecmail) {
		this.ecemail = ecmail;
	}
	public String getEcpsd() {
		return ecpsd;
	}
	public void setEcpsd(String ecpsd) {
		this.ecpsd = ecpsd;
	}
	public Boolean getEcstatus() {
		return ecstatus;
	}
	public void setEcstatus(Boolean ecstatus) {
		this.ecstatus = ecstatus;
	}
	public String getEcremark1() {
		return ecremark1;
	}
	public void setEcremark1(String ecremark1) {
		this.ecremark1 = ecremark1;
	}
}

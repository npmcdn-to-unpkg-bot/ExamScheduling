package iii.team05.setting.model;

public class STVO {
	private Integer setid;
	private Integer period;
	private Integer ecnum;
	private Integer ernum;
	private String  emailsubject;
	private String  emailcontent;

	
	public Integer getSetid() {
		return setid;
	}
	public void setSetid(Integer setid) {
		this.setid = setid;
	}
	public Integer getPeriod() {
		return period;
	}
	public void setPeriod(Integer period) {
		this.period = period;
	}
	public Integer getEcnum() {
		return ecnum;
	}
	public void setEcnum(Integer ecnum) {
		this.ecnum = ecnum;
	}
	public Integer getErnum() {
		return ernum;
	}
	public void setErnum(Integer ernum) {
		this.ernum = ernum;
	}
	public String getEmailsubject() {
		return emailsubject;
	}
	public void setEmailsubject(String emailsubject) {
		this.emailsubject = emailsubject;
	}
	public String getEmailcontent() {
		return emailcontent;
	}
	public void setEmailcontent(String emailcontent) {
		this.emailcontent = emailcontent;
	}

}

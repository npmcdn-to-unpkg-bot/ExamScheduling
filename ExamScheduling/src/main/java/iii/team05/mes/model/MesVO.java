package iii.team05.mes.model;

import java.sql.Date;
import java.sql.Timestamp;

public class MesVO implements java.io.Serializable{
	private Integer messageid;
	private String msgname;
	private String msgmail;
	private Timestamp msgtime;
	private String msgcontent;
	private String rpname;
	private Timestamp rptime;
	private String rpcontent;
	public Integer getMessageid() {
		return messageid;
	}
	public void setMessageid(Integer messageid) {
		this.messageid = messageid;
	}
	public String getMsgname() {
		return msgname;
	}
	public void setMsgname(String msgname) {
		this.msgname = msgname;
	}
	public String getMsgmail() {
		return msgmail;
	}
	public void setMsgmail(String msgmail) {
		this.msgmail = msgmail;
	}
	public Timestamp getMsgtime() {
		return msgtime;
	}
	public void setMsgtime(Timestamp msgtime) {
		this.msgtime = msgtime;
	}
	public String getMsgcontent() {
		return msgcontent;
	}
	public void setMsgcontent(String msgcontent) {
		this.msgcontent = msgcontent;
	}
	public String getRpname() {
		return rpname;
	}
	public void setRpname(String rpname) {
		this.rpname = rpname;
	}
	public Timestamp getRptime() {
		return rptime;
	}
	public void setRptime(Timestamp rptime) {
		this.rptime = rptime;
	}
	public String getRpcontent() {
		return rpcontent;
	}
	public void setRpcontent(String rpcontent) {
		this.rpcontent = rpcontent;
	}
	
	
	

}
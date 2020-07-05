package com.zimcarry.notice;

import java.util.Date;

public class NoticeDTO {
	private long noIdx;
	private String noTitle;
	private String noContent;
	private String noWriter;
	private Date noWritedate;
	private long noHit;
	private String noFile;
	private String noHidden;
	
	public long getNoIdx() {
		return noIdx;
	}
	public void setNoIdx(long noIdx) {
		this.noIdx = noIdx;
	}
	public String getNoTitle() {
		return noTitle;
	}
	public void setNoTitle(String noTitle) {
		this.noTitle = noTitle;
	}
	public String getNoContent() {
		return noContent;
	}
	public void setNoContent(String noContent) {
		this.noContent = noContent;
	}
	public String getNoWriter() {
		return noWriter;
	}
	public void setNoWriter(String noWriter) {
		this.noWriter = noWriter;
	}
	public Date getNoWritedate() {
		return noWritedate;
	}
	public void setNoWritedate(Date noWritedate) {
		this.noWritedate = noWritedate;
	}
	public long getNoHit() {
		return noHit;
	}
	public void setNoHit(long noHit) {
		this.noHit = noHit;
	}
	public String getNoFile() {
		return noFile;
	}
	public void setNoFile(String noFile) {
		this.noFile = noFile;
	}
	public String getNoHidden() {
		return noHidden;
	}
	public void setNoHidden(String noHidden) {
		this.noHidden = noHidden;
	}
	@Override
	public String toString() {
		return "NoticeDTO [ noIdx : " + noIdx + ", noTitle : " + noTitle + ", noContent : " + noContent.substring(0, (int)(noContent.length() / 2)) + "..., noWriter : " + noWriter + ", noWritedate : " + noWritedate + ", noHit : " + noHit + ", noFile : " + noFile + ", noHidden : " + noHidden + " ]";
	}
}
package com.zimcarry.faq;

public class FaqDTO {
	private long fIdx;
	private String fQuestion;
	private String fAnswer;
	private String fWritedate;
	private String fHidden;
	
	public long getfIdx() {
		return fIdx;
	}
	public void setfIdx(long fIdx) {
		this.fIdx = fIdx;
	}
	public String getfQuestion() {
		return fQuestion;
	}
	public void setfQuestion(String fQuestion) {
		this.fQuestion = fQuestion;
	}
	public String getfAnswer() {
		return fAnswer;
	}
	public void setfAnswer(String fAnswer) {
		this.fAnswer = fAnswer;
	}
	public String getfWritedate() {
		return fWritedate;
	}
	public void setfWritedate(String fWritedate) {
		this.fWritedate = fWritedate;
	}
	public String getfHidden() {
		return fHidden;
	}
	public void setfHidden(String fHidden) {
		this.fHidden = fHidden;
	}
	@Override
	public String toString() {
		return "FaqDTO [ fIdx : " + fIdx + ", fQuestion : " + fQuestion + ", fAnswer : " + fAnswer + ", fWritedate : " + fWritedate + ", fHidden : " + fHidden + " ]";
	}
}
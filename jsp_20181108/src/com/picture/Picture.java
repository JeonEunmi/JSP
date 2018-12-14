package com.picture;

public class Picture {

	private String pid, filename, content;

	public Picture() {
		
	}

	public Picture(String pid, String filename, String content) {
		this.pid = pid;
		this.filename = filename;
		this.content = content;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	 
	
}

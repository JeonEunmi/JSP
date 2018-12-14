package com.picture;

public class Picture {

	private String pid, filename, content, caption;

	public Picture() {
		
	}

	public Picture(String pid, String filename, String content, String caption) {
		this.pid = pid;
		this.filename = filename;
		this.content = content;
		this.caption = caption;
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

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}
	
	
	
}

package com.techelevator.model;

public class Bubble {
	
	private String message;
	private String value;
	private boolean	departmentBubble;
	private boolean topicBubble;
	private boolean linkBubble;
	private boolean subTopicBubble;
	
	public Bubble() {
		this.departmentBubble = false;
		this.topicBubble = false;
		
	}
	
	public Bubble(String message, String value) {
		this.message = message;
		this.value = value;
	}
	
	public boolean isSubTopicBubble() {
		return subTopicBubble;
	}

	public void setSubTopicBubble() {
		this.subTopicBubble = true;
	}

	public void setDepartmentBubble() {
		this.departmentBubble = true;
	}
	
	public Boolean isDepartmentBubble() {
		return departmentBubble;
	}
	
	public void setTopicBubble() {
		this.topicBubble = true;
	}
	
	public Boolean isTopicBubble() {
		return topicBubble;
	}
	
	public void setLinkBubble() {
		this.linkBubble = true;
	}
	
	public Boolean isLinkBubble() {
		return linkBubble;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	public String getValue() {
		return value;
	}


	public void setValue(String topic) {
		this.value = topic;
	}

	

	
	
}

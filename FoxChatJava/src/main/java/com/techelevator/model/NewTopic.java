package com.techelevator.model;

import javax.validation.constraints.NotBlank;

public class NewTopic {
	
	@NotBlank(message = "Topic name must not be blank!")
	private String topic_name;
	@NotBlank(message = "Department ID must not be blank!")
	private int department_id;
	@NotBlank(message = "Topic message must not be blank!")
	private String message;
	private String link_name;
	private String link_body;
	@NotBlank(message = "Keywords must not be blank!")
	private String[] keywords;
	private NewSubTopic[] subtopics;

	
	public NewTopic() {
		
	}


	


	public String getLink_name() {
		return link_name;
	}


	public void setLink_name(String link_name) {
		this.link_name = link_name;
	}

	public String getLink_body() {
		return link_body;
	}


	public void setLink_body(String link_body) {
		this.link_body = link_body;
	}


	public String getTopic_name() {
		return topic_name;
	}


	public void setTopic_name(String topic_name) {
		this.topic_name = topic_name;
	}


	public int getDepartment_id() {
		return department_id;
	}


	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}

	public String[] getKeywords() {
		return keywords;
	}


	public void setKeywords(String[] keywords) {
		this.keywords = keywords;
	}

	public NewSubTopic[] getSubtopics() {
		return subtopics;
	}


	public void setSubtopics(NewSubTopic[] subtopics) {
		this.subtopics = subtopics;
	}
	
	
}

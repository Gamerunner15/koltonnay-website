package com.techelevator.model;

public class Conversation {

	private String name;
	private String[] topics;
	private String department;
	private String message;
	private boolean questionAnswered;
	private Bubble[] bubbles;

	public Conversation() {
		this.name = "";
		this.topics = new String[] {};
		this.department = "";
		this.message = "";
		this.questionAnswered = false;
		this.bubbles = new Bubble[] {};
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}

	public String[] getTopics() {
		return topics;
	}

	public void setTopics(String[] topics) {
		this.topics = topics;
	}

	public Bubble[] getBubbles() {
		return bubbles;
	}

	public void setBubbles(Bubble[] bubbles) {
		this.bubbles = bubbles;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}


	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public boolean isQuestionAnswered() {
		return questionAnswered;
	}

	public void setQuestionAnswered(boolean questionAnswered) {
		this.questionAnswered = questionAnswered;
	}

}

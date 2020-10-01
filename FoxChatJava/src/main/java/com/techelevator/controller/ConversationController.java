package com.techelevator.controller;

import java.util.ArrayList;
import org.springframework.stereotype.Component;

import com.techelevator.dao.ConversationDAO;
import com.techelevator.dao.WebScraper;
import com.techelevator.model.Bubble;
import com.techelevator.model.Conversation;

@Component
public class ConversationController {
	private ConversationDAO DAO;
	private ArrayList<String> departmentKeywords;
	private ArrayList<String> topicKeywords;
	
	public ConversationController(ConversationDAO DAO) {
		this.DAO = DAO;
		loadKeywords();	
	}
	
	public void loadKeywords() {
		this.departmentKeywords = DAO.getDepartmentKeywords();
		this.topicKeywords = DAO.getTopicKeywords();
	}
	
	public Conversation processConversation(Conversation convo) {
		String message = convo.getMessage();
		if(message.startsWith("/help") || message.equalsIgnoreCase("help") || message.equalsIgnoreCase("commands")) {
			convo.setTopics(new String[] {"Help"});
			return DAO.getTopic(convo);
		} else if (message.startsWith("/")) {
			message = convo.getMessage().substring(1);
			if(this.parseKeywords(new String[] {message}, topicKeywords).length == 0) {
				return this.handleCommands(convo);
			}
		}
		if(convo.getDepartment().equalsIgnoreCase("") && convo.getTopics().length == 0 && convo.getName().equals("")) {
			return sendGreeting(convo);
		}
		
		convo = parseConversationForKeywords(convo);
		
		if(!convo.getDepartment().equalsIgnoreCase("")) {
			return processDepartment(convo);
		} else if(convo.getTopics().length > 0) {
			return processTopic(convo);
		} else {
			convo.setMessage("I'm sorry, I didn't understand your question. Can you ask me another way?");
			return convo;
		}
	}

	private Conversation parseConversationForKeywords(Conversation convo) {
		String[] wordsFromConvo = convo.getMessage().replaceAll("[^a-zA-Z ]", "").toLowerCase().split(" ");
		
		String[] departmentFromConvo = parseKeywords(wordsFromConvo, departmentKeywords);
		if(departmentFromConvo.length > 0) {
			convo.setDepartment(DAO.getDepartmentOnKeyword(departmentFromConvo[0]));
		}
		
		String[] topicsFromConvo = parseKeywords(wordsFromConvo, topicKeywords);
		if(topicsFromConvo.length > 0) { 
			convo = DAO.populateTopics(convo, topicsFromConvo);
		}
		return convo;
	}
	
	private String[] parseKeywords(String[] wordsFromConvo, ArrayList<String> keywordArray) {
		ArrayList<String> keywords = new ArrayList<String>();
		for(String word : wordsFromConvo) {
			if(keywordArray.contains(word.toLowerCase())) keywords.add(word.toLowerCase());
		}
		String keywordsArray[] = new String[keywords.size()];
		for (int i = 0; i < keywords.size(); i++) {
			keywordsArray[i] = keywords.get(i); 
        }
		return keywordsArray;
	}
	
	private Conversation sendGreeting(Conversation conv) {
		if(conv.getMessage().equals("")) conv.setMessage("there");
		conv.setName(conv.getMessage());
		conv.setBubbles(DAO.getDepartmentBubbles());
		conv.setMessage("Hello, " + conv.getName() + "! Click on any of the buttons below for an overview of the kind of things you can ask me.");
		return conv;
	}
	
	private Conversation processDepartment(Conversation conv) {
		if(conv.getDepartment().equals("Motivation")) {
			conv = DAO.getMotivation(conv);
			conv.setDepartment("");
			return conv;
		} else {
			conv = DAO.getDepartmentMessage(conv);
			conv.setDepartment("");
			return conv;
		}
	}
	
	private Conversation processTopic(Conversation convo) {
		if(convo.getTopics().length == 1) {
			convo = DAO.getTopic(convo);
			convo.setTopics(new String[0]);
			return convo;
			
		} else {
			convo.setMessage("Looks like there's a few topics I can help you with regarding that. Which one can I help you with?");
			return DAO.getTopicBubbles(convo);
		}
		
	}
	
	
	public Conversation handleCommands(Conversation convo) {
		String message = convo.getMessage();
		if(message.equalsIgnoreCase("/reset") || message.equalsIgnoreCase("/startover") || message.equalsIgnoreCase("/clear")) {
			convo.setBubbles(new Bubble[0]);
			convo.setDepartment("");
			convo.setMessage("Okay, let's start over. What can I help you with?");
			convo.setQuestionAnswered(false);
			convo.setTopics(new String[0]);
			return convo;
		} else if (message.startsWith("/topic")) {
			convo.setTopics(new String[] {message.substring(7)});
			return this.processTopic(convo);
		} else if(message.equalsIgnoreCase("/motivation")) {
			return DAO.getMotivation(convo);
		}
		else {
			convo.setMessage("Sorry, not a valid command currently.");
			return convo;
		}
	}
}
	
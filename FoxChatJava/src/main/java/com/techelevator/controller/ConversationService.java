package com.techelevator.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import com.techelevator.dao.ConversationDAO;
import com.techelevator.dao.WebScraper;
import com.techelevator.model.Conversation;
import com.techelevator.model.JobSearch;
import com.techelevator.model.NewTopic;

@RestController
@CrossOrigin
public class ConversationService {
	private ConversationController controller;
	private ConversationDAO DAO;
	private WebScraper scraper;
	
	public ConversationService(ConversationController controller, ConversationDAO DAO, WebScraper scraper) {
		this.controller = controller;
		this.DAO = DAO;
		this.scraper = scraper;
	}
	
	@ResponseStatus(HttpStatus.ACCEPTED)
	@RequestMapping(path="/conversation", method = RequestMethod.POST)
	public Conversation processConversation(@RequestBody Conversation conversation) {
		System.out.println(conversation.getName());
		return controller.processConversation(conversation);
	}
	@ResponseStatus(HttpStatus.ACCEPTED)
	@RequestMapping(path="/job-search", method = RequestMethod.POST)
	public Conversation jobSearch(@RequestBody JobSearch jobSearch) {
		return scraper.scrapeForJobs(jobSearch);
	}
	
//	@ResponseStatus(HttpStatus.ACCEPTED)
//	@RequestMapping(path="/event-search", method = RequestMethod.POST)
//	public Conversation eventSearch(@RequestBody Conversation convo) {
//		return scraper.scrapeForMeetups(convo.getMessage());
//	}
	
	
	//@PreAuthorize("isAuthenticated()")
	@ResponseStatus(HttpStatus.CREATED)
	@RequestMapping(path="/topics", method = RequestMethod.POST)
	public void addTopicToDatabase(@RequestBody NewTopic topic) {
		System.out.println(topic.getTopic_name());
		DAO.addTopic(topic);
		controller.loadKeywords();
	}
	
	//@PreAuthorize("isAuthenticated()")
	@ResponseStatus(HttpStatus.ACCEPTED)
	@RequestMapping(path="/topics", method = RequestMethod.GET)
	public Map<String, Integer> getSearchedTopics() {
		return DAO.getSearchedTopics();
	}
	
	
	
	
}

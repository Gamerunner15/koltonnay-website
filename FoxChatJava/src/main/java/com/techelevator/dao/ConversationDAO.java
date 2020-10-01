package com.techelevator.dao;

import java.util.ArrayList;
import java.util.Map;

import com.techelevator.model.Bubble;
import com.techelevator.model.Conversation;
import com.techelevator.model.NewTopic;

public interface ConversationDAO {
	
	public ArrayList<String> getDepartmentKeywords();
	public ArrayList<String> getTopicKeywords();
	
	public Conversation getMotivation(Conversation convo);
	
	public Conversation populateTopics(Conversation convo, String[] keyWords);
	public Conversation getTopicBubbles(Conversation convo);
	public Conversation getTopic(Conversation convo);
	public Conversation addLinkBubbles(Conversation convo);
	
	public Bubble[] getDepartmentBubbles();
	public String getDepartmentOnKeyword(String keyword);
	public Conversation getDepartmentMessage(Conversation convo);
	
	public Map<String, Integer> getSearchedTopics();
	public void addTopic(NewTopic topic);
}

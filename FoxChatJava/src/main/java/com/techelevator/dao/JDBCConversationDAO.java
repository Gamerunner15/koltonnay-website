package com.techelevator.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.controller.CustomMethods;
import com.techelevator.model.Bubble;
import com.techelevator.model.Conversation;
import com.techelevator.model.NewSubTopic;
import com.techelevator.model.NewTopic;

import java.util.concurrent.ThreadLocalRandom;

@Component
public class JDBCConversationDAO implements ConversationDAO {

	private JdbcTemplate template;

	public JDBCConversationDAO(JdbcTemplate template) {
		this.template = template;
	}

	// ---------------------------Keywords Population Calls---------------------

	@Override
	public ArrayList<String> getTopicKeywords() {
		ArrayList<String> keywordList = new ArrayList<String>();
		String sqlStatement = "SELECT * FROM keywords";
		SqlRowSet result = template.queryForRowSet(sqlStatement);
		while (result.next()) {
			keywordList.add(result.getString("word"));
		}
		return keywordList;
	}

	@Override
	public ArrayList<String> getDepartmentKeywords() {
		ArrayList<String> wordsList = new ArrayList<String>();
		String sqlStatement = "SELECT department_keyword FROM departments";
		SqlRowSet result = template.queryForRowSet(sqlStatement);
		while (result.next()) {
			wordsList.add(result.getString("department_keyword"));
		}
		return wordsList;
	}

	// ---------------------------Topic Calls---------------------

	@Override
	public Conversation getTopic(Conversation convo) {
		String sqlStatement = "SELECT * " + "FROM topics " + "WHERE topics.topic_name = ?";
		SqlRowSet result = template.queryForRowSet(sqlStatement, convo.getTopics()[0]);
		int currentCount = 0;
		if (result.next()) {
			currentCount = result.getInt("search_count");
			convo.setMessage(result.getString("message"));
		}
		String psc = "UPDATE topics SET search_count = ? WHERE topic_name = ?;";
		template.update(psc, currentCount + 1, convo.getTopics()[0]);
		convo = this.addSubTopicBubbles(convo);
		convo = this.addLinkBubbles(convo);
		return convo;
	}

	@Override
	public Conversation populateTopics(Conversation convo, String[] keywords) {
		ArrayList<String> topicsList = new ArrayList<String>();
		for (String keyword : keywords) {
			ArrayList<String> list = getTopicsOnKeywords(keyword);
			for (String topic : list) {
				if (!topicsList.contains(topic))
					topicsList.add(topic);
			}
		}
		String[] returnArray = new String[topicsList.size()];
		for (int i = 0; i < returnArray.length; i++) {
			returnArray[i] = topicsList.get(i);
		}
		convo.setTopics(returnArray);
		return convo;
	}

	private ArrayList<String> getTopicsOnKeywords(String keyword) {
		ArrayList<String> topics = new ArrayList<String>();
		String sqlStatement = "SELECT topics.topic_name " + "FROM keywords "
				+ "JOIN keywords_topics ON keywords.id = keywords_topics.keyword_id "
				+ "JOIN topics ON keywords_topics.topic_id = topics.id " + "WHERE keywords.word = ?";
		SqlRowSet result = template.queryForRowSet(sqlStatement, keyword);
		while (result.next()) {
			topics.add(result.getString("topic_name"));
		}
		return topics;
	}

	// ---------------------------Bubbles Calls---------------------
	@Override
	public Conversation getTopicBubbles(Conversation convo) {
		String[] topics = convo.getTopics();
		Bubble[] bubbles = new Bubble[topics.length];
		String sqlStatement = "SELECT * " + "FROM topics " + "WHERE topics.topic_name = ?";
		for (int i = 0; i < topics.length; i++) {
			SqlRowSet result = template.queryForRowSet(sqlStatement, topics[i]);
			Bubble bubble = new Bubble();
			if (result.next()) {
				bubble.setValue(result.getString("topic_name"));
				bubble.setMessage(result.getString("topic_name"));
				bubble.setTopicBubble();
				bubbles[i] = bubble;
			}

		}
		convo.setBubbles(bubbles);
		return convo;
	}

	public Conversation addSubTopicBubbles(Conversation convo) {
		List<Bubble> bubbleList = CustomMethods.bubblesArrayToList(convo.getBubbles());
		String sql = "SELECT * FROM sub_topics WHERE topic_id = (SELECT id FROM topics WHERE topic_name = ?)";
		SqlRowSet result = template.queryForRowSet(sql, convo.getTopics()[0]);
		while (result.next()) {
			Bubble bubble = new Bubble();
			bubble.setValue(result.getString("message"));
			bubble.setMessage(result.getString("sub_topic_name"));
			bubble.setSubTopicBubble();
			bubbleList.add(bubble);
		}
		convo.setBubbles(CustomMethods.bubblesListToArray(bubbleList));
		return convo;

	}

	@Override
	public Conversation addLinkBubbles(Conversation convo) {
		List<Bubble> bubbles = CustomMethods.bubblesArrayToList(convo.getBubbles());
		String sqlStatement = "SELECT * " + "FROM links " + "JOIN links_topics ON links.id = links_topics.link_id "
				+ "JOIN topics ON links_topics.topic_id = topics.id " + "WHERE topics.topic_name = ?";
		SqlRowSet result = template.queryForRowSet(sqlStatement, convo.getTopics()[0]);
		while (result.next()) {
			Bubble bubble = new Bubble();
			bubble.setValue(result.getString("link_body"));
			bubble.setMessage(result.getString("link_name"));
			bubble.setLinkBubble();
			bubbles.add(bubble);
		}
		Bubble[] bubbleArray = CustomMethods.bubblesListToArray(bubbles);
		convo.setBubbles(bubbleArray);
		return convo;
	}

	@Override
	public Bubble[] getDepartmentBubbles() {
		ArrayList<Bubble> bubbleList = new ArrayList<Bubble>();
		String sqlStatement = "SELECT department_name " + "FROM departments";
		SqlRowSet result = template.queryForRowSet(sqlStatement);
		while (result.next()) {
			Bubble bubble = new Bubble();
			bubble.setMessage(result.getString("department_name"));
			bubble.setValue(result.getString("department_name"));
			bubble.setDepartmentBubble();
			bubbleList.add(bubble);
		}
		Bubble[] bubbles = new Bubble[bubbleList.size()];
		for (int i = 0; i < bubbles.length; i++) {
			bubbles[i] = bubbleList.get(i);
		}
		return bubbles;
	}
	// ---------------------------Department Calls---------------------

	@Override
	public Conversation getDepartmentMessage(Conversation conv) {
		String message = "";
		String sqlStatement = "SELECT message FROM departments WHERE department_name = ?";
		SqlRowSet result = template.queryForRowSet(sqlStatement, conv.getDepartment());
		if (result.next()) {
			message = result.getString("message");
			conv.setMessage(message);
		}
		return conv;
	}

	@Override
	public String getDepartmentOnKeyword(String keyword) {
		String departmentName = "";
		String sqlStatement = "SELECT department_name " + "FROM departments " + "WHERE department_keyword = ?";
		SqlRowSet result = template.queryForRowSet(sqlStatement, keyword);
		if (result.next()) {
			departmentName = result.getString("department_name");
		}

		return departmentName;
	}

	// ---------------------------Motivation Calls---------------------
	@Override
	public Conversation getMotivation(Conversation conv) {
		String quote = "";
		int indexToPull = ThreadLocalRandom.current().nextInt(1, getMotivationTableSize() + 1);
		String sqlStatement = "SELECT quote_body FROM quotes WHERE id = ?";
		SqlRowSet result = template.queryForRowSet(sqlStatement, indexToPull);
		if (result.next()) {
			quote = result.getString(1);
		}
		conv.setMessage(quote);
		return conv;
	}

	private int getMotivationTableSize() {
		int size = 0;
		String sqlStatement = "SELECT Count(*) FROM quotes";
		SqlRowSet result = template.queryForRowSet(sqlStatement);
		if (result.next()) {
			size = result.getInt(1);
		}
		return size;
	}

	// ---------------------------Admin Only Calls---------------------
	@Override
	public Map<String, Integer> getSearchedTopics() {
		Map<String, Integer> topicsSearched = new HashMap<String, Integer>();
		String sql = "SELECT topic_name, search_count FROM topics;";
		SqlRowSet results = template.queryForRowSet(sql);
		while (results.next()) {
			topicsSearched.put(results.getString("topic_name"), results.getInt("search_count"));
		}
		return CustomMethods.sortMapByValue(topicsSearched);
	}

	public void addTopic(NewTopic topic) {
		String addTopic = "INSERT INTO topics (topic_name, department_id, message) VALUES (?, ?, ?) returning id;";
		SqlRowSet result = template.queryForRowSet(addTopic, topic.getTopic_name(), topic.getDepartment_id(),
				topic.getMessage());
		result.next();
		int topicId = result.getInt("id");
		// Adding Keywords
		for (String word : topic.getKeywords()) {
			int wordId;
			String checkKeyword = "SELECT * FROM keywords WHERE word = ?";
			SqlRowSet sameWord = template.queryForRowSet(checkKeyword, word);
			// If the word is already there, don't insert it again, just make a new
			// connection to the topic
			if (sameWord.next()) {
				wordId = sameWord.getInt("id");
				String addToJoin = "INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (?, ?);";
				template.update(addToJoin, topicId, wordId);
			} else {
				// If it IS a new keyword, insert it and make the connection
				String addKeyword = "INSERT INTO keywords (word) VALUES (?) returning id;";
				SqlRowSet keywordRow = template.queryForRowSet(addKeyword, word);
				keywordRow.next();
				int newKeywordId = keywordRow.getInt("id");
				String addToJoin = "INSERT INTO keywords_topics (topic_id, keyword_id) VALUES (?, ?);";
				template.update(addToJoin, topicId, newKeywordId);
			}
		}

		// If They want links added as well:
		if (topic.getLink_body() != null && topic.getLink_name() != null) {
			String addLink = "INSERT INTO links (link_body, link_name) VALUES (?, ?) returning id;";
			SqlRowSet row = template.queryForRowSet(addLink, topic.getLink_body(), topic.getLink_name());
			row.next();
			int linkId = row.getInt("id");

			String addLinkConnection = "INSERT INTO links_topics (link_id, topic_id) VALUES (?, ?);";
			template.update(addLinkConnection, linkId, topicId);
		}
		// If there are subtopics to add:
		if (topic.getSubtopics() != null) {
			for (NewSubTopic subTopic : topic.getSubtopics()) {
				String addSubTopic = "INSERT INTO sub_topics (sub_topic_name, message, topic_id) VALUES (?, ?, ?);";
				template.update(addSubTopic, subTopic.getSub_topic_name(), subTopic.getMessage(), topicId);
			}

		}
		
	}

}

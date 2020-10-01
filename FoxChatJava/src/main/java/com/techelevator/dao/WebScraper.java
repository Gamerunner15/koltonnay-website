package com.techelevator.dao;

import org.jsoup.*;
import org.jsoup.helper.*;
import org.jsoup.nodes.*;
import org.jsoup.select.*;
import org.springframework.stereotype.Component;

import com.techelevator.controller.CustomMethods;
import com.techelevator.model.Bubble;
import com.techelevator.model.Conversation;
import com.techelevator.model.JobSearch;

import java.io.*; // Only needed if scraping a local File.
import java.util.ArrayList;
import java.util.List;

@Component
public class WebScraper {
	Document doc;

	public WebScraper() {
	
	}
	
	
//	public Conversation scrapeForMeetups(String keyword) {
//		Conversation convo = new Conversation();
//		List<Bubble> bubbles = new ArrayList<Bubble>();
//		try {
//			doc = Jsoup.connect("https://www.meetup.com/find/us--oh--columbus/?keywords=" + keyword).get();
//		} catch (IOException ioe) {
//			ioe.printStackTrace();
//			convo.setMessage("Sorry, no events found for that search.");
//			return convo;
//		}
//		Elements events = doc.getElementsByClass("css-eno0dx");
//		if(events.size() < 1) {
//			convo.setMessage("Sorry, no events found for that search.");
//			return convo;
//		}
//		int limit = 0;
//		for (int i = 0; i < events.size(); i++) {
//			limit++;
//			Element anchor = events.get(i).select("a").first();
//			Element titleElement = events.get(i).select("p").first();
//			String title = titleElement.html();
//			String link = anchor.attr("href");
//			
//			Bubble bubble = new Bubble(title, link);
//			
//			bubble.setLinkBubble();
//			bubbles.add(bubble);
//			if(limit > 4) {
//				break;
//			}
//		}
//		convo.setMessage("Here are the top five results we found for that event search:");
//		convo.setBubbles(CustomMethods.bubblesListToArray(bubbles));
//		return convo;
//	}
	
	
	
	public Conversation scrapeForJobs(JobSearch jobSearch) {
		Conversation convo = new Conversation();
		List<Bubble> bubbles = new ArrayList<Bubble>();
		jobSearch = this.parseForHTMLCodes(jobSearch);
		try {
			doc = Jsoup.connect("https://www.indeed.com/jobs?q=" + jobSearch.getJobTitle() + "&l=" + jobSearch.getJobLocation()).get();
		} catch (IOException ioe) {
			ioe.printStackTrace();
			convo.setMessage("Sorry, no jobs found for that search.");
			return convo;
		}
		//Getting Job title and links
		Elements jobs = doc.getElementsByClass("jobtitle");
		if(jobs.size() < 1) {
			convo.setMessage("Sorry, no jobs found for that search.");
			return convo;
		}
		int limit = 0;
		for (int i = 0; i < jobs.size(); i++) {
			limit++;
			Element anchor = jobs.get(i).select("a").first();
			String partialLink = anchor.attr("href");
			String fullLink = "https://www.indeed.com" + partialLink;
			String jobTitle = anchor.attr("title");
			String company = anchor.attr("company");
			Bubble bubble = new Bubble(jobTitle, fullLink);
			bubble.setLinkBubble();
			bubbles.add(bubble);
			if(limit > 4) {
				break;
			}
		}
		//Getting Company Name
		Elements companies = doc.getElementsByClass("company");
		
		
		for (int i = 0; i < bubbles.size(); i++) {
			String companyName = "";
			if (companies.get(i).childrenSize() > 0) {
				companyName = companies.get(i).select("a").first().html();
			} else {
				companyName = companies.get(i).html();
			}
			
			 bubbles.get(i).setMessage(bubbles.get(i).getMessage() + " at " + companyName);
			
		}
		
		
		convo.setMessage("Here are the top five results we found for that job search:");
		convo.setBubbles(CustomMethods.bubblesListToArray(bubbles));
		
		return convo;
		//This is what it looks like when the apply button goes to the company site v
		//<div class="icl-u-xs-hide icl-u-lg-block icl-u-lg-textCenter"><a href="https://www.indeed.com/rc/clk?jk=cbb36a15468d509e&amp;from=vj&amp;pos=bottom&amp;spon=1&amp;adid=296715638&amp;sjdu=48EuVB8wGOkIvc83OWhit9-qY6yIBvcCj5Q4_SbLnj3a9Uz_Hrfe34YZpRHqNf9GuibIq2banQcFA39l6oM3e2JE0ZNsj1GKXCHeDXozNroYC8NuS7PAmnTLKlBkOZG8eR0j4xgeeGYFX_IBjH2YV_qmMV3oCGSlnITKOHQstuU&amp;astse=190c6ad5fdde9c1c&amp;assa=7091" referrerpolicy="origin" rel="noopener" target="_blank" role="link" class="icl-Button icl-Button--primary icl-Button--md icl-Button--block">Apply On Company Site</a></div>
	}
	
	public JobSearch parseForHTMLCodes(JobSearch jobSearch) {
		String location = jobSearch.getJobLocation();
		String title = jobSearch.getJobTitle();
		
		if(title.contains("#")) {
			title = title.replaceAll("#", "%23");
		}
		if(location.contains("#")) {
			location = location.replaceAll("#", "%23");
		}
		jobSearch.setJobTitle(title);
		jobSearch.setJobLocation(location);
		return jobSearch;
	}
	
	
	
}
	
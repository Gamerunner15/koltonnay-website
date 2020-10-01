package com.techelevator.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.techelevator.model.Bubble;

public class CustomMethods {
	
	
	public static String[] listToArray(List<String> list) {
		String[] array = new String[list.size()];
		for (int i = 0; i < array.length; i++) {
			array[i] = list.get(i);
		}
		return array;
	}
	
	public static List<String> arrayToList(String[] array){
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		return list;
	}
	
	
	public static Bubble[] bubblesListToArray(List<Bubble> list) {
		Bubble[] array = new Bubble[list.size()];
		for (int i = 0; i < array.length; i++) {
			array[i] = list.get(i);
		}
		return array;
	}
	
	public static List<Bubble> bubblesArrayToList(Bubble[] array){
		List<Bubble> list = new ArrayList<Bubble>();
		for (int i = 0; i < array.length; i++) {
			list.add(array[i]);
		}
		return list;
	}
	
	public static Map<String, Integer> sortMapByValue(Map<String, Integer> map){
		Map<String, Integer> sortedMap = new LinkedHashMap<String, Integer>();
		 
		map.entrySet().stream().sorted(Map.Entry.comparingByValue()).forEachOrdered(x -> sortedMap.put(x.getKey(), x.getValue()));
		return sortedMap;
	}

}

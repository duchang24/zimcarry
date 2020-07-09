package com.zimcarry.util;

public class Util {

	public String changeScoreString(String score) {
		switch (score) {
		case "0.5":
			return "harf";
		case "1.0":
			return "one";
		case "1.5":
			return "one_half";
		case "2.0":
			return "two";
		case "2.5":
			return "two_half";
		case "3.0":
			return "three";
		case "3.5":
			return "three_half";
		case "4.0":
			return "four";
		case "4.5":
			return "four_half";
		case "5":
			return "five";
		default:
			return "style='display: none;'";
		}
	}
}
package com.topcoder.web.tces.common;

public class TCESNav {

	String taskKey;
	String pagePath;
	String pageName;

	public TCESNav(String taskKeyIn, String pagePathIn, String pageNameIn) {
		taskKey = taskKeyIn;
		pagePath = pagePathIn;
		pageName = pageNameIn;	
	}

	public String taskKey() { return taskKey; }
	public String getPagePath() { return pagePath; }
	public String getPageName() { return pageName; }
	public String getFullPageName() { return pagePath + pageName; }

}

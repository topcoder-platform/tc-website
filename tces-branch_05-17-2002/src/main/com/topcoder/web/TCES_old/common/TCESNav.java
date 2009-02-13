package com.topcoder.web.tces.common;

public class TCESNav {

	String taskKey;
	String pagePath;
	String pageName;
	String pageTitle;
	boolean isVisible;

	public TCESNav(String taskKeyIn, String pagePathIn, String pageNameIn, String pageTitleIn) {
		this(taskKeyIn, pagePathIn, pageNameIn, pageTitleIn, true);
	}

	public TCESNav(String taskKeyIn, String pagePathIn, String pageNameIn, String pageTitleIn, boolean isVisibleIn) {
		taskKey = taskKeyIn;
		pagePath = pagePathIn;
		pageName = pageNameIn;	
		pageTitle = pageTitleIn;
		isVisible = isVisibleIn;
	}

	public String getTaskKey() { return taskKey; }
	public String getPagePath() { return pagePath; }
	public String getPageName() { return pageName; }
	public String getPageTitle() { return pageTitle; }
	public boolean isVisible() { return isVisible; }
	
	public String getFullPageName() { return pagePath + pageName; }

}

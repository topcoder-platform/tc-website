/*
 * Created on Sep 21, 2006
 */
package com.topcoder.web.forums.util;

import com.topcoder.dde.catalog.Catalog;
import com.topcoder.dde.catalog.ComponentVersionInfo;
import com.topcoder.web.forums.ForumConstants;
import com.jivesoftware.forum.ForumCategory;

/**
 * @author billy
 */
public class ImageMapper {
	private static final String STATUS_COMPLETE_ICON = "iconStatusCompleteSm.gif";
	private static final String STATUS_COLLAB_ICON = "iconStatusCollabSm.gif";
	private static final String STATUS_SPEC_ICON = "iconStatusSpecSm.gif";
	private static final String STATUS_DEV_ICON = "iconStatusDevSm.gif";
	
	private static final String STATUS_COMPLETE_TEXT = "Complete";
	private static final String STATUS_COLLAB_TEXT = "Collaboration";
	private static final String STATUS_SPEC_TEXT = "Design and Architecture";
	private static final String STATUS_DEV_TEXT = "Development and Testing";
	
	private static final String TECH_JAVA_ICON = "javaSm.gif";
	private static final String TECH_JAVA_CUSTOM_ICON = "javaCustomSm.gif";
	private static final String TECH_NET_ICON = "dotnetSm.gif";
	private static final String TECH_NET_CUSTOM_ICON = "dotnetCustomSm.gif";
	private static final String TECH_FLASH_ICON = "flashSm.gif";
	private static final String TECH_APPLICATION_ICON = "appSm.gif";
	
	private static final String TECH_JAVA_TEXT = "Java";
	private static final String TECH_JAVA_CUSTOM_TEXT = "Java Custom";
	private static final String TECH_NET_TEXT = ".NET";
	private static final String TECH_NET_CUSTOM_TEXT = ".NET Custom";
	private static final String TECH_FLASH_TEXT = "Flash";
	private static final String TECH_APPLICATION_TEXT = "Application";
	
	public static final long STATUS_IDS[] = {
		ComponentVersionInfo.COLLABORATION, ComponentVersionInfo.SPECIFICATION,
			ComponentVersionInfo.DEVELOPMENT, ComponentVersionInfo.COMPLETED
	};
	public static final String[][] STATUS_PROPERTIES = {
		{STATUS_COLLAB_ICON, STATUS_SPEC_ICON, STATUS_DEV_ICON, STATUS_COMPLETE_ICON},
		{STATUS_COLLAB_TEXT, STATUS_SPEC_TEXT, STATUS_DEV_TEXT, STATUS_COMPLETE_TEXT}
	};
	public static final long TECH_IDS[] = {
		Catalog.JAVA_CATALOG, Catalog.JAVA_CUSTOM_CATALOG, Catalog.NET_CATALOG, Catalog.NET_CUSTOM_CATALOG,
		Catalog.FLASH_CATALOG, Catalog.APPLICATION_CATALOG
	};
	public static final String[][] TECH_PROPERTIES = {
		{TECH_JAVA_ICON, TECH_JAVA_CUSTOM_ICON, TECH_NET_ICON, TECH_NET_CUSTOM_ICON,
	     TECH_FLASH_ICON, TECH_APPLICATION_ICON},
	    {TECH_JAVA_TEXT, TECH_JAVA_CUSTOM_TEXT, TECH_NET_TEXT, TECH_NET_CUSTOM_TEXT,
		 TECH_FLASH_TEXT, TECH_APPLICATION_TEXT}
	};
	
	public static String getStatusIcon(ForumCategory category) {
		return getStatusProperty(category, 0);
	}
		
	public static String getStatusText(ForumCategory category) {
		return getStatusProperty(category, 1);
	}
	
	public static String getStatusProperty(ForumCategory category, int propIdx) {
		String strComponentStatus = category.getProperty(ForumConstants.PROPERTY_COMPONENT_STATUS);
		if(strComponentStatus == null) {
			return "";
		}
		
		int componentStatus = Integer.parseInt(strComponentStatus);
		
		for (int i=0; i<STATUS_IDS.length; i++) {
			if (componentStatus == STATUS_IDS[i]) {
				return STATUS_PROPERTIES[propIdx][i];
			}
		}
		return "";
	}
	
	public static String getTechnologyIcon(ForumCategory category) {
		return getTechnologyProperty(category, 0);
	}
	
	public static String getTechnologyText(ForumCategory category) {
		return getTechnologyProperty(category, 1);
	}
	
	public static String getTechnologyProperty(ForumCategory category, int propIdx) {
		String strRootCategoryId = category.getProperty(ForumConstants.PROPERTY_COMPONENT_ROOT_CATEGORY_ID);
		if (strRootCategoryId == null) {
			return "";
		}
		long rootCategoryId = Long.parseLong(strRootCategoryId);
		
		for (int i=0; i<TECH_IDS.length; i++) {
			if (rootCategoryId == TECH_IDS[i]) {
				return TECH_PROPERTIES[propIdx][i];
			}
		}
		return "";
	}
}
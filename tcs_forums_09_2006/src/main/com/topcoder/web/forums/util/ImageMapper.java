/*
 * Created on Sep 21, 2006
 */
package com.topcoder.web.forums.util;

import java.util.HashSet;
import java.util.Set;

import com.jivesoftware.forum.ForumCategory;

/**
 * @author billy
 */
public class ImageMapper {
	private static final String STATUS_COMPLETE_ICON = "iconStatusCompleteSm.gif";
	private static final String STATUS_COLLAB_ICON = "iconStatusCollabSm.gif";
	private static final String STATUS_SPEC_ICON = "iconStatusSpecSm.gif";
	private static final String STATUS_DEV_ICON = "iconStatusDevSm.gif";
	
	private static final String TECH_JAVA_ICON = "javaSm.gif";
	private static final String TECH_NET_ICON = "netSm.gif";
	private static final String TECH_JAVA_CUSTOM_ICON = "javaCustomSm.gif";
	private static final String TECH_FLASH_ICON = "flashSm.gif";
	private static final String TECH_APPLICATION_ICON = "appSm.gif";
	private static final String TECH_BLANK_ICON = "clear.gif";
	
	
	public static String getStatusIcon(ForumCategory category) {
		String strComponentStatus = category.getProperty("componentStatus");
		if(strComponentStatus == null) {
			return null;
		}
		
		int componentStatus = Integer.parseInt(strComponentStatus);
		// TODO: are these the correct mappings?
		
		switch(componentStatus) {
			case 111: return STATUS_DEV_ICON;
			case 112: return STATUS_SPEC_ICON;
			case 113: return STATUS_COLLAB_ICON;
			case 114: return STATUS_COMPLETE_ICON;
		}
		
		return null;
	}
	
	public static String getTechnologyIcon(ForumCategory category) {
		String technologyTypeList = category.getProperty("technologyType");
		if(technologyTypeList == null || technologyTypeList.length() == 0) {
			System.out.println("technologyType property is null or blank: " + category.getName());
			return TECH_BLANK_ICON;
		}
		
		Set technologyTypes = new HashSet();
		String[] technologyTypesArr = technologyTypeList.split(",");
		for(int i=0; i < technologyTypesArr.length; i++) {
			technologyTypes.add(technologyTypesArr[i]);
		}
		
		// java icon
		String[] JAVA_TYPES = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "17", "7352908"};
		for(int i=0; i < JAVA_TYPES.length; i++) {
			if(technologyTypes.contains(JAVA_TYPES[i])) {
				return TECH_JAVA_ICON;
			}
		}
		
		// .net icon
		String[] NET_TYPES = {"11", "7375010", "8352145"};
		for(int i=0; i < NET_TYPES.length; i++) {
			if(technologyTypes.contains(NET_TYPES[i])) {
				return TECH_NET_ICON;
			}
		}
		
		// flash icon
		String[] FLASH_TYPES = {"8490750"};
		for(int i=0; i < FLASH_TYPES.length; i++) {
			if(technologyTypes.contains(FLASH_TYPES[i])) {
				return TECH_FLASH_ICON;
			}
		}
		
		System.out.println("unclassified tech type[s] for category: " + category.getName() + ": " + technologyTypeList);
		return TECH_APPLICATION_ICON;
				
		/*
			1			J2EE: Java 2 Enterprise Edition
			2			Java: Java programming language
			3			JavaBean: JavaBean
			4			EJB: Enterprise Java Beans
			5			JSP: Java ServerPages
			6			Servlet: Java Servlet technology
			7			Applet: Java Applets
			8			Java Application: Java Applications
			9			JMS: Java Messaging Service
			10			Web Services: Web Services
			11			.NET: Microsoft .NET Framework
			12			VB: Microsoft Visual Basic programming language
			13			C++: C++ programming language
			14			COM: Microsoft Component Object Model
			15			XML: Extensible Markup Language
			16			XSL: XML Style Sheets
			17			JDBC: Java DataBase Connectivity
			4202325		HTML: Hyper Text Markup Language
			4202326		HTTP: Hyper Text Transfer Protocol
			4202327		RMI: Remote Method Invocation
			5905414		C#: Microsoft C# programming language
			7352908		Custom Tag: JSP Custom Tag
			7375010		VB.NET: Visual Basic .NET Programming Language
			8352145		Remoting: .NET Remoting
			8490749		ActionScript: ActionScript programming language
			8490750		Flash: Flash
			14999206 	JSF: JavaServer Faces
			15035679 	J2ME: Java Mobile
			15035680 	MIDP 2.0: MIDP 2.0
		*/
	}
}
package com.topcoder.web.tces.common;

import java.util.*;

public class TCESNavs {

	Hashtable htNavs = new Hashtable();
	ArrayList alNavs = new ArrayList();

	TCESNav defaultNav = null;
	
	public TCESNavs() {}

	public void add(TCESNav navIn) {
		htNavs.put(navIn.getTaskKey(), navIn);
		alNavs.add(navIn);
	}
	
	public TCESNav getTCESNav(String taskKey) {
		return (htNavs.containsKey(taskKey) ? (TCESNav)htNavs.get(taskKey) : null);
	}
	
	public void setDefaultNav(String taskKey) {
		defaultNav = getTCESNav(taskKey);		
	}
	
	public TCESNav getDefaultNav() {
		if (defaultNav == null) {
			if (alNavs.size() > 0) {
				return getTCESNavs()[0];
			} else {
				return null;
			}
		}
		return defaultNav;
	}
	
	public Hashtable getHash() {
		return htNavs;
	}
	
	public TCESNav[] getTCESNavs() {
		return (TCESNav[])alNavs.toArray(new TCESNav[0]);
	}
}

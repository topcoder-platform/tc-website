package com.topcoder.web.tces.common;

import java.util.*;

public class TCESNavs {

	Hashtable htNavs = new Hashtable();
	ArrayList alNavs = new ArrayList();
	
	public TCESNavs() {}

	public void add(TCESNav navIn) {
		htNavs.put(navIn.getTaskKey(), navIn);
		alNavs.add(navIn);
	}
	
	public TCESNav getTCESNav(String taskKey) {
		return (TCESNav)htNavs.get(taskKey);
	}
	
	public Hashtable getHash() {
		return htNavs;
	}
	
	public TCESNav[] getTCESNavs() {
		return (TCESNav[])alNavs.toArray(new TCESNav[0]);
	}
}

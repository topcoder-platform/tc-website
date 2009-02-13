/**
 * Cache.java
 * August 17, 2000
 *
 * Copyright (C) 2000 CoolServlets.com. All rights reserved.
 *
 * ===================================================================
 * The Apache Software License, Version 1.1
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in
 *    the documentation and/or other materials provided with the
 *    distribution.
 *
 * 3. The end-user documentation included with the redistribution,
 *    if any, must include the following acknowledgment:
 *       "This product includes software developed by
 *        CoolServlets.com (http://www.coolservlets.com)."
 *    Alternately, this acknowledgment may appear in the software itself,
 *    if and wherever such third-party acknowledgments normally appear.
 *
 * 4. The names "Jive" and "CoolServlets.com" must not be used to
 *    endorse or promote products derived from this software without
 *    prior written permission. For written permission, please
 *    contact webmaster@coolservlets.com.
 *
 * 5. Products derived from this software may not be called "Jive",
 *    nor may "Jive" appear in their name, without prior written
 *    permission of CoolServlets.com.
 *
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESSED OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED.  IN NO EVENT SHALL COOLSERVLETS.COM OR
 * ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
 * USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals on behalf of CoolServlets.com. For more information
 * on CoolServlets.com, please see <http://www.coolservlets.com>.
 */

package com.coolservlets.util;

import java.util.*;
//JDK1.1// import com.sun.java.util.collections.*;
import java.io.*;

/**
 * Simple cache code. Note, this code has not been fully tested and optimized.
 * It also needs to be commented. :)
 */
class CachedObject implements java.io.Serializable {
	Object object;
	Date timeStamp;
	int size;
		
	CachedObject(Object object, Date timeStamp, int size) {
		this.object = object;
		this.timeStamp = timeStamp;
		this.size = size;
	}
		
	void setObject(Object object) {
		this.object = object;
	}
		
	void setTimeStamp(Date timeStamp) {
		this.timeStamp = timeStamp;
	}
		
	void setSize(int size) {
		this.size = size;
	}
		
	Object getObject() {
		return object;
	}
		
	Date getTimeStamp() {
		return timeStamp;
	}
		
	int getSize() {
		return size;
	}
}
 
 
public class Cache {
	
	private Map cachedObjects;
	private int currentSize;
	private int MAX_SIZE = 32*1024*1024;

   	public Cache() {
		cachedObjects = Collections.synchronizedMap(new HashMap());
		//cachedObjects = new HashMap();
   	}

   	public Cache(int maxSize) {
		cachedObjects = new HashMap();
		this.MAX_SIZE = maxSize;
   	}
   
	public void setMaxSize(int maxSize) {
		MAX_SIZE = maxSize;
	}
    
    public Object get(int uniqueID) {
        Integer id = new Integer(uniqueID);
        CachedObject co = (CachedObject)cachedObjects.get(id);
        co.getTimeStamp().setTime(System.currentTimeMillis());
        return co.getObject();
    }

	public void add(int uniqueID, Object object) {
		Date date = new Date();
		Integer id = new Integer( uniqueID );
		
		int objectSize = 0;
		CachedObject cachedObject = new CachedObject(object, date, objectSize);
		objectSize = getSize(cachedObject);
		cachedObject.setSize(objectSize);

		int tempSize = currentSize + objectSize;
		if (tempSize >= MAX_SIZE) 
			clearOld();
		
		cachedObjects.put(id, cachedObject);
		currentSize += objectSize;
	}

    public boolean containsKey(int key) {
        Integer id = new Integer( key );
        return cachedObjects.containsKey(id);
    }
	
	void clearOld() {
		System.out.println(currentSize);
		System.out.println(cachedObjects.size());
		//get the oldest and newest timestamp
		Date oldest = null;
		Date newest = null;
		
		Collection c = cachedObjects.values();
		Iterator iterator = c.iterator();
		
		CachedObject co = null;
		if (iterator.hasNext()) {
			co = (CachedObject)iterator.next();
			oldest = co.getTimeStamp();
			newest = co.getTimeStamp();
		}
		
		while (iterator.hasNext()) {
			co = (CachedObject)iterator.next();
			if (co.getTimeStamp().before(oldest))
				oldest = co.getTimeStamp();
				
			if (co.getTimeStamp().after(newest))
				newest = co.getTimeStamp();
		}
		
		//get the time stamp threshod value
		long timeValue = (newest.getTime() + oldest.getTime())/2;
		Date threshod = new Date(timeValue);
					
		//if the time is small than threshod time, delete it
		Set keySet = cachedObjects.keySet();
		iterator = keySet.iterator();
		
		while (iterator.hasNext()) {
			Object key = iterator.next();
        	co =(CachedObject)cachedObjects.get(key);
        	if (co.getTimeStamp().before(threshod)) {
        		currentSize -= co.getSize();
        		iterator.remove();
	       	}	
		}
		System.out.println(currentSize);
		System.out.println(cachedObjects.size());
	}
	
	public void remove(int uniqueID) {
		Integer id = new Integer(uniqueID);
		CachedObject co = (CachedObject)(cachedObjects.get(id));
        if (co != null) {
            currentSize -= co.getSize();
		    cachedObjects.remove(id);
        }
	}

    public void clear() {
        currentSize = 0;
        cachedObjects.clear();
    }

    
	private static int getSize(Object o) {
		try {
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(baos);
			oos.writeObject(o);
			oos.flush();
			int size = baos.size();
			oos.close();
			return size;
		} catch (IOException e) {
						
		}
		return -1;
	}
}

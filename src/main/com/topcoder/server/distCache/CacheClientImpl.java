package com.topcoder.server.distCache;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.ArrayList;

public class CacheClientImpl
    extends    UnicastRemoteObject
    implements CacheClient 
{
    Cache _cache;

    CacheClientImpl(Cache cache) 
        throws RemoteException
    {
        _cache = cache;
    }


    public void set(String key, Object value, long expire)
        throws RemoteException
    {
        set(key, value, Cache.DEFAULT_PRIORITY, expire);
    }
    
    public void set(String key, Object value, int prio, long expire)
        throws RemoteException
    {    
        _cache.update(key, value, prio, System.currentTimeMillis(), expire);
    }

    public Object get(String key) 
        throws RemoteException
    {
	System.out.println("GET: " + key);
        try {
            return _cache.get(key);
        } catch (Exception e) {
            e.printStackTrace();
	    return null;
        }
    }


    public Object getAndLock(String key) 
        throws RemoteException
    {
        try {
            _cache.lock(key);
            return _cache.get(key);
        } catch (Exception e) {
            e.printStackTrace();
	    return null;
        }
    }


    public void releaseLock(String key) 
        throws RemoteException
    {
        _cache.releaseLock(key);
    }

    public CachedValue remove(String key)
            throws RemoteException
    {
        CachedValue cv =  _cache.remove(key);
        if(cv!=null)return cv;
        return null;
    }

    public void clearCache()
            throws RemoteException
    {
        _cache.clearCache();
    }

    public ArrayList getValues()
            throws RemoteException
    {
        return _cache.getValues();
    }
    public int size()
            throws RemoteException
    {
        return _cache.size();
    }
}

package com.topcoder.shared.docGen.xml.xsl;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.distCache.CacheClientPool;

import java.rmi.RemoteException;
import java.util.ArrayList;

/**
 * XSLTransformerCache.java
 *
 * Description: A Singleton Cache for XSLTransformerWrappers
 *
 * @author      Steve Burrows (chuck)
 * @version     1.0
 *
 */

public class XSLTransformerCache {

//    private static java.util.HashMap cache = null;
    private static final int DEFAULT_EXPIRE_TIME = 1000 * 60 * 60 * 6;  //cache em for 6 hours
    public static final String CACHE_PREFIX = "xsl_file:";
    private static XSLTransformerCache xslTransformerCache = null;
    private static Logger log = Logger.getLogger(XSLTransformerCache.class);


    /* Singleton -- the constructor is private, must use getInstance. */
    private XSLTransformerCache() {
//        cache = new java.util.HashMap(50);
    }


    /**
     * Singleton method for getting the one instance of this class (per VM)
     * @return
     */
    public static XSLTransformerCache getInstance() {
        if (xslTransformerCache == null) xslTransformerCache = new XSLTransformerCache();
        return xslTransformerCache;
    }


    /**
     * Get the XSLTransformerWrapper indicated by the cacheKey.
     * If the XSLTransformerWrapper does not exist in the cache, it is created and put in the cache.
     * This method artificially requires that the cacheKey be the path/filename of the xsl template
     * this is not strictly necessary, but we would need another method taking both a key and
     * a template stream.
     *
     * @param fileName the unique identifier for the XSLTransformerWrapper possibly in the cache.
     *
     * @return a XSLTransformerWrapper identified by the cacheKey.
     *
     * @throws Exception
     */
    public XSLTransformerWrapper getXSLTransformerWrapper(String fileName)
            throws Exception {
        log.debug("XSLTransformerCache.getXSLTransformerWrapper for " + fileName);
        XSLTransformerWrapper result = null;
        if (fileName == null) throw new Exception("The file name can not be null.");
        String key = CACHE_PREFIX + fileName;
        try {
            result = (XSLTransformerWrapper) (CacheClientPool.getPool().getClient().get(key));
            if (result == null) {
                java.io.File file = new java.io.File(fileName);
                if (!file.exists()) throw new Exception("Unable to find file " + fileName + ".");
                result = new XSLTransformerWrapper(file);
            }
            try {
                log.debug("adding " + fileName + " to cache.");
                CacheClientPool.getPool().getClient().set(key, result, DEFAULT_EXPIRE_TIME);
                log.debug("cache size is now: " + CacheClientPool.getPool().getClient().size());
            } catch (RemoteException e) {
                log.error("UNABLE TO INSERT INTO CACHE: " + e.getMessage());
            }
        } catch (RemoteException e) {
            log.error("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: " + e.getMessage());
        }
        return result;
    }


    /**
     * returns boolean true of the cache is empty.
     *
     * @return true of the cache is empty.
     */
/*
    public boolean isEmpty() {
        return cache.isEmpty();
    }
*/
    /**
     * Remove the XSLTransformerWrapper instance from the cache indicated by the cacheKey.
     *
     * @param cacheKey the unique identifier for the XSLTransformerWrapper in the cache.
     */
/*
    public synchronized void remove(String fileName) {
        cache.remove(CACHE_PREFIX+fileName);
    }
*/

    /**
     * Remove all XSLTransformerWrapper instances from the cache.
     */
    public void clear() throws Exception {
        String tempKey = null;

        try {
            long size = CacheClientPool.getPool().getClient().size();
            ArrayList list = CacheClientPool.getPool().getClient().getKeys();
            for (int i = 0; i < list.size(); i++) {
                tempKey = (String) list.get(i);
                if (tempKey.startsWith(CACHE_PREFIX)) {
                    CacheClientPool.getPool().getClient().remove(tempKey);
                }
            }

            log.info("XSL cache cleared.  " + size + " --> " + CacheClientPool.getPool().getClient().size());
        } catch (RemoteException e) {
            throw new Exception(""+e);
        }
    }

    /**
     * The number of objects in the cache.
     *
     * @return the integer number of entries in the cache.
     *
     */
    public int size() {
        int size = 0;
        try {
            size = CacheClientPool.getPool().getClient().size();
        } catch (RemoteException e) {
            e.printStackTrace();
        }
        return size;
    }



}

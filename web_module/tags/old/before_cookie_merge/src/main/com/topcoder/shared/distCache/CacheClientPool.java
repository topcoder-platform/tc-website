package com.topcoder.shared.distCache;

import com.topcoder.shared.util.logging.Logger;

import java.rmi.RemoteException;

/**
 * Just a simple round robbin pool of cache clients.
 */
public class CacheClientPool {
    private static Logger log = Logger.getLogger(CacheClientPool.class);
    private static final int POOL_SIZE = 10;
    private CacheClient[] cacheClients;
    private static int index = 0;
    private static CacheClientPool thePool;

    private CacheClientPool() {
        cacheClients = new CacheClient[POOL_SIZE];
        buildPool();
    }

    public static CacheClientPool getPool() {
        if (thePool == null) {
            thePool = new CacheClientPool();
        }
        return thePool;
    }

    public synchronized CacheClient getClient() {
        int idx = getNextIndex();
        //log.debug("getting client at index: " + idx);
        return cacheClients[idx];
    }

    private void buildPool() {
        log.info("building cache client pool with " + POOL_SIZE + " clients");
        for (int i=0; i<POOL_SIZE; i++) {
            if (cacheClients[i]==null) {
                cacheClients[i] = CacheClientFactory.createCacheClient();
            }
        }
    }


    private int getNextIndex() {
        if (index == POOL_SIZE-1) {
            index = 0;
        } else {
            index++;
        }
        return index;
    }

}

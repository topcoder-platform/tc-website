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
        refresh();
    }

    public static CacheClientPool getPool() {
        if (thePool == null) {
            thePool = new CacheClientPool();
        }
        return thePool;
    }

    private void refresh() {
        log.debug("refreshing the cache client pool");
        for (int i=0; i<POOL_SIZE; i++) {
            if (cacheClients[i]==null) {
                cacheClients[i] = CacheClientFactory.createCacheClient();
            } else {
                try {
                    /** just attempt something simple to see if this client is alive **/
                    cacheClients[i].size();
                } catch (RemoteException e) {
                    log.debug("cacheClient died: " + e.getMessage() + "\n rebuilding it");
                    /* apparently there is a problem with this client, so create a new one */
                    cacheClients[i] = CacheClientFactory.createCacheClient();
                }
            }
        }
    }

    public synchronized CacheClient getClient() {
        return cacheClients[getNextIndex()];
    }

    private int getNextIndex() {
        if (index == POOL_SIZE-1) {
            index = 0;
        } else {
            index++;
        }
        log.debug("returning client at index: " + index);
        return index;
    }
}

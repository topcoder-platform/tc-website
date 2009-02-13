package com.topcoder.shared.distCache;
import com.topcoder.shared.util.logging.Logger;
public class CacheManager
    implements Runnable
{
    private static Logger log = Logger.getLogger(CacheManager.class);
    private CacheServer _server;

    public CacheManager(CacheServer server) {
        _server = server;
    }

    public void run() {

        while (true) {
            try {
                Thread.sleep(CacheConfiguration.getExpirationCheckDelay());
            } catch (InterruptedException e) {
            }

            expireObjects();
        }
    }

    private void expireObjects() {
        long time = System.currentTimeMillis();
        log.info(">> EXPIRING things at " + new java.util.Date(time));
        _server.cache().expire(time);
    }


}

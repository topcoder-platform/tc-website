package com.topcoder.shared.distCache;

public class CacheManager
    implements Runnable
{
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
        System.out.println(">> EXPIRING things at " + new java.util.Date(time));
        _server.cache().expire(time);
    }


}

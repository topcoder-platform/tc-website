package com.topcoder.utilities;

import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.shared.util.logging.Logger;

public class TestCache {
    private static Logger log = Logger.getLogger(TestCache.class);
    public static void main(String[] args) {
        CacheClient cc = null;
        try {
            cc = CacheClientFactory.createCacheClient();
        } catch (Exception e) {
            log.error("error", e);
        }
        String s = new String("af;lkjadf;lkjasdlkfjasl;kfjaslkfjas;lkdjfas;lkfjas;lkdjflaksdjf;laksdjf;lkadsjfl;kasjf;lkasjfl;kasjfl;kasjf;lkasdjflkasjflk;sdjal;kfjasd;lkfjasdlk;fjas;lkfjasdk;lfjlkasjf;laksjf;klasdjf;lkasjf;lkasdjfl;kasjf;lkasjf;lkasjf;klasjdf;klasjdf;lkajs;lfkjsa;lkfjaslk;fjaslkfjalskfja;klsdjfa;klsjf;alskdjf;lkasjfl;kadsfja;lksjf;lkasdjf;laksjf;lkasjf;lkasdjf;lkadsjf;lkasdjfl;kasdjf;lkasdjf;l");
        StringBuffer big = new StringBuffer(10000);
        for (int i=0; i<100000; i++) {
            big.append(String.valueOf(i));
        }

        try {
            int max = 1000;
            log.debug("add " + max + " items to the cache, cache for 50 hours");
            for (int i=0; i<max; i++) {
                cc.set("mykey"+i, s, 1000*60*60*50);
                log.debug("added item " + i);
            }
            log.debug("add " + 10*max + " items to the cache, and get every 5th, cache for a minute");
            for (int i=0; i<10*max; i++) {
                cc.set("mynewkey"+i, s, 1000*60);
                if (i%5==0) {
                    log.debug("get key " + i);
                    cc.get("mynewkey"+i);
                }
            }
            log.debug("add " + 10*max + " 200k items to the cache, and get every 5th, cache for 50 hours");
            for (int i=0; i<10*max; i++) {
                cc.set("anothernewkey"+i, big.toString(), 1000*60*60*50);
                if (i%5==0) {
                    log.debug("get key " + i);
                    cc.get("mynewkey"+i);
                }
            }        } catch (Exception e) {
            log.error("error", e);
        }
    }

}

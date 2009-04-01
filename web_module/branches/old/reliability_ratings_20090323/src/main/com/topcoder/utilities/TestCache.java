package com.topcoder.utilities;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.cache.JbossCacheClient;

public class TestCache {
    private static Logger log = Logger.getLogger(TestCache.class);
    final static String s = "af;lkjadf;lkjasdlkfjasl;kfjaslkfjas;lkdjfas;lkfjas;lkdjflaksdjf;laksdjf;lkadsjfl;kasjf;lkasjfl;kasjfl;kasjf;lkasdjflkasjflk;sdjal;kfjasd;lkfjasdlk;fjas;lkfjasdk;lfjlkasjf;laksjf;klasdjf;lkasjf;lkasdjfl;kasjf;lkasjf;lkasjf;klasjdf;klasjdf;lkajs;lfkjsa;lkfjaslk;fjaslkfjalskfja;klsdjfa;klsjf;alskdjf;lkasjfl;kadsfja;lksjf;lkasdjf;laksjf;lkasjf;lkasdjf;lkadsjf;lkasdjfl;kasdjf;lkasdjf;l";

    public static void main(String[] args) {
        JbossCacheClient cc = null;
        try {
            //cc = CacheClientFactory.create();
            cc = new JbossCacheClient();
        } catch (Exception e) {
            log.error("error", e);
        }
        StringBuffer big = new StringBuffer(10000);
        for (int i = 0; i < 100000; i++) {
            big.append(String.valueOf(i));
        }
        try {
            int max = 6000;

            long start = System.currentTimeMillis();
/*
            log.debug("add " + 50 + " size " + big.toString().getBytes().length + " items to the cache, and get every 20th");
            for (int i = 0; i < 50; i++) {
                cc.set("anothernewkey" + i, big);
                if (i % 20 == 0) {
                    log.debug("get key " + i);
                    cc.get("mynewkey" + i);
                }
            }
*/

            log.debug("add " + max + " items to the cache");
            for (int i = 0; i < max; i++) {
                cc.set("mykey" + i, s);
                log.debug("added item " + i);
            }
            log.debug("add " + max + " items to the cache, and get every 5th");
            for (int i = 0; i < max; i++) {
                cc.set("mynewkey" + i, s);
                if (i % 5 == 0) {
                    log.debug("get key " + i);
                    cc.get("mynewkey" + i);
                }
            }
            long end = System.currentTimeMillis();

            log.debug("took " + (double) (end - start) / 1000 + " seconds");
        } catch (Exception e) {
            log.error("error", e);
        }
    }

}

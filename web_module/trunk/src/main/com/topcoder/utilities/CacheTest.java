package com.topcoder.utilities;

import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.shared.util.logging.Logger;

import java.util.HashMap;
import java.util.Map;

/*
 * CacheTest.java
 *
 * Created on August 3, 2004, 4:14 PM
 */


/**
 *
 * @author  rfairfax
 */
public class CacheTest {

    private static Logger log = Logger.getLogger(CacheTest.class);
    protected static final long DEFAULT_EXPIRE_TIME = 1000 * 60 * 60 * 24 * 5;

    /** Creates a new instance of CacheTest */
    public CacheTest() {
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        try {


            Map m = new HashMap();

            m.put("ryan", "test");

            log.error("Pre-Cache: " + m.toString());

            CacheClient cc = null;
            try {
                cc = CacheClientFactory.createCacheClient();
            } catch (Exception e) {
                log.error("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: " + e.getMessage());
                System.exit(-1);
            }

            cc.set("ryan", m, DEFAULT_EXPIRE_TIME);
            log.error("Post-Cache: " + m.toString());

            m.put("ryan", "test2");
            log.error("Post-Change: " + m.toString());

            m = (Map) cc.get("ryan");
            log.error("From-Cache: " + m.toString());

        } catch (Exception e) {
            log.error(e.getMessage());
        }
    }

}

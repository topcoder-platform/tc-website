package com.topcoder.web.common.cache;

import com.topcoder.shared.util.TCResourceBundle;

/**
 * @author dok
 * @version $Revision: 60445 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 30, 2007
 */
public class CacheClientFactory {

    private static TCResourceBundle b = new TCResourceBundle("cache");

    public static CacheClient create() {
        try {
            return (CacheClient)Class.forName(b.getProperty("cache_client_class",
                    JbossCacheClient.class.getName())).newInstance();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        }
    }
    
}

package com.topcoder.utilities;

import com.topcoder.web.common.cache.JbossCacheClient;
import com.topcoder.web.common.cache.TCCacheException;

public class ClearCache {

    /**
     * @param args
     */
    public static void main(String[] args) {
        try {
            new JbossCacheClient().clearCache();
            System.out.println("cleared!");
        } catch (TCCacheException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}

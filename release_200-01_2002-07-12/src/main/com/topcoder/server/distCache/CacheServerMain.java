package com.topcoder.server.distCache;

import org.apache.log4j.Category;

public class CacheServerMain
{
    static Category log = Category.getInstance("com.server.topcoder.distCache");
    
    public static void main(String[] args) {
        // log.debug("CACHE STARTING");
        int mode = CacheServer.MODE_PRIMARY;
        for (int i=0; i<args.length; i++) {
            if (args[i].equals("-primary")) {
                mode = CacheServer.MODE_PRIMARY;

            } else if (args[i].equals("-secondary")) {
                mode = CacheServer.MODE_SECONDARY;

            } else {
                System.out.println("INVALID ARGUMENT: " + args[i]);
                return;
            }
        }
        CacheServer server = new CacheServer();
        server.setMode(mode);
        server.startCache();
    }


}

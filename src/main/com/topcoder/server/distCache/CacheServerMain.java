package com.topcoder.server.distCache;

import org.apache.log4j.Category;

public class CacheServerMain
{
    static Category log = Category.getInstance("com.server.topcoder.distCache");
    
    public static void main(String[] args) {
        String file = null;
        // log.debug("CACHE STARTING");
        int mode = CacheServer.MODE_PRIMARY;
        for (int i=0; i<args.length; i++) {
            if (args[i].equals("-primary")) {
                mode = CacheServer.MODE_PRIMARY;

            } else if (args[i].equals("-secondary")) {
                mode = CacheServer.MODE_SECONDARY;

            } else if(file==null)
            {
                file = args[i];
            }
            else {
                System.out.println("INVALID ARGUMENT: " + args[i]);
                return;
            }
        }
        if(file!=null)
        {
            System.err.println(file);
            CacheConfiguration.setResourceFile(file);
        }
        CacheServer server = new CacheServer();
        server.setMode(mode);
        server.startCache();
    }


}

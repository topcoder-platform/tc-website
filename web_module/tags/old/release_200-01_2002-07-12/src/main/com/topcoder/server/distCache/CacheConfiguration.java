package com.topcoder.server.distCache;

import java.util.Properties;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import java.rmi.registry.Registry;
import com.topcoder.server.util.TCResourceBundle;

public class CacheConfiguration 
{
    static final String BUNDLE_NAME      = "cache";
    static final String PROP_PRIMARY     = "cache.primary";
    static final String PROP_SECONDARY   = "cache.secondary";
    static final String PROP_SIZE        = "cache.size";
    static final String PROP_SYNC        = "cache.synctime";

    static final String PROP_EXPIREDELAY = "cache.expirecheck";
//    static final String PROP_EXPIRETIME  = "cache.expiretime";

    private static TCResourceBundle _bundle = null;

    // --------------------------------------------------

    /**
     *  maximum cache size, -1 means no limit
     */

    public static int getSize() {
        return getBundle().getIntProperty(PROP_SIZE, -1);
    }

    /**
     *  time between syncrhonization attempts with peer
     */

    public static int getSynchronizationDelay() {
        return getBundle().getIntProperty(PROP_SYNC, 10000);
    }

    public static int getExpirationCheckDelay() {
        return getBundle().getIntProperty(PROP_EXPIREDELAY, 60000);
    }


    public static String[] getURLS() {
        return new String[] {
            getPrimaryClientURL(),
            getSecondaryClientURL()
        };
    }


    public static String getPrimaryClientURL() {
        return "rmi://" + getBundle().getProperty(PROP_PRIMARY, "") + "/client/primary";
    }

    public static String getSecondaryClientURL() {
        return "rmi://" + getBundle().getProperty(PROP_SECONDARY, "") + "/client/secondary";
    }


    public static String getPrimaryServerURL() {
        return "rmi://" + getBundle().getProperty(PROP_PRIMARY, "") + "/server/primary";
    }

    public static String getSecondaryServerURL() {
        return "rmi://" + getBundle().getProperty(PROP_SECONDARY, "") + "/server/secondary";
    }



    public static String getPrimaryServerHost() {
        return extractHost(getBundle().getProperty(PROP_PRIMARY, ""));
    }

    public static String getSecondaryServerHost() {
        return extractHost(getBundle().getProperty(PROP_SECONDARY, ""));
    }

    public static int getPrimaryServerPort() {
        return extractPort(getBundle().getProperty(PROP_PRIMARY, ""));
    }

    public static int getSecondaryServerPort() {
        return extractPort(getBundle().getProperty(PROP_SECONDARY, ""));
    }


    // --------------------------------------------------
    private static int extractPort(String hostname) {
        if (hostname == null) {
            return Registry.REGISTRY_PORT;
        }

        int pos = hostname.indexOf(':');
        
        if (pos == -1) {
            return Registry.REGISTRY_PORT;
        }

        return Integer.parseInt(hostname.substring(pos+1));
    }


    private static String extractHost(String hostname) {
        if (hostname == null) {
            return "";
        }

        int pos = hostname.indexOf(':');
        
        if (pos == -1) {
            return "";
        }

        return hostname.substring(0, pos);
    }


    private static TCResourceBundle getBundle() {
      if (_bundle == null) { 
        _bundle = new TCResourceBundle(BUNDLE_NAME);
      }
      return _bundle;    
    }


}

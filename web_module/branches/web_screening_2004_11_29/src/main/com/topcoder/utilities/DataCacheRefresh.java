package com.topcoder.utilities;

import com.topcoder.common.web.error.TCException;
import com.topcoder.common.web.util.Cache;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.common.web.xml.HTMLRenderer;

import java.net.InetAddress;


public class DataCacheRefresh {

    private static Logger log = Logger.getLogger(DataCacheRefresh.class);

    private static final String[] validArg = {"data", "xsl"};


    private static boolean byteArraysEqual(byte[] array1, byte[] array2) {
        if (array1.length != array2.length) return false;
        for (int i = 0; i < array1.length; i++) {
            if (array1[i] != array2[i]) return false;
        }
        return true;
    }


    private static boolean allTrue(boolean[] booleanArray) {
        for (int i = 0; i < booleanArray.length; i++) {
            if (!booleanArray[i]) return false;
        }
        return true;
    }


    private static boolean inArray(String[] argArray, String arg) {
        for (int i = 0; i < argArray.length; i++) {
            if (arg.compareToIgnoreCase(argArray[i]) == 0) return true;
        }
        return false;
    }


    private static boolean invalidArgs(String[] args) {
        int argLen = args.length;
        if (argLen == 0 || argLen > validArg.length) {
            return true;
        }
        for (int i = 0; i < args.length; i++) {
            if (!inArray(validArg, args[i])) return true;
        }
        return false;
    }


    public static void main(String[] args) {
        try {
            refresh(args);
        } catch (Exception e) {
            System.err.println("Caught exception " + e.toString());
        }
    }


    public static void refresh(String[] args) throws TCException {
        if (invalidArgs(args)) {
            StringBuffer buf = new StringBuffer(500);
            buf.append("COMMAND FORMAT:  ");
            buf.append("java refresh ");
            for (int i = 0; i < validArg.length; i++) {
                buf.append("[");
                buf.append(validArg[i]);
                buf.append("] ");
            }
            System.out.println(buf.toString());
        } else {
            try {
                int serverCount = ApplicationServer.WEBLOGIC_CLUSTER_IP.length;
                InetAddress[] host = new InetAddress[serverCount];
                for (int i = 0; i < serverCount; i++) {
                    host[i] = InetAddress.getByName(ApplicationServer.WEBLOGIC_CLUSTER_IP[i]);
                }
                boolean[] found = new boolean[serverCount];
                for (int i = 0; i < 20; i++) {
                    try {
                        DataCache cache = Cache.get();
                        byte[] cacheIp = null;
                        if (inArray(args, "data")) {
                            cacheIp = cache.resetAll();
                        }
                        if (inArray(args, "xsl")) {
                            HTMLRenderer h = new HTMLRenderer();
                            cacheIp = h.refresh();
                        }
                        for (int j = 0; j < host.length; j++) {
                            if (byteArraysEqual(cacheIp, host[j].getAddress())) {
                                found[j] = true;
                                log.info(Conversion.ipBytesToString(cacheIp) + " REFRESHED");
                                break;
                            }
                        }
                    } catch (Exception e) {
                        log.error("ERROR: An error occured while refreshing!");
                        e.printStackTrace();
                        throw e;
                    }
                    if (allTrue(found)) break;
                }
            } catch (Exception e) {
                e.printStackTrace();
                throw new TCException("Caught exception " + e.toString());
            }
        }
    }


}

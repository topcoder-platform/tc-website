package com.topcoder.utilities;

import com.topcoder.common.web.error.TCException;
import com.topcoder.common.web.util.Cache;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.shared.docGen.xml.xsl.XSLTransformerCache;

import java.net.InetAddress;


public class XslCacheClient {

    private static Logger log = Logger.getLogger(XslCacheClient.class);

    private static final String[] validArg = {"size", "clear"};


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
            if (!invalidArgs(args)) {
                if (args[0].equals(validArg[0])) {
                    XSLTransformerCache cache = null;
                    try {
                        cache = XSLTransformerCache.getInstance();
                        System.out.println("size: " + cache.size());
                    } catch (Exception e) {
                        e.printStackTrace();
                        log.error("Error in HTMLRendererBean.refresh()");
                    }
                } else if (args[0].equals(validArg[1])) {
                    XSLTransformerCache cache = null;
                    try {
                        cache = XSLTransformerCache.getInstance();
                        cache.clear();
                    } catch (Exception e) {
                        e.printStackTrace();
                        log.error("Error in HTMLRendererBean.refresh()");
                    }
                }
            } else {
                System.out.println("valid args are: ");
                for (int i=0; i<validArg.length; i++) {
                    System.out.println(validArg[i]);
                }
            }
              
        } catch (Exception e) {
            System.err.println("Caught exception " + e.toString());
        }
    }

}

/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.function;

import java.util.Collection;
import java.util.Map;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 4, 2006
 */
public class Util {
    public static boolean contains(Collection c, Object o) {
        return c.contains(o);
    }

    public static boolean containsMapKey(Map m, Object o) {
        return m.containsKey(o);
    }
    
    public static String ordinal(int i) {
        switch (i) {
        case 1 : return "1st";
        case 2 : return "2nd";
        case 3 : return "3rd";        
        }
        return i + "th";
    }

    /**
     * <p>Constructs a path to re-sized version of desired dimension for the specified image.</p>
     * 
     * @param originalImagePath a <code>String</code> providing the path to original photo image.
     * @param width an <code>int</code> providing the desired width of the re-sized image.
     * @param height an <code>int</code> providing the desired height of the re-sized image.
     * @return a <code>String</code> providing the path to re-sized version of the specified image.
     * @since 1.1
     */
    public static String getResizedImagePath(String originalImagePath, int width, int height) {
        int dotPos = originalImagePath.lastIndexOf('.');
        return originalImagePath.substring(0, dotPos) + "_" + width + "x" + height
               + originalImagePath.substring(dotPos);
    }

}

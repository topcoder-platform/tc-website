package com.topcoder.web.common.function;

import java.util.Collection;
import java.util.Map;

/**
 * @author dok
 * @version $Revision: 60521 $ Date: 2005/01/01 00:00:00
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

}

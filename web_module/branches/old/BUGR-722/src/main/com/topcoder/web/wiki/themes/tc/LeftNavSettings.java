package com.topcoder.web.wiki.themes.tc;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * @author dok
 * @version $Revision: 65357 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 14, 2007
 */
public class LeftNavSettings implements Serializable {
    private String space;
    private HashMap<String, String> navKeys = new HashMap<String, String>();


    public String getSpace() {
        return space;
    }

    public void setSpace(String space) {
        this.space = space;
    }

    public String getNavKey(String pageTitle) {
        return navKeys.get(pageTitle);
    }

    public void setNavKey(String pageTitle, String navKey) {
        navKeys.put(pageTitle, navKey);
    }

    public void removeNavKey(String pageTitle) {
        navKeys.remove(pageTitle);
    }

    public boolean hasNavKey(String pageTitle) {
        return navKeys.containsKey(pageTitle);
    }

    public Iterator<Map.Entry<String, String>> iterator() {
        return navKeys.entrySet().iterator();
    }

    public boolean isEmpty() {
        return navKeys.isEmpty();
    }

}

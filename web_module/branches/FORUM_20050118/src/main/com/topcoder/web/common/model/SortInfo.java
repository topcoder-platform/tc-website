package com.topcoder.web.common.model;

import java.util.HashMap;

public class SortInfo {
    public static final String REQUEST_KEY = "sortInfo";
    private HashMap map;

    public SortInfo() {
        map = new HashMap();
    }

    public void addDefault(int col, String dir) {
        map.put(new Integer(col), dir);
    }

    public String getDefault(int col) {
        return (String)map.get(new Integer(col));
    }

}

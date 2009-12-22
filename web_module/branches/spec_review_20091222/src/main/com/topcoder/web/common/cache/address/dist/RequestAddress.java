package com.topcoder.web.common.cache.address.dist;

import com.topcoder.shared.dataAccess.RequestInt;
import com.topcoder.web.common.cache.address.CacheAddress;

import java.util.Map;
import java.util.TreeMap;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 8, 2007
 */
public class RequestAddress implements CacheAddress {

    private String key;

    public RequestAddress(RequestInt request) {
        key = parseKey(request);
    }


    private String parseKey(RequestInt request) {
        StringBuilder b = new StringBuilder(100);
        TreeMap t = new TreeMap(request.getProperties());
        Map.Entry entry;
        for (Object o : t.entrySet()) {
            entry = (Map.Entry) o;
            b.append("/");
            b.append(entry.getKey());
            b.append("=");
            b.append(entry.getValue());
        }
        return b.toString();
    }


    public String getKey() {
        return key;
    }
}

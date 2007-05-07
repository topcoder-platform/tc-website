package com.topcoder.web.common.cache.address.jboss;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.RequestInt;

import java.util.Map;
import java.util.TreeMap;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 7, 2007
 */
public class RequestAddress implements JbossCacheAddress {

    private String fqn;
    private String key;

    public RequestAddress(RequestInt request) {
        fqn = parseFqn(request);
        key = "data";
    }

    private String parseFqn(RequestInt request) {
        StringBuilder b = new StringBuilder(100);
        //"/" should really be Fqn.SEPERATOR but i don't want to add the dependency right now
        b.append(Root.GENERAL_DATA.path());
        String command = request.getProperty(DataAccessConstants.COMMAND);
        if (command != null) {
            b.append("/").append(request.getProperty(DataAccessConstants.COMMAND));
        }

        TreeMap<String, String> t = new TreeMap<String, String>(request.getProperties());

        for (Map.Entry<String, String> entry : t.entrySet()) {
            if (!entry.getKey().equals(DataAccessConstants.COMMAND)) {
                b.append("/");
                b.append(entry.getKey());
                b.append("=");
                b.append(entry.getValue());
            }
        }
        return b.toString();
    }

    public String getFqn() {
        return fqn;
    }

    public String getKey() {
        return key;
    }
}

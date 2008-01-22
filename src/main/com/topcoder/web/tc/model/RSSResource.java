package com.topcoder.web.tc.model;

import com.topcoder.shared.security.Resource;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 21, 2008
 */
public class RSSResource implements Resource {

    private String name = null;

    public RSSResource(String name, String dataSource) {
        this.name = new StringBuilder().append("RSS:").append(name).append(" ").
                append(Constants.DATASOURCE_ID).append(": ").append(dataSource).toString();
    }
    public String getName() {
        return this.name;
    }

}
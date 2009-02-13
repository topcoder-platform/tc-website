package com.topcoder.web.tc.model;

import com.topcoder.shared.security.Resource;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Id: RSSResource.java 69292 2008-03-20 21:19:52Z gpaul $
 *          Create Date: Jan 21, 2008
 */
public class RSSResource implements Resource {

    private static final long serialVersionUID = -5269933442169106811L;

    private String name = null;

    public RSSResource(String name, int dataSource) {
        this.name = new StringBuilder().append("RSS:").append(name).append(" ").
                append(Constants.DATASOURCE_ID).append(": ").append(dataSource).toString();
    }

    public String getName() {
        return this.name;
    }

}

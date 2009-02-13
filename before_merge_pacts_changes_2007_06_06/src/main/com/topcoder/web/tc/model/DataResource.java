package com.topcoder.web.tc.model;

import com.topcoder.shared.security.Resource;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: May 13, 2005
 */
public class DataResource implements Resource {

    private String name = null;

    public DataResource(String name) {
        this.name = "DataDump:" + name;
    }
    public String getName() {
        return this.name;
    }

}

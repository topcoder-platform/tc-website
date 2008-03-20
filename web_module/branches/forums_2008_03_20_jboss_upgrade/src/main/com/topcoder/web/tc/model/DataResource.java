package com.topcoder.web.tc.model;

import com.topcoder.shared.security.Resource;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: May 13, 2005
 */
public class DataResource implements Resource {


    private String name = null;
    private static final long serialVersionUID = -77874237629417264L;

    public DataResource(String name) {
        this.name = "DataDump:" + name;
    }
    
    public DataResource(String name, String dataSource) {
        this.name = new StringBuilder().append("DataDump:").append(name).append(" ").
                append(Constants.DATASOURCE_ID).append(": ").append(dataSource).toString();
    }

    public String getName() {
        return this.name;
    }

}

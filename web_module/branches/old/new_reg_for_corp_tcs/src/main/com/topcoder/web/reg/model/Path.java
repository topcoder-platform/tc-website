package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 21, 2006
 */
public class Path extends Base {
    private Long id;
    private String path;

    public Long getId() {
        return id;
    }

    public String getPath() {
        return path;
    }
}

package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision: 59639 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 21, 2006
 */
public class Path extends Base {
    private Long id;
    private String path;

    public Path() {
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Long getId() {
        return id;
    }

    public String getPath() {
        return path;
    }
}

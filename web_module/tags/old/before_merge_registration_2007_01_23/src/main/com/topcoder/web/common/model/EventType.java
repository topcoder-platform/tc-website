package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public class EventType extends Base {
    protected EventType() {

    }

    private Integer id;
    private String description;

    public Integer getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

}


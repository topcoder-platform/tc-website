package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision: 59639 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 19, 2006
 */
public class TeamType extends Base {

    public static final Integer HIGH_SCHOOL_TYPE = new Integer(4);
    private Integer id;
    private String description;

    public TeamType() {
    }

    public Integer getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }
}

package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 11, 2006
 */
public class SchoolType extends Base {
    private Integer id;
    private String description;

    public static final Integer HIGH_SCHOOL = new Integer(2);
    public static final Integer COLLEGE = new Integer(1);

    protected SchoolType() {

    }

    public Integer getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

}

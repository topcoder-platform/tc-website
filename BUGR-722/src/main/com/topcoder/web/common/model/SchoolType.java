package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision: 68640 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 11, 2006
 */
public class SchoolType extends Base {
    private Integer id;
    private String description;

    public static final Integer HIGH_SCHOOL = 2;
    public static final Integer COLLEGE = 1;

    public SchoolType() {

    }

    public Integer getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }


    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof SchoolType)) return false;

        SchoolType that = (SchoolType) o;

        if (!description.equals(that.description)) return false;
        if (!id.equals(that.id)) return false;

        return true;
    }

    public int hashCode() {
        int result;
        result = id.hashCode();
        result = 31 * result + description.hashCode();
        return result;
    }
}

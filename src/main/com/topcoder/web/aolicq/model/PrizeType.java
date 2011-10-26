package com.topcoder.web.aolicq.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision: 73726 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 2, 2006
 */
public class PrizeType extends Base {

    public static final Integer CONTEST = 1;
    public static final Integer BONUS = 2;

    private Integer id;
    private String description;

    public Integer getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * Override using the description as the business key
     *
     * @param o the other object
     * @return whether they are the same or not
     */
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof PrizeType)) return false;
        final PrizeType that = (PrizeType) o;
        return this.getDescription().equals(that.getDescription());
    }

    /**
     * Override using the business key of this object.
     *
     * @return the hashcode
     */
    public int hashCode() {
        return getDescription().hashCode();
    }


}

package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 25, 2006
 */
public class AlgoRatingType extends Base {

    public static final Integer HIGH_SCHOOL = new Integer(2);
    public static final Integer TC = new Integer(1);

    private Integer id;
    private String description;

    public AlgoRatingType() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}

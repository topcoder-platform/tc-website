package com.topcoder.web.common.model;

/**
 * @author dok
 * @version $Revision: 59639 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 30, 2006
 */
public class Referral extends Base {

    public static final Integer DECLINE = new Integer(0);
    public static final Integer MEMBER_REFERRAL = new Integer(40);
    public static final Integer OTHER = new Integer(10);


    private Integer id;
    private String description;
    private Integer sort;
    private Integer statusId;


    public Referral() {
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

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }


}

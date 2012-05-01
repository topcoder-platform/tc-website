package com.topcoder.web.common.model;


/**
 * A class to hold email data.
 *
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Email extends Base {

    public static final Integer TYPE_ID_PRIMARY = new Integer(1);
    public static final Integer TYPE_ID_OTHER = new Integer(2);

    public static final Integer STATUS_ID_ACTIVE = new Integer(1);
    public static final Integer STATUS_ID_UNACTIVE = new Integer(2);
    public static final Integer STATUS_ID_FAILED = new Integer(3);

    private Long id;
    private User user;
    private Integer emailTypeId;
    private String address;
    private Boolean primary;
    private Integer statusId;

    public Long getId() {
        return id;
    }

    public Email() {
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getEmailTypeId() {
        return emailTypeId;
    }

    public void setEmailTypeId(Integer emailTypeId) {
        this.emailTypeId = emailTypeId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isPrimary() {
        return primary.booleanValue();
    }

    public Boolean getPrimary() {
        return primary;
    }

    public void setPrimary(Boolean primary) {
        this.primary = primary;
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }


}

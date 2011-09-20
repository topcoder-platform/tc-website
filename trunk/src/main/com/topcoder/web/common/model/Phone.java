package com.topcoder.web.common.model;


/**
 * A class to hold phone data.
 *
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 31, 2006
 */
public class Phone extends Base {
    public static final Integer PHONE_TYPE_OFFICE = new Integer(1);
    public static final Integer PHONE_TYPE_HOME = new Integer(2);

    private Long id;
    private Integer phoneTypeId;
    private User user;
    private Boolean primary;
    private String number;

    public Long getId() {
        return id;
    }

    public Phone() {
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getPhoneTypeId() {
        return phoneTypeId;
    }

    public void setPhoneTypeId(Integer phoneTypeId) {
        this.phoneTypeId = phoneTypeId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Boolean getPrimary() {
        return primary;
    }

    public boolean isPrimary() {
        return primary.booleanValue();
    }

    public void setPrimary(Boolean primary) {
        this.primary = primary;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }


}

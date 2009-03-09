package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 11, 2006
 */
public class School extends Base {
    private Long id;
    private Address address;
    private String name;
    private String shortName;
    private SchoolType type;
    private Boolean viewable;
    private Date modifyDate;
    private User user;

    private Set<UserSchool> userSchools;

    public School() {
        this.userSchools = new HashSet<UserSchool>();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }


    public SchoolType getType() {
        return type;
    }

    public void setType(SchoolType type) {
        this.type = type;
    }


    public Boolean getViewable() {
        return viewable;
    }

    public void setViewable(Boolean viewable) {
        this.viewable = viewable;
    }

    public boolean isViewable() {
        return viewable.booleanValue();
    }

/*
    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                School oa = (School) o;
                if (oa.getId() == null || getId() == null) {
                    return oa.getName().equals(getName());
                } else {
                    return oa.getId().equals(getId());
                }
            } catch (ClassCastException e) {
                return false;
            }
        }
    }
*/

    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof School)) return false;

        School school = (School) o;

        if (id != null ? !id.equals(school.id) : school.id != null) return false;
        if (name != null ? !name.equals(school.name) : school.name != null) return false;
        if (type != null ? !type.equals(school.type) : school.type != null) return false;

        return true;
    }

    public int hashCode() {
        int result;
        result = (id != null ? id.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        return result;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * @return the UserSchool
     */
    public Set<UserSchool> getUserSchools() {
        return Collections.unmodifiableSet(userSchools);
    }

    /**
     * @param userSchools the UserSchool to set
     */
    public void setUserSchools(Set<UserSchool> userSchools) {
        this.userSchools = userSchools;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

}

package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 11, 2006
 */
public class School extends Base {
    private Long id;
    private Address address;
    private Coder coder;
    private String name;
    private String shortName;
    private SchoolType type;
    private Boolean viewable;

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

    public Coder getCoder() {
        return coder;
    }

    public void setCoder(Coder coder) {
        this.coder = coder;
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

    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                School oa = (School) o;
                if (oa.getId()==null||getId()==null) {
                    return oa.getName().equals(getName());
                } else {
                    return oa.getId().equals(getId());
                }
            } catch (ClassCastException e) {
                return false;
            }
        }
    }

}

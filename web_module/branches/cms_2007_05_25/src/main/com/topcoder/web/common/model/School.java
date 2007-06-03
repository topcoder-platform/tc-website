package com.topcoder.web.common.model;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Column;
import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 11, 2006
 */
@Entity
@Table(name="school")
public class School extends Base {
    private Long id;
    private Address address;
    private Coder coder;
    private String name;
    private String shortName;
    private SchoolType type;
    private Boolean viewable;
    private Date modifyDate;

    public School() {
    }

    @Id
    @GenericGenerator(name="school_id",
            strategy="com.topcoder.web.common.model.IdGenerator",
            parameters={@Parameter(name="sequence_name", value="SCHOOL_SEQ")})
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ManyToOne
    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @ManyToOne
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

    @Column(name="short_name")
    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }


    @ManyToOne
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
        return viewable;
    }

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

    @Column(name="modify_date", insertable=false, updatable=false)
    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

}

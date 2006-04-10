package com.topcoder.web.reg.model;

import com.topcoder.web.common.model.Base;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class Notification extends Base implements Comparable {
    private Integer id;
    private String name;
    private String status;
    private Integer sort;
    private Set registrationTypes;

    public Notification() {
        this.registrationTypes = new HashSet();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Set getRegistrationTypes() {
        return Collections.unmodifiableSet(registrationTypes);
    }

    public void setRegistrationTypes(Set registrationTypes) {
        this.registrationTypes = registrationTypes;
    }


    public Object clone() throws CloneNotSupportedException {
            Notification ret = (Notification)super.clone();
            for(Iterator it = registrationTypes.iterator(); it.hasNext();) {
                ret.registrationTypes.add(((RegistrationType)it.next()).clone());
            }
            return ret;
        }


    public int compareTo(Object o) {
        Notification other = (Notification)o;
        return getSort().compareTo(other.getSort());
    }
}

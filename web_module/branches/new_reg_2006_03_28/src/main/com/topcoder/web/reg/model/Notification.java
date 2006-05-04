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
    private Set users;

    protected Notification() {
        this.registrationTypes = new HashSet();
        this.users = new HashSet();
    }

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getStatus() {
        return status;
    }

    public Integer getSort() {
        return sort;
    }

    public Set getRegistrationTypes() {
        return Collections.unmodifiableSet(registrationTypes);
    }

    public Set getUsers() {
        return Collections.unmodifiableSet(users);
    }

    public void setUsers(Set users) {
        this.users = users;
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

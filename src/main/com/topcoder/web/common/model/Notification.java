package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * @author dok
 * @version $Revision: 64563 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 7, 2006
 */
public class Notification extends Base implements Comparable {
    private Integer id;
    private String name;
    private String status;
    private Integer sort;
    private NotificationType type;
    private Set registrationTypes;
    private Set users;

    public Notification() {
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

    public NotificationType getType() {
        return type;
    }

    public void setType(NotificationType type) {
        this.type = type;
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

    public void setId(Integer id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public void setRegistrationTypes(Set registrationTypes) {
        this.registrationTypes = registrationTypes;
    }


    public int compareTo(Object o) {
        Notification other = (Notification) o;
        return getSort().compareTo(other.getSort());
    }
}

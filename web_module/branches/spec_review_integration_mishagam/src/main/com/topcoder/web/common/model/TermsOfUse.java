package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 25, 2006
 */
public class TermsOfUse extends Base {

    private Integer id;
    private String text;
    private Integer typeId;
    private Set users;

    public TermsOfUse() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }


    public Set getUsers() {
        return Collections.unmodifiableSet(users);
    }

    public void setUsers(Set users) {
        this.users = users;
    }


    public boolean equals(Object obj) {
        boolean ret = false;
        try {
            TermsOfUse other = (TermsOfUse) obj;
            ret = other.getId().equals(getId());
        } catch (ClassCastException e) {
            ret = false;
        }
        return ret;
    }

    public int hashCode() {
        return id.hashCode();
    }


}

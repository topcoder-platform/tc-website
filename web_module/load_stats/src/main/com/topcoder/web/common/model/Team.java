package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 19, 2006
 */
public class Team extends Base {
    private Long id;
    private String name;
    private TeamType type;
    private School school;
    private Set coders;

    public Team() {
        this.coders = new HashSet();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public TeamType getType() {
        return type;
    }

    public void setType(TeamType type) {
        this.type = type;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public Set getCoders() {
        return Collections.unmodifiableSet(coders);
    }

    public void setCoders(Set coders) {
        this.coders = coders;
    }

    public int hashCode() {
        if (id == null) {
            return name.hashCode();
        } else {
            return id.hashCode();
        }
    }

    public boolean equals(Object o) {
        if (o == null) {
            return false;
        } else {
            try {
                Team oa = (Team) o;
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


}

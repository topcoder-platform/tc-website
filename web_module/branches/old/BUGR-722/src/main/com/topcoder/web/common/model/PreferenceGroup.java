package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.Set;

/**
 * @author dok
 * @version $Revision: 64563 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 3, 2006
 */
public class PreferenceGroup extends Base implements Comparable {

    public static final Integer TCCC06_REG = new Integer(5);

    private Integer id;
    private String description;
    private Integer sort;
    private Set preferences;

    public Integer getId() {
        return id;
    }

    public PreferenceGroup() {
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public int compareTo(Object o) {
        PreferenceGroup other = (PreferenceGroup) o;
        return getSort().compareTo(other.getSort());
    }

    public Set getPreferences() {
        return Collections.unmodifiableSet(preferences);
    }

    public void setPreferences(Set preferences) {
        this.preferences = preferences;
    }

    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((description == null) ? 0 : description.hashCode());
        result = PRIME * result + ((id == null) ? 0 : id.hashCode());
        result = PRIME * result + ((sort == null) ? 0 : sort.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        final PreferenceGroup other = (PreferenceGroup) obj;
        if (description == null) {
            if (other.description != null)
                return false;
        } else if (!description.equals(other.description))
            return false;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (sort == null) {
            if (other.sort != null)
                return false;
        } else if (!sort.equals(other.sort))
            return false;
        return true;
    }

    
}

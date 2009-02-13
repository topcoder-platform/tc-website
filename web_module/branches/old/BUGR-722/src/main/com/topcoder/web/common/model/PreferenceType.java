package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.Set;

/**
 * @author dok
 * @version $Revision: 64563 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 3, 2006
 */
public class PreferenceType extends Base {
    private Integer id;
    private String description;
    private Set preferences;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public PreferenceType() {
    }

    public Set getPreferences() {
        return Collections.unmodifiableSet(preferences);
    }

    public void setPreferences(Set preferences) {
        this.preferences = preferences;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((description == null) ? 0 : description.hashCode());
        result = PRIME * result + ((id == null) ? 0 : id.hashCode());
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
        final PreferenceType other = (PreferenceType) obj;
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
        return true;
    }
    
    
}

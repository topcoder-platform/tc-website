package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
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

    public Set getPreferences() {
        return Collections.unmodifiableSet(preferences);
    }

    public void setPreferences(Set preferences) {
        this.preferences = preferences;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

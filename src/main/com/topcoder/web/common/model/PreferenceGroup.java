package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
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

}

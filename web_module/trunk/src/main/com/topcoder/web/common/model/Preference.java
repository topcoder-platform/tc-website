package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.Set;


/**
 * A class to hold preference data.
 *
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 6, 2006
 */
public class Preference extends Base implements Comparable {

    public static final Integer TYPE_BOOLEAN = new Integer(1);
    public static final Integer TYPE_MULTIPLE_CHOICE = new Integer(2);
    public static final Integer TYPE_TEXT_FIELD = new Integer(3);

    public static final Integer MEMBER_CONTACT_PREFERENCE_ID = new Integer(24);

    private Integer id;
    private PreferenceType type;
    private PreferenceGroup group;
    private String name;
    private String description;
    private String sort;
    private Set values;

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

    public PreferenceType getType() {
        return type;
    }

    public void setType(PreferenceType type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public PreferenceGroup getGroup() {
        return group;
    }

    public void setGroup(PreferenceGroup group) {
        this.group = group;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public Set getValues() {
        return Collections.unmodifiableSet(values);
    }

    public void setValues(Set values) {
        this.values = values;
    }


    public int compareTo(Object o) {
        Preference other = (Preference) o;
        return getSort().compareTo(other.getSort());
    }
}

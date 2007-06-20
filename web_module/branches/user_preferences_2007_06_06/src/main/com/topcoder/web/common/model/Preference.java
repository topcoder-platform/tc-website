package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.HashSet;
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
    public static final Integer MEMBER_CONTACT_BANNED = new Integer(28);

    public static final Integer SHOW_EARNINGS_PREFERENCE_ID = new Integer(100);

    private Integer id;
    private PreferenceType type;
    private PreferenceGroup group;
    private String name;
    private String description;
    private String sort;
    private Set values;
    private Set registrationTypes;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Preference() {
        this.registrationTypes = new HashSet();
    }

    public Set getRegistrationTypes() {
        return Collections.unmodifiableSet(registrationTypes);
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

    public void setRegistrationTypes(Set registrationTypes) {
        this.registrationTypes = registrationTypes;
    }

    public int compareTo(Object o) {
        Preference other = (Preference) o;
        return getSort().compareTo(other.getSort());
    }

    @Override
    public int hashCode() {
        final int PRIME = 31;
        int result = 1;
        result = PRIME * result + ((description == null) ? 0 : description.hashCode());
        result = PRIME * result + ((group == null) ? 0 : group.hashCode());
        result = PRIME * result + ((id == null) ? 0 : id.hashCode());
        result = PRIME * result + ((name == null) ? 0 : name.hashCode());
        result = PRIME * result + ((registrationTypes == null) ? 0 : registrationTypes.hashCode());
        result = PRIME * result + ((sort == null) ? 0 : sort.hashCode());
        result = PRIME * result + ((type == null) ? 0 : type.hashCode());
        result = PRIME * result + ((values == null) ? 0 : values.hashCode());
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
        final Preference other = (Preference) obj;
        if (description == null) {
            if (other.description != null)
                return false;
        } else if (!description.equals(other.description))
            return false;
        if (group == null) {
            if (other.group != null)
                return false;
        } else if (!group.equals(other.group))
            return false;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        if (registrationTypes == null) {
            if (other.registrationTypes != null)
                return false;
        } else if (!registrationTypes.equals(other.registrationTypes))
            return false;
        if (sort == null) {
            if (other.sort != null)
                return false;
        } else if (!sort.equals(other.sort))
            return false;
        if (type == null) {
            if (other.type != null)
                return false;
        } else if (!type.equals(other.type))
            return false;
        if (values == null) {
            if (other.values != null)
                return false;
        } else if (!values.equals(other.values))
            return false;
        return true;
    }
    
    
}

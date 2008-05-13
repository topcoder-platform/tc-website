package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 10, 2006
 */
public class RegistrationType extends Base {

    private Integer id;
    private String description;
    private String name;
    private Boolean active;
    private SecurityGroup securityGroup;
    private Set notifications;
    private Set preferences;
    private Integer sort;

    public static final Integer COMPETITION_ID = 1;
    public static final Integer CORPORATE_ID = 2;
    public static final Integer HIGH_SCHOOL_ID = 3;
    public static final Integer MINIMAL_ID = 4;
    public static final Integer SOFTWARE_ID = 5;
    public static final Integer STUDIO_ID = 6;
    public static final Integer TEACHER_ID = 7;
    public static final Integer OPENAIM_ID = 8;
    public static final Integer TRUVEO_ID = 9;

    public RegistrationType() {
        this.notifications = new HashSet();
        this.preferences = new HashSet();
    }

    public RegistrationType(Integer id) {
        this.id = id;
        this.notifications = new HashSet();
        this.preferences = new HashSet();
    }

    public String getDescription() {
        return description;
    }

    public Integer getId() {
        return id;
    }


    public Boolean getActive() {
        return active;
    }

    public SecurityGroup getSecurityGroup() {
        return securityGroup;
    }

    public Set getNotifications() {
        return Collections.unmodifiableSet(notifications);
    }

    public Set getPreferences() {
        return Collections.unmodifiableSet(preferences);
    }

    public String getName() {
        return name;
    }

    public Integer getSort() {
        return sort;
    }

    /**
     * Implementatin of equals.  We're going based on the id
     * because it should be safe since we don't create new
     * registration types.
     *
     * @param obj
     * @return true if this is equals obj, false otherwise
     */
    public boolean equals(Object obj) {
        boolean ret = false;
        try {
            RegistrationType other = (RegistrationType) obj;
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

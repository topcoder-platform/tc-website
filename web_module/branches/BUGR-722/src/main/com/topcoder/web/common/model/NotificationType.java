package com.topcoder.web.common.model;

import java.util.Collections;
import java.util.Set;

/**
 * @author pulky
 * @version $Revision: 64563 $Date: 
 */
public class NotificationType extends Base {
    private Integer id;
    private String description;
    private Integer sort;
    private Set notifications;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public NotificationType() {
    }

    public Set getNotifications() {
        return Collections.unmodifiableSet(notifications);
    }

    public void setNotifications(Set notifications) {
        this.notifications = notifications;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

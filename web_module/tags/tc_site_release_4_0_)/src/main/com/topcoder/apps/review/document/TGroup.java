/*
 * TGroup.java
 *
 * Copyright � 2004, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import java.io.Serializable;

/**
 * Represents a ScorecardSectionGroup for scorecard editing.
 *
 * @author FatClimber
 */
public class TGroup implements Serializable {
    private TSection[] sections;
    private long groupId;
    private String groupName;
    private int groupSeqLoc;

    /**
     * @param sections
     * @param groupId
     * @param groupName
     * @param groupSeqLoc
     */
    public TGroup(
            TSection[] sections,
            long groupId,
            String groupName,
            int groupSeqLoc) {
        this.sections = sections;
        this.groupId = groupId;
        this.groupName = groupName;
        this.groupSeqLoc = groupSeqLoc;
    }

    /**
     * @return Returns the groupId.
     */
    public long getGroupId() {
        return groupId;
    }

    /**
     * @param groupId The groupId to set.
     */
    public void setGroupId(long groupId) {
        this.groupId = groupId;
    }

    /**
     * @return Returns the groupName.
     */
    public String getGroupName() {
        return groupName;
    }

    /**
     * @param groupName The groupName to set.
     */
    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    /**
     * @return Returns the groupSeqLoc.
     */
    public int getGroupSeqLoc() {
        return groupSeqLoc;
    }

    /**
     * @param groupSeqLoc The groupSeqLoc to set.
     */
    public void setGroupSeqLoc(int groupSeqLoc) {
        this.groupSeqLoc = groupSeqLoc;
    }

    /**
     * @return Returns the sections.
     */
    public TSection[] getSections() {
        return sections;
    }

    /**
     * @param sections The sections to set.
     */
    public void setSections(TSection[] sections) {
        this.sections = sections;
    }

}

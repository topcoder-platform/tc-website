package com.topcoder.web.tc.impl.entity;


public class ProjectStatusLookup extends LookupEntity {
    
    private long projectStatusId;
    
    public ProjectStatusLookup() {
    }

    
    public long getProjectStatusId() {
        return projectStatusId;
    }

    
    public void setProjectStatusId(long projectStatusId) {
        this.projectStatusId = projectStatusId;
    }
}

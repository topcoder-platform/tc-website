package com.topcoder.web.tc.impl.entity;

public class CompCatalog {

    private long componentId;

    private String componentName;

    private long rootCategoryId;

    public CompCatalog() {
    }

    public long getComponentId() {
        return componentId;
    }

    public String getComponentName() {
        return componentName;
    }

    public void setComponentName(String componentName) {
        this.componentName = componentName;
    }

    public void setComponentId(long componentId) {
        this.componentId = componentId;
    }

    public long getRootCategoryId() {
        return rootCategoryId;
    }

    public void setRootCategoryId(long rootCategoryId) {
        this.rootCategoryId = rootCategoryId;
    }
}

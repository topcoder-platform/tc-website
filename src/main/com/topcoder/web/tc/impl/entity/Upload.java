package com.topcoder.web.tc.impl.entity;

/**
 * This class is simply the Java mapped class for table 'upload', so that this table can be used in HQL.
 * Thread Safety:
 * This class is not thread-safe because it's mutable
 */
public class Upload {
    /**
     * The upload id. It has both getter and setter.
     * LegalValue:
     * It can be any value.
     * Initialization and Mutability:
     * It does not need to be initialized when the instance is created. 
     * Usage:
     * It is used in getUploadId(), setUploadId().
     */
    private long uploadId;

    /**
     * The project id. It has both getter and setter.
     * LegalValue:
     * It can be any value.
     * Initialization and Mutability:
     * It does not need to be initialized when the instance is created. 
     * Usage:
     * It is used in setProjectId(), getProjectId().
     */
    private long projectId;

    /**
     * The resource id. It has both getter and setter.
     * LegalValue:
     * It can be any value.
     * Initialization and Mutability:
     * It does not need to be initialized when the instance is created. 
     * Usage:
     * It is used in setResourceId(), getResourceId().
     */
    private long resourceId;

    /**
     * The upload type id. It has both getter and setter.
     * LegalValue:
     * It can be any value.
     * Initialization and Mutability:
     * It does not need to be initialized when the instance is created. 
     * Usage:
     * It is used in setUploadTypeId(), getUploadTypeId().
     */
    private long uploadTypeId;

    /**
     * This is the default constructor for the class.
     * 
     * Parameters:
     * None
     * 
     * Exception:
     * None
     * 
     * Implementation Notes:
     * Do nothing
     */
    public Upload() {
    }

    /**
     * Getter for the namesake instance variable. 
     * Simply return the namesake instance variable.
     * @return 
     */
    public long getProjectId() {
        return projectId;
    }

    /**
     * Getter for the namesake instance variable. 
     * Simply return the namesake instance variable.
     * @return 
     */
    public long getUploadId() {
        return uploadId;
    }

    /**
     * Getter for the namesake instance variable. 
     * Simply return the namesake instance variable.
     * @return 
     */
    public long getResourceId() {
        return resourceId;
    }

    /**
     * Getter for the namesake instance variable. 
     * Simply return the namesake instance variable.
     * @return 
     */
    public long getUploadTypeId() {
        return uploadTypeId;
    }

    /**
     * Setter for the namesake instance variable. 
     * Simply assign the value to the instance variable.
     * 
     * Parameters:
     * projectId - The project id. 
     * @param projectId 
     */
    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    /**
     * Setter for the namesake instance variable. 
     * Simply assign the value to the instance variable.
     * 
     * Parameters:
     * resourceId - The resource id. 
     * @param resourceId 
     */
    public void setResourceId(long resourceId) {
        this.resourceId = resourceId;
    }

    /**
     * Setter for the namesake instance variable. 
     * Simply assign the value to the instance variable.
     * 
     * Parameters:
     * uploadId - The upload id. 
     * @param uploadId 
     */
    public void setUploadId(long uploadId) {
        this.uploadId = uploadId;
    }

    /**
     * Setter for the namesake instance variable. 
     * Simply assign the value to the instance variable.
     * 
     * Parameters:
     * uploadTypeId - The upload type id. 
     * @param uploadTypeId 
     */
    public void setUploadTypeId(long uploadTypeId) {
        this.uploadTypeId = uploadTypeId;
    }
}


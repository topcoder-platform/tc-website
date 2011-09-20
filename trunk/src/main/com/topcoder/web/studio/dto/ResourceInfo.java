/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>An entity mapped to <code>tcs_catalog:resource_info</code> table.</p>
 * 
 * @author isv
 * @version 1.0 (Replatforming Studio Release 1 Assembly)
 */
public class ResourceInfo extends Base {

    /**
     * <p>A <code>Identifier</code> providing the ID of this resource info.</p>
     */
    private Identifier id;

    /**
     * <p>A <code>String</code> providing the value of resource info.</p>
     */
    private String value;

    /**
     * <p>A <code>String</code> providing the ID for record creator.</p>
     */
    private String createUser;

    /**
     * <p>A <code>String</code> providing the ID for record updater.</p>
     */
    private String modifyUser;

    /**
     * <p>A <code>Date</code> providing the date of record creation.</p>
     */
    private Date createDate;

    /**
     * <p>A <code>Date</code> providing the date for record modification.</p>
     */
    private Date modifyDate;

    /**
     * <p>Constructs new <code>ResourceInfo</code> instance. This implementation does nothing.</p>
     */
    public ResourceInfo() {
    }
    
    /**
     * <p>Gets the value of resource info.</p>
     *
     * @return a <code>String</code> providing the value of resource info.
     */
    public String getValue() {
        return this.value;
    }

    /**
     * <p>Sets the value of resource info.</p>
     *
     * @param value a <code>String</code> providing the value of resource info.
     */
    public void setValue(String value) {
        this.value = value;
    }

    /**
     * <p>Gets the ID of this resource info.</p>
     *
     * @return a <code>Identifier</code> providing the ID of this resource info.
     */
    public Identifier getId() {
        return this.id;
    }

    /**
     * <p>Sets the ID of this resource info.</p>
     *
     * @param id a <code>Identifier</code> providing the ID of this resource info.
     */
    public void setId(Identifier id) {
        this.id = id;
    }

    /**
     * <p>Gets the date for record modification.</p>
     *
     * @return a <code>Date</code> providing the date for record modification.
     */
    public Date getModifyDate() {
        return this.modifyDate;
    }

    /**
     * <p>Sets the date for record modification.</p>
     *
     * @param modifyDate a <code>Date</code> providing the date for record modification.
     */
    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * <p>Gets the date of record creation.</p>
     *
     * @return a <code>Date</code> providing the date of record creation.
     */
    public Date getCreateDate() {
        return this.createDate;
    }

    /**
     * <p>Sets the date of record creation.</p>
     *
     * @param createDate a <code>Date</code> providing the date of record creation.
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * <p>Gets the ID for record updater.</p>
     *
     * @return a <code>String</code> providing the ID for record updater.
     */
    public String getModifyUser() {
        return this.modifyUser;
    }

    /**
     * <p>Sets the ID for record updater.</p>
     *
     * @param modifyUser a <code>String</code> providing the ID for record updater.
     */
    public void setModifyUser(String modifyUser) {
        this.modifyUser = modifyUser;
    }

    /**
     * <p>Gets the ID for record creator.</p>
     *
     * @return a <code>String</code> providing the ID for record creator.
     */
    public String getCreateUser() {
        return this.createUser;
    }

    /**
     * <p>Sets the ID for record creator.</p>
     *
     * @param createUser a <code>String</code> providing the ID for record creator.
     */
    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    /**
     * <p>A class providing composite identifier for resource info.</p>
     */
    public static class Identifier implements Serializable {

        /**
         * <p>A <code>Resource</code> providing the details for resource.</p>
         */
        private Resource resource;

        /**
         * <p>A <code>Long</code> providing the ID of resource info type.</p>
         */
        private Long typeId;

        /**
         * <p>Constructs new <code>ResourceInfo$Identifier</code> instance. This implementation does nothing.</p>
         */
        public Identifier() {
        }

        /**
         * Constructs new <code>ResourceInfo$Identifier</code> instance.</p>
         * 
         * @param resource a <code>Resource</code> providing the details for resource.
         * @param typeId a <code>Long</code> providing the ID for type.
         */
        public Identifier(Resource resource, Long typeId) {
            this.resource = resource;
            this.typeId = typeId;
        }

        /**
         * <p>Checks if this object is equal to specified one.</p>
         * 
         * @param o an <code>Object</code> to compare. 
         * @return <code>true</code> if both objects are equal; <code>false</code> otherwise.
         */
        public boolean equals(Object o) {
            if (o == null || !(o instanceof ResourceInfo.Identifier)) {
                return false;
            }
            ResourceInfo.Identifier iec = (ResourceInfo.Identifier) o;
            return iec.getResource().getId().equals(this.getResource().getId())
                && iec.getTypeId().equals(this.getTypeId());
        }

        /**
         * <p>Gets the hash code value.</p>
         * 
         * @return an <code>int</code> providing the hash code value. 
         */
        public int hashCode() {
            StringBuffer buf = new StringBuffer(100);
            buf.append(getResource().getId());
            buf.append(" ");
            buf.append(getTypeId());
            return buf.toString().hashCode();
        }

        /**
         * <p>Gets the ID of resource info type.</p>
         *
         * @return a <code>Long</code> providing the ID of resource info type.
         */
        public Long getTypeId() {
            return this.typeId;
        }

        /**
         * <p>Sets the ID of resource info type.</p>
         *
         * @param typeId a <code>Long</code> providing the ID of resource info type.
         */
        public void setTypeId(Long typeId) {
            this.typeId = typeId;
        }

        /**
         * <p>Gets the details for resource.</p>
         *
         * @return a <code>Resource</code> providing the details for resource.
         */
        public Resource getResource() {
            return this.resource;
        }

        /**
         * <p>Sets the details for resource.</p>
         *
         * @param resource a <code>Resource</code> providing the details for resource.
         */
        public void setResource(Resource resource) {
            this.resource = resource;
        }
    }
}

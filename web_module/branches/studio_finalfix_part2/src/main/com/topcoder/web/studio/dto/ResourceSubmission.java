/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * <p>A POJO class used for mapping the submissions to resource, mapped to TCS catalog database.</p>
 *
 * Mutable and not thread-safe.
 *
 * @author pvmagacho
 * @version 1.0
 * @since (Re-platforming Studio Release 3 Assembly)
 */
public class ResourceSubmission extends Base implements Comparable {
    /**
     * <p>An <code>Identifier</code> providing the ID for this mapping from submission to resource.</p>
     */
    private Identifier id = new Identifier();
    
    /**
     * <p>Represents the ID of the user who created the submission.</p>
     */
    private String createUser;

    /**
     * <p>Represents the date/time when the submission was created.</p>
     */
    private Timestamp createDate;

    /**
     * <p>Represents the ID of the user who last modified the submission.</p>
     */
    private String modifyUser;

    /**
     * <p>Represents the date/time when the submission was last modified.</p>
     */
    private Timestamp modifyDate;

    /**
     * <p>Constructs new <code>ResourceSubmission</code> instance. This implementation does nothing.</p>
     */
    public ResourceSubmission() {
    }

    /**
     * <p>Gets the identifier for this mapping from submission to resource.</p>
     *
     * @return an <code>Identifier</code> identifying this mapping from submission to resource.
     */
    public Identifier getId() {
        return this.id;
    }

    /**
     * <p>Sets the identifier for this mapping from submission to resource.</p>
     *
     * @param id an <code>Identifier</code> identifying this mapping from submission to resource. 
     */
    public void setId(Identifier id) {
        this.id = id;
    }
	
	/**
	 * <p>Gets the id of the user who created the submission.</p>
	 *
	 * @return the createUser the id of the user who created the submission
	 */
	public String getCreateUser() {
		return createUser;
	}

	/**
	 * <p>Sets the id of the user who created the submission.</p>
	 *
	 * @param createUser the id of the user who created the submission to set
	 * @since 1.1
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	/**
	 * <p>Gets the date/time when the submission was created.</p>
	 *
	 * @return the date/time when the submission was created
	 */
	public Timestamp getCreateDate() {
		return createDate;
	}

	/**
	 * <p>Sets the date/time when the submission was created.</p>
	 *
	 * @param createDate the date/time when the submission was created set
	 */
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	/**
	 * <p>Gets the ID of the user who last modified the submission.</p>
	 *
	 * @return the ID of the user who last modified the submission
	 */
	public String getModifyUser() {
		return modifyUser;
	}

	/**
	 * <p>Sets the ID of the user who last modified the submission.</p>
	 *
	 * @param modifyUser the ID of the user who last modified the submission to set
	 */
	public void setModifyUser(String modifyUser) {
		this.modifyUser = modifyUser;
	}

	/**
	 * <p>Gets the date/time when the submission was last modified.</p>
	 *
	 * @return the date/time when the submission was last modified
	 */
	public Timestamp getModifyDate() {
		return modifyDate;
	}

	/**
	 * <p>Sets the date/time when the submission was last modified.</p>
	 *
	 * @param modifyDate the date/time when the submission was last modified to set
	 */
	public void setModifyDate(Timestamp modifyDate) {
		this.modifyDate = modifyDate;
	}

    /**
     * <p>Gets the submission.</p>
     *
     * @return a <code>Submission</code> representing the submission.
     */
    public Submission getSubmission() {
        return this.id.getSubmission();
    }

    /**
     * <p>Sets the submission.</p>
     *
     * @param submission a <code>Submission</code> representing the submission.
     */
    public void setSubmission(Submission submission) {
        this.id.setSubmission(submission);
    }

    /**
     * <p>Gets the resource associated with the submission.</p>
     *
     * @return an <code>Resource</code> representing the resource associated with the submission.
     */
    public Resource getResource() {
        return this.id.getResource();
    }

    /**
     * <p>Sets the resource associated with the submission.</p>
     *
     * @param resource an <code>Resource</code> representing the resource associated with the submission.
     */
    public void setResource(Resource resource) {
        this.id.setResource(resource);
    }

    /**
     * <p>Compares the specified <code>Object</code> (which is expected to be of <code>ResourceSubmission</code> type) to
     * this instance. The comparison is based on natural comparison of <code>sortIndex</code> property.</p>
     * 
     * @param o an <code>Object</code> to be compared.
     * @return an <code>int</code> which is negative integer, zero, or a positive integer as this object is less than,
     *         equal to, or greater than the specified object.
     * @throws ClassCastException if the specified object's type prevents it from being compared to this submission
     *         resource.
     */
    public int compareTo(Object o) {
        if (o == null) {
            return -1;
        }

        int thisResourceRoleId = Integer.MAX_VALUE;
        if (this.id.getResource() != null) {
        	thisResourceRoleId = this.id.getResource().getRole().getId().intValue();
        }

        // Get properties of the opponent object
        ResourceSubmission another = (ResourceSubmission) o;

        int anotherResourceRoleId = Integer.MAX_VALUE;
        if (another.getResource() != null) {
        	anotherResourceRoleId = another.getResource().getRole().getId().intValue();
        }

        // Compare objects
        if (thisResourceRoleId == anotherResourceRoleId) {
        	return 0;
        } else if (thisResourceRoleId < anotherResourceRoleId) {
            return -1;
        } else {
            return 1;
        }
    }

    /**
     * <p>Determines whether this resource submission is equal to specified object or not.</p>
     *
     * @param o an <code>Object</code> to check for equality with this resource submission.
     * @return <code>true</code> if specified object is of <code>ResourceSubmission</code> type and both mappings have
     *         submissions and resource with equal IDs and both mappings have the same sort index; <code>false</code>
     *         otherwise.
     */
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        } else if ((o == null) || !(o instanceof ResourceSubmission)) {
            return false;
        } else {
            ResourceSubmission that = (ResourceSubmission) o;
            return equal(this.id, that.id);
        }
    }

    /**
     * <p>Evaluates the hash code value for this resource submission. Such a hash code is evaluated based on hash codes of
     * the wrapped submission and resource.</p>
     *
     * @return an <code>int</code> providing the hash code value for this resource submission.
     */
    public int hashCode() {
        StringBuilder b = new StringBuilder();
        b.append(this.id == null ? " " : this.id.toString()).append(" ");
        return b.toString().hashCode();
    }

    /**
     * <p>Determines whether the specified objects are equal.</p>
     *
     * @param o1 an <code>Object</code> providing the first object to check.
     * @param o2 an <code>Object</code> providing the second object to check. 
     * @return <code>true</code> if both specified objects are <code>null</code> or both of them are not
     *        <code>null</code> and both objects are equal; <code>false</code> otherwise.
     */
    private static boolean equal(Object o1, Object o2) {
        return ((o1 == null) && (o2 == null)) || ((o1 != null) && (o2 != null) && (o1.equals(o2)));
    }

    /**
     * <p>A class representing a composite key for resource submission mappings. Such a key consists of submission and
     * resource comprising the mapping.</p>
     *
     * @author pvmagacho
     */
    public static class Identifier implements Serializable, Cloneable {

        /**
         * <p>A <code>Submission</code> representing the submission.</p>
         */
        private Submission submission = null;

        /**
         * <p>An <code>Resource</code> representing the resource associated with the submission.</p>
         */
        private Resource resource = null;

        /**
         * <p>Constructs new <code>ResourceSubmission$Identifier</code> instance. This implementation does nothing.</p>
         */
        public Identifier() {
        }

        /**
         * <p>Gets the submission.</p>
         *
         * @return a <code>Submission</code> representing the submission.
         */
        public Submission getSubmission() {
            return this.submission;
        }

        /**
         * <p>Sets the submission.</p>
         *
         * @param submission a <code>Submission</code> representing the submission.
         */
        public void setSubmission(Submission submission) {
            this.submission = submission;
        }

        /**
         * <p>Gets the resource associated with the submission.</p>
         *
         * @return an <code>Resource</code> representing the resource associated with the submission.
         */
        public Resource getResource() {
            return this.resource;
        }

        /**
         * <p>Sets the resource associated with the submission.</p>
         *
         * @param resource an <code>Resource</code> representing the resource associated with the submission.
         */
        public void setResource(Resource resource) {
            this.resource = resource;
        }

        /**
         * <p>Determines whether this identifier is equal to specified object or not.</p>
         *
         * @param o an <code>Object</code> to check for equality with this identifier.
         * @return <code>true</code> if specified object is of <code>Identifier</code> type and both identifiers have
         *         submissions and resources with equal IDs; <code>false</code> otherwise.
         */
        public boolean equals(Object o) {
            if (this == o) {
                return true;
            } else if ((o == null) || !(o instanceof Identifier)) {
                return false;
            } else {
                Identifier that = (Identifier) o;
                if ((this.submission != null) && (that.submission != null)) {
                    if ((this.resource != null) && (that.resource != null)) {
                        return equal(this.submission.getId(), that.submission.getId())
                               && equal(this.resource.getId(), that.resource.getId());
                    } else {
                        return (this.resource == null) && (that.resource == null);
                    }
                } else {
                    return (this.submission == null) && (that.submission == null);
                }
            }
        }

        /**
         * <p>Evaluates the hash code value for this identifier. Such a hash code is evaluated based on hash codes of
         * the wrapped submission and resource.</p>
         *
         * @return an <code>int</code> providing the hash code value for this identifier.
         */
        public int hashCode() {
            StringBuilder b = new StringBuilder();
            b.append(this.submission == null ? " " : this.submission.getId()).append(" ");
            b.append(this.resource == null ? " " : this.resource.getId()).append(" ");
            return b.toString().hashCode();
        }

        /**
         * <p>Gets the string presentation of this resource submision identifier.</p>
         *
         * @return a string representation of the object.
         */
        public String toString() {
            StringBuilder b = new StringBuilder();
            b.append("Submission:").append(this.submission == null ? " " : this.submission.getId()).append(" ");
            b.append("Resource:").append(this.resource == null ? " " : this.resource.getId()).append(" ");
            return b.toString();
        }
    }
}

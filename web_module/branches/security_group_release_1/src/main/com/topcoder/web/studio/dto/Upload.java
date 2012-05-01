/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;

import java.sql.Timestamp;

/**
 * <p>An entity representing a project submission upload information.</p>
 *
 * @author pvmagacho
 * @version 1.0
 * @since (Re-platforming Studio Release 3 Assembly)
 */
public class Upload extends Base {
	/**
	 * <p>Upload status ids (mapped to the upload_status_lu table).</p>
	 */
	public static final Integer STATUS_ACTIVE = 1;
	public static final Integer STATUS_DELETED = 2;
	
	/**
	 * <p>Upload type ids (mapped to the upload_type_lu table).</p>
	 */	
	public static final Integer SUBMISSION = 1;
	public static final Integer TEST_CASE = 2;
	public static final Integer FINAL_FIX = 3;
	public static final Integer REVIEW_DOCUMENT = 4;

    /**
     * <p>Upload unique identifier.</p>
     */
    private Integer id;
    
    /**
     * <p>Upload status identifier.</p>
     */
    private Integer statusId;
    
    /**
     * <p>Upload type identifier.</p>
     */
    private Integer typeId;
    
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
     * <p>Represents the project associated with the submision upload information.</p>
     */
    private Project contest;

    /**
     * <p>Represents the resource associated with the submision upload information.</p>
     */
    private Resource resource;

    /**
     * <p>Represents the file name of the submission upload.</p>
     */
    private String parameter;

    /**
     * <p>Represents the project phase of the submission upload.</p>
     */
    private ProjectPhase projectPhase;
    
    /**
     * <p>Gets the submission upload unique identifier.</p>
     *
     * @return the submission upload unique identifier
     */
    public Integer getId() {
        return id;
    }

    /**
     * <p>Sets the submission upload unique identifier.</p>
     * 
     * @param the submission upload unique identifier to set
     */
    public void setId(Integer id) {
        this.id = id;
    }
    
    /**
	 * <p>Gets the submission upload status identifier.</p>
	 *
	 * @return the submission upload status identifier
	 */
	public Integer getStatusId() {
		return statusId;
	}

	/**
	 * <p>Sets the submission upload status identifier.</p>
	 *
	 * @param statusId the submission upload status identifier to set
	 */
	public void setStatusId(Integer statusId) {
		this.statusId = statusId;
	}	
	
	/**
	 * <p>Gets the submission upload type identifier.</p>
	 *
	 * @return the submission upload type identifier
	 */
	public Integer getTypeId() {
		return typeId;
	}

	/**
	 * <p>Sets the submission upload type identifier.</p>
	 *
	 * @param typeId the submission upload type identifier to set
	 */
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	
	/**
	 * <p>Gets the id of the user who created the submission upload.</p>
	 *
	 * @return the createUser the id of the user who created the submission upload
	 */
	public String getCreateUser() {
		return createUser;
	}

	/**
	 * <p>Sets the id of the user who created the submission upload.</p>
	 *
	 * @param createUser the id of the user who created the submission upload to set
	 */
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	/**
	 * <p>Gets the date/time when the submission upload was created.</p>
	 *
	 * @return the date/time when the submission upload was created
	 */
	public Timestamp getCreateDate() {
		return createDate;
	}

	/**
	 * <p>Sets the date/time when the submission upload was created.</p>
	 *
	 * @param createDate the date/time when the submission upload was created set
	 */
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	/**
	 * <p>Gets the ID of the user who last modified the submission upload.</p>
	 *
	 * @return the ID of the user who last modified the submission upload
	 */
	public String getModifyUser() {
		return modifyUser;
	}

	/**
	 * <p>Sets the ID of the user who last modified the submission upload.</p>
	 *
	 * @param modifyUser the ID of the user who last modified the submission upload to set
	 */
	public void setModifyUser(String modifyUser) {
		this.modifyUser = modifyUser;
	}

	/**
	 * <p>Gets the date/time when the submission upload was last modified.</p>
	 *
	 * @return the date/time when the submission upload was last modified
	 */
	public Timestamp getModifyDate() {
		return modifyDate;
	}

	/**
	 * <p>Sets the date/time when the submission upload was last modified.</p>
	 *
	 * @param modifyDate the date/time when the submission upload was last modified to set
	 */
	public void setModifyDate(Timestamp modifyDate) {
		this.modifyDate = modifyDate;
	}

	/**
	 * <p>Gets the project associated with the submision upload information.</p>
	 *
	 * @return the project associated with the submision upload information
	 */
	public Project getContest() {
		return contest;
	}

	/**
	 * <p>Sets the project associated with the submision upload information.</p>
	 *
	 * @param contest the project associated with the submision upload information to set
	 */
	public void setContest(Project contest) {
		this.contest = contest;
	}

	/**
	 * <p>Gets the resource associated with the submision upload information.</p>
	 *
	 * @return the resource associated with the submision upload information
	 */
	public Resource getResource() {
		return resource;
	}

	/**
	 * <p>Sets the resource associated with the submision upload information.</p>
	 *
	 * @param resource associated with the submision upload information to set
	 */
	public void setResource(Resource resource) {
		this.resource = resource;
	}

	/**
	 * <p>Gets the file name of the submission upload.</p>
	 *
	 * @return the file name of the submission upload
	 */
	public String getParameter() {
		return parameter;
	}

	/**
	 * <p>Sets the file name of the submission upload.</p>
	 *
	 * @param parameter the file name of the submission upload to set
	 */
	public void setParameter(String parameter) {
		this.parameter = parameter;
	}

    /**
     * <p>Gets the project phase of the submission upload.</p>
     * 
     * @return the project phase of the submission upload.
     */
    public ProjectPhase getProjectPhase() {
        return projectPhase;
    }

    /**
     * <p>Sets the project phase of the submission upload.</p>
     * 
     * @param projectPhase the project phase of the submission upload to set.
     */
    public void setProjectPhase(ProjectPhase projectPhase) {
        this.projectPhase = projectPhase;
    }
}

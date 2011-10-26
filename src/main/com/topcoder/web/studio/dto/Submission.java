/*
 * Copyright (C) 2005-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.Image;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * <p>An entity representing a contest submission.</p>
 *
 * <p>
 *   Version 1.1 (Re-platforming Studio Release 3 Assembly) Change notes:
 *   <ol>
 *     <li>Updated the logic to use contests hosted in <code>tcs_catalog</code> database instead of
 *     <code>studio_oltp</code> database.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pvmagacho
 * @version 1.1
 */
public class Submission extends Base {
    /**
     * <p>Submission status (mapped to the submission_status_lu table).</p>
     */
    public static final Integer STATUS_ACTIVE = 1;
    public static final Integer FAILED_SCREENING = 2;
    public static final Integer FAILED_REVIEW = 3;
    public static final Integer COMPLETED_WITHOUT_WIN = 4;
    public static final Integer STATUS_DELETED = 5;
    public static final Integer FAILED_MILESTONE_SCREENING = 6;
    public static final Integer FAILED_MILESTONE_REVIEW = 7;

    /**
     * <p>Submission type (mapped to the submission_type_lu table).</p>
     */
    public static final Integer CONTEST_SUBMISSION = 1;
    public static final Integer SPECIFICATION_SUBMISSION = 2;
    public static final Integer MILESTONE_SUBMISSION = 3;
    
    /**
     * <p>The unique submission identifier.</p>
     */
    private Integer id;
    
    /**
     * <p>Submission status ID.</p>
     * 
     * @since 1.1
     */
    private Integer statusId;
    
    /**
     * <p>Submission type ID.</p>
     * 
     * @since 1.1
     */
    private Integer typeId;
    
    /**
     * <p>Represents the ID of the user who created the submission.</p>
     * 
     * @since 1.1
     */
    private String createUser;

    /**
     * <p>Represents the date/time when the submission was created.</p>
     * 
     * @since 1.1
     */
    private Timestamp createDate;

    /**
     * <p>Represents the ID of the user who last modified the submission.</p>
     * 
     * @since 1.1
     */
    private String modifyUser;

    /**
     * <p>Represents the date/time when the submission was last modified.</p>
     * 
     * @since 1.1
     */
    private Timestamp modifyDate;

    /**
     * <p>Represents the rank of the submission given by the user.</p>
     * 
     * @since 1.1
     */
    private Integer rank;

    /**
     * <p>Represents the <code>Upload</code> instance associated with the submission. Only one upload can be
     * associated per submission.</p>
     * 
     * @since 1.1
     */
    private Upload upload;

    /**
     * <p>Represents the <code>Prize</code> instance associated with the submission. It will be set if 
     * the submission has been placed.</p>
     * 
     * @since 1.1
     */
    private Prize prize;
    
    /**
     * <p>A <code>Set</code> containing the images associated with this submission.</p>
     * 
     * @since 1.1
     */
    private Set<SubmissionImage> images = new TreeSet<SubmissionImage>(); 
    
    /**
     * <p>Represents the mapping between submission and its resource.</p>
     * 
     * @since 1.1
     */
    private Set<ResourceSubmission> resourceSubmission = new TreeSet<ResourceSubmission>();
    
    /**
     * <p>Submission declaration.</p>
     *
     * @since 1.1
     */
    private SubmissionDeclaration declaration;

    /**
     * <p>Represents the the size of the file being submitted.</p>
     * 
     * @since 1.1
     */
    private Long fileSize;
    
    /**
     * <p>Represents the submission view count after the submission phase is closed.</p>
     * 
     * @since 1.1
     */
    private Long viewCount;

    /**
     * <p>Represents the final submission score.</p>
     * 
     * @since 1.1
     */
    private Float finalScore;
    
    /**
     * <p>Represents the final submission placement.</p>
     * 
     * @since 1.1
     */
    private Integer placement;
    
    /**
     * <p>Gets the submission unique identifier.</p>
     *
     * @return the submission unique identifier
     */
    public Integer getId() {
        return id;
    }

    /**
     * <p>Sets the submission unique identifier.</p>
     * 
     * @param the submission unique identifier to set
     */
    public void setId(Integer id) {
        this.id = id;
    }
    
    /**
     * <p>Gets the submission status identifier.</p>
     *
     * @return the submission status identifier
     * @since 1.1
     */
    public Integer getStatusId() {
        return statusId;
    }

    /**
     * <p>Sets the submission status identifier.</p>
     *
     * @param statusId the submission status identifier to set
     * @since 1.1
     */
    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }    
    
    /**
     * <p>Gets the submission type identifier.</p>
     *
     * @return the submission type identifier
     * @since 1.1
     */
    public Integer getTypeId() {
        return typeId;
    }

    /**
     * <p>Sets the submission type identifier.</p>
     *
     * @param typeId the submission type identifier to set
     * @since 1.1
     */
    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }
    
    /**
     * <p>Gets the id of the user who created the submission.</p>
     *
     * @return the createUser the id of the user who created the submission
     * @since 1.1
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
     * @since 1.1
     */
    public Timestamp getCreateDate() {
        return createDate;
    }

    /**
     * <p>Sets the date/time when the submission was created.</p>
     *
     * @param createDate the date/time when the submission was created set
     * @since 1.1
     */
    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    /**
     * <p>Gets the ID of the user who last modified the submission.</p>
     *
     * @return the ID of the user who last modified the submission
     * @since 1.1
     */
    public String getModifyUser() {
        return modifyUser;
    }

    /**
     * <p>Sets the ID of the user who last modified the submission.</p>
     *
     * @param modifyUser the ID of the user who last modified the submission to set
     * @since 1.1
     */
    public void setModifyUser(String modifyUser) {
        this.modifyUser = modifyUser;
    }

    /**
     * <p>Gets the date/time when the submission was last modified.</p>
     *
     * @return the date/time when the submission was last modified
     * @since 1.1
     */
    public Timestamp getModifyDate() {
        return modifyDate;
    }

    /**
     * <p>Sets the date/time when the submission was last modified.</p>
     *
     * @param modifyDate the date/time when the submission was last modified to set
     * @since 1.1
     */
    public void setModifyDate(Timestamp modifyDate) {
        this.modifyDate = modifyDate;
    }

    /**
     * <p>Gets the rank of the submission given by the user.</p>
     *
     * @return the rank of the submission given by the user
     * @since 1.1
     */
    public Integer getRank() {
        return rank;
    }

    /**
     * <p>Sets the rank of the submission given by the user.</p>
     *
     * @param rank the rank of the submission given by the user set
     * @since 1.1
     */
    public void setRank(Integer rank) {
        this.rank = rank;
    }

    /**
     * <p>Gets the <code>Upload</code> instance associated with the submission.</p>
     *
     * @return the <code>Upload</code> instance associated with the submission
     * @since 1.1
     */
    public Upload getUpload() {
        return upload;
    }

    /**
     * <p>Sets the <code>Upload</code> instance associated with the submission.</p>
     *
     * @param upload the <code>Upload</code> instance associated with the submission to set
     * @since 1.1
     */
    public void setUpload(Upload upload) {
        this.upload = upload;
    }

    /**
     * <p>Gets the <code>Prize</code> instance associated with the submission.</p>
     *
     * @return the <code>Prize</code> instance associated with the submission
     * @since 1.1
     */
    public Prize getPrize() {
        return prize;
    }

    /**
     * <p>Sets the <code>Prize</code> instance associated with the submission.</p>
     *
     * @param prize the <code>Prize</code> instance associated with the submission to set
     * @since 1.1
     */
    public void setPrize(Prize prize) {
        this.prize = prize;
    }

    /**
     * <p>Gets the submission declaration.</p>
     *
     * @return the submission declaration
     * @since 1.1
     */
    public SubmissionDeclaration getDeclaration() {
        return declaration;
    }

    /**
     * <p>Sets the submission declaration.</p>
     *
     * @param declaration the submission declaration to set
     * @since 1.1
     */
    public void setDeclaration(SubmissionDeclaration declaration) {
        this.declaration = declaration;
    }

    /**
     * <p>Gets the submission file size.</p>
     *
     * @return the submission file size
     * @since 1.1
     */
    public Long getFileSize() {
        return fileSize;
    }

    /**
     * <p>Sets the submission file size.</p>
     *
     * @param fileSize the submission file size information
     * @since 1.1
     */
    public void setFileSize(Long fileSize) {
        this.fileSize = fileSize;
    }

    /**
     * <p>Gets the submission view count.</p>
     *
     * @return the submission view count
     * @since 1.1
     */
    public Long getViewCount() {
        return viewCount;
    }

    /**
     * <p>Sets the submission view count.</p>
     *
     * @param the submission view count to set
     * @since 1.1
     */
    public void setViewCount(Long viewCount) {
        this.viewCount = viewCount;
    }

    /**
     * <p>Gets the final submission score.</p>
     * 
     * @return the final submission score
     * @since 1.1
     */
    public Float getFinalScore() {
        return finalScore;
    }

    /**
     * <p>Sets the final submission score.</p>
     * 
     * @param finalScore the final submission score to set
     * @since 1.1
     */
    public void setFinalScore(Float finalScore) {
        this.finalScore = finalScore;
    }

    /**
     * <p>Sets the final submission placement.</p>
     * 
     * @param placement the final submission placement to set
     * @since 1.1
     */
    public void setPlacement(Integer placement) {
        this.placement = placement;
    }

    /**
     * <p>Gets the final submission placement.</p>
     *
     * @return the final submission placement
     * @since 1.1
     */
    public Integer getPlacement() {
        return placement;
    }

    /**
     * <p>Gets the list of images associated with this submission.</p>
     *
     * @return a <code>Set</code> containing the submissions associated with this submission.
     * @since 1.1
     */
    public Set<SubmissionImage> getImages() {
        return this.images;
    }

    /**
     * <p>Sets the list of images associated with this submission.</p>
     *
     * @param images a <code>Set</code> containing the submissions associated with this submission.
     * @since 1.1
     */
    public void setImages(Set<SubmissionImage> images) {
        this.images = images;
    }

    /**
     * <p>Gets the mapping between submission and its resource.</p>
     * 
     * @return the mapping between submission and its resource
     * @since 1.1
     */
    public Set<ResourceSubmission> getResourceSubmission() {
        return this.resourceSubmission;
    }

    /**
     * <p>Sets the mapping between submission and its resource.</p>
     *
     * @param resourceSubmission the mapping between submission and its resource to set
     * @since 1.1
     */
    public void setResourceSubmission(Set<ResourceSubmission> resourceSubmission) {
        this.resourceSubmission = resourceSubmission;
    }    
    
    /**
     * <p>Adds specified image to list of images associated with this submission.</p>
     *
     * @param image an <code>Image</code> to be associated with this submission.
     * @throws IllegalArgumentException if specified <code>image</code> is <code>null</code> or it is associated with
     *         a different submission.
     * @since 1.1
     */
    public void addImage(SubmissionImage image) {
        if (image == null) {
            throw new IllegalArgumentException("The parameter [image] is NULL");
        }
        Submission imageSubmission = image.getSubmission();
        if (imageSubmission == null) {
            image.setSubmission(this);
        } else if (!equal(this.id, imageSubmission.getId())) {
            throw new IllegalArgumentException("The image [" + image.getImage().getId() + "] is associated with a "
                                               + "different submission [" + imageSubmission.getId() + "]");
        }
        this.images.add(image);
    }

    /**
     * <p>Adds specified resource to list of resources associated with this submission.</p>
     *
     * @param resource an <code>Resource</code> to be associated with this submission.
     * @throws IllegalArgumentException if specified <code>resource</code> is <code>null</code> or it is associated with
     *         a different submission.
     * @since 1.1
     */
    public void addResource(ResourceSubmission resource) {
        if (resource == null) {
            throw new IllegalArgumentException("The parameter [resource] is NULL");
        }
        Submission resourceSubmission = resource.getSubmission();
        if (resourceSubmission == null) {
            resource.setSubmission(this);
        } else if (!equal(this.id, resourceSubmission.getId())) {
            throw new IllegalArgumentException("The resource [" + resource.getResource().getId() + "] is associated with a "
                                               + "different submission [" + resourceSubmission.getId() + "]");
        }
        this.resourceSubmission.clear();
        this.resourceSubmission.add(resource);
    }

    /**
     * <p>Evaluates the number of watermarked images from the gallery of <code>Medium</code> presentation type.</p>
     *
     * @return an <code>int</code> providing the number of <code>Medium</code> watermarked images from the gallery. 
     * @since 1.1
     */
    public int getMediumWatermarkedGalleryImagesCount() {
        int cnt = 0;
        for (SubmissionImage submissionImage : this.images) {
            if (submissionImage.getImage().getImageTypeId() == Image.GALLERY_MEDIUM_WATERMARKED_TYPE_ID.intValue()) {
                cnt++;
            }
        }
        return cnt;
    }

    /**
     * <p>Evaluates the number of watermarked images from the gallery of <code>Small</code> presentation type.</p>
     *
     * @return an <code>int</code> providing the number of <code>Small</code> watermarked images from the gallery.
     * @since 1.1
     */
    public int getSmallWatermarkedGalleryImagesCount() {
        int cnt = 0;
        for (SubmissionImage submissionImage : this.images) {
            if (submissionImage.getImage().getImageTypeId() == Image.GALLERY_SMALL_WATERMARKED_TYPE_ID.intValue()) {
                cnt++;
            }
        }
        return cnt;
    }

     /**
     * <p>Evaluates the number of images from the gallery of <code>Full</code> presentation type.</p>
     *
     * @return an <code>int</code> providing the number of <code>Full</code> watermarked images from the gallery.
     * @since 1.1
     */
    public int getFullGalleryImagesCount() {
        int cnt = 0;
        for (SubmissionImage submissionImage : this.images) {
            if (submissionImage.getImage().getImageTypeId() == Image.GALLERY_FULL_TYPE_ID.intValue()) {
                cnt++;
            }
        }
        return cnt;
    }

    /**
     * <p>Holds the mapping between image type id's and the number of images of those type associated with 
     * this submission.</p>
     *
     * @since 1.1
     */
    private Map<Integer, Integer> galMap = new HashMap<Integer, Integer>();
    
    /**
     * <p>Gets the the mapping between image type id's and the number of images of those type associated with 
     * this submission.</p>
     *
     * @return a mapping between image type id's and the number of images of those type associated with 
     * this submission
     * @since 1.1
     */
    public Map<Integer, Integer> getGalleryCountMap() {
        if (galMap.isEmpty() && !this.images.isEmpty()) {
            HashMap<Integer, Integer> temp = new HashMap<Integer, Integer>();
            for (SubmissionImage submissionImage : this.images) {
                if (temp.containsKey(submissionImage.getImage().getImageTypeId())) {
                    temp.put(submissionImage.getImage().getImageTypeId(),
                            temp.get(submissionImage.getImage().getImageTypeId())+1);
                } else {
                    temp.put(submissionImage.getImage().getImageTypeId(), 1);
                }
            }
            galMap = Collections.unmodifiableMap(temp);
        }
        return galMap;
    }

    
    /**
     * <p>Determines whether the specified objects are equal.</p>
     *
     * @param o1 an <code>Object</code> providing the first object to check.
     * @param o2 an <code>Object</code> providing the second object to check.
     * @return <code>true</code> if both specified objects are <code>null</code> or both of them are not
     *        <code>null</code> and both objects are equal; <code>false</code> otherwise.
     * @since 1.1
     */
    private static boolean equal(Object o1, Object o2) {
        return ((o1 == null) && (o2 == null)) || ((o1 != null) && (o2 != null) && (o1.equals(o2)));
    }
    
    /**
     * <p>Gets the project instance associated with the submission.<p>
     * 
     * @return the project instance associated with the submission
     * @since 1.1
     */
    public Project getContest() {        
        return (this.upload != null) ? this.upload.getContest() : null;
    }
    
    /**
     * <p>Gets the resource instance associated with the submission.<p>
     * 
     * @return the resource associated with the submission
     * @since 1.1
     */
    public Resource getResource() {        
        return (this.upload != null) ? this.upload.getResource() : null;
    }
        
    /**
     * <p>Gets the user id associated with the submission.<p>
     * 
     * @return the user id associated with the submission
     * @since 1.1
     */
    public Long getSubmitterId() {        
        Set<ResourceInfo> infos = getResource().getInfo();
        for (ResourceInfo info : infos) {
            if (info.getId().getTypeId() == 1) {
                log.debug("return " + info.getValue() + " submitter id ");
                return new Long(info.getValue());
            }
        }
        
        return null;
    }

}

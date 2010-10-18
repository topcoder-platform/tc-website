/*
 * Copyright (C) 2005-2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.model;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.Image;

import java.sql.Timestamp;
import java.util.Set;
import java.util.TreeSet;
import java.util.HashMap;
import java.util.Map;
import java.util.Collections;

/**
 * <p>An entity representing a single Studio contest submission.</p>
 *
 * <p>
 *   Version 1.1 (Studio Contest Detail Pages assembly) Change notes:
 *   <ol>
 *     <li>Added {@link #feedbackText} property with respective accessor/mutator methods.</li>
 *   </ol>
 * </p>
 *
 * @author dok, isv
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 27, 2006
 */
public class Submission extends Base {
    private Long id;
    private User submitter;
    private Contest contest;
    private String originalFileName;
    private String systemFileName;
    private FilePath path;
    private SubmissionType type;
    private MimeType mimeType;
    private SubmissionReview review;
    private ContestResult result;
    private Integer rank;
    private Timestamp createDate;
    private Integer height;
    private Integer width;
    private SubmissionStatus status;
    private com.topcoder.web.common.model.comp.Submission ORSubmission;
    private Set<Prize> prizes = new TreeSet<Prize>();

    /**
     * <p>A <code>String</code> providing the feedback text for submission.</p>
     *
     * @since 1.1
     */
    private String feedbackText;

    /**
     * <p>A <code>Set</code> containing the images associated with this submission.</p>
     *
     * @since Studio Submission Slideshow
     */
    private Set<SubmissionImage> images = new TreeSet<SubmissionImage>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getSubmitter() {
        return submitter;
    }

    public void setSubmitter(User submitter) {
        this.submitter = submitter;
    }

    public Contest getContest() {
        return contest;
    }

    public void setContest(Contest contest) {
        this.contest = contest;
    }

    public String getOriginalFileName() {
        return originalFileName;
    }

    public void setOriginalFileName(String originalFileName) {
        this.originalFileName = originalFileName;
    }

    public String getSystemFileName() {
        return systemFileName;
    }

    public void setSystemFileName(String systemFileName) {
        this.systemFileName = systemFileName;
    }

    public FilePath getPath() {
        return path;
    }

    public void setPath(FilePath path) {
        this.path = path;
    }

    public SubmissionType getType() {
        return type;
    }

    public SubmissionReview getReview() {
        return review;
    }

    public void setReview(SubmissionReview review) {
        this.review = review;
    }

    public void setType(SubmissionType type) {
        this.type = type;
    }

    public MimeType getMimeType() {
        return mimeType;
    }

    public void setMimeType(MimeType mimeType) {
        this.mimeType = mimeType;
    }

    public ContestResult getResult() {
        return result;
    }

    public void setResult(ContestResult result) {
        this.result = result;
    }


    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }


    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }


    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }


    public SubmissionStatus getStatus() {
        return status;
    }

    public void setStatus(SubmissionStatus status) {
        this.status = status;
    }


    public com.topcoder.web.common.model.comp.Submission getORSubmission() {
        return ORSubmission;
    }

    public void setORSubmission(com.topcoder.web.common.model.comp.Submission ORSubmission) {
        this.ORSubmission = ORSubmission;
    }


    public Set<Prize> getPrizes() {
        return prizes;
    }

    public void setPrizes(Set<Prize> prizes) {
        this.prizes = prizes;
    }

    public void addPrize(Prize p) {
        this.prizes.add(p);
    }

    public void removePrize(Prize p) {
        if (log.isDebugEnabled()) {
            log.debug("before size " + prizes.size());
        }
        this.prizes.remove(p);
        if (log.isDebugEnabled()) {
            log.debug("after size " + prizes.size());
        }
    }

    /**
     * <p>Gets the list of images associated with this submission.</p>
     *
     * @return a <code>Set</code> containing the submissions associated with this submission.
     * @since Studio Submission Slideshow
     */
    public Set<SubmissionImage> getImages() {
        return this.images;
    }

    /**
     * <p>Sets the list of images associated with this submission.</p>
     *
     * @param images a <code>Set</code> containing the submissions associated with this submission.
     * @since Studio Submission Slideshow
     */
    public void setImages(Set<SubmissionImage> images) {
        this.images = images;
    }

    /**
     * <p>Adds specified image to list of images associated with this submission.</p>
     *
     * @param image an <code>Image</code> to be associated with this submission.
     * @throws IllegalArgumentException if specified <code>image</code> is <code>null</code> or it is associated with
     *         a different submission.
     * @since Studio Submission Slideshow
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
     * <p>Evaluates the number of watermarked images from the gallery of <code>Medium</code> presentation type.</p>
     *
     * @return an <code>int</code> providing the number of <code>Medium</code> watermarked images from the gallery. 
     * @since Studio Submission Slideshow
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
     * @since Studio Submission Slideshow
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

    private Map<Integer, Integer> galMap = new HashMap<Integer, Integer>();
    /**
     *
     * @return a mapping between image type id's and the number of images of those type associated with this submission
     */
    public Map getGalleryCountMap() {
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
     * @since Studio Submission Slideshow
     */
    private static boolean equal(Object o1, Object o2) {
        return ((o1 == null) && (o2 == null)) || ((o1 != null) && (o2 != null) && (o1.equals(o2)));
    }

    /**
     * <p>Gets the feedback text for submission.</p>
     *
     * @return a <code>String</code> providing the feedback text for submission.
     * @since 1.1
     */
    public String getFeedbackText() {
        return this.feedbackText;
    }

    /**
     * <p>Sets the feedback text for submission.</p>
     *
     * @param feedbackText a <code>String</code> providing the feedback text for submission.
     * @since 1.1
     */
    public void setFeedbackText(String feedbackText) {
        this.feedbackText = feedbackText;
    }
}

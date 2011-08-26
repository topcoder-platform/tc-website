/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.web.common.model.Base;
import com.topcoder.web.common.model.Image;

import java.io.Serializable;

/**
 * <p>A POJO class used for mapping the submissions to images, mapped to TCS catalog database.</p>
 *
 * Mutable and not thread-safe.
 *
 * @author pvmagacho
 * @version 1.0
 * @since (Re-platforming Studio Release 3 Assembly)
 */
public class SubmissionImage extends Base implements Comparable {

    /**
     * <p>An <code>Integer</code> providing the ordered index of this image among other images associated with same
     * submission.</p>
     */
    private Integer sortIndex = null;

    /**
     * <p>An <code>Identifier</code> providing the ID for this mapping from submission to image.</p>
     */
    private Identifier id = new Identifier();

    /**
     * <p>Constructs new <code>SubmissionImage</code> instance. This implementation does nothing.</p>
     */
    public SubmissionImage() {
    }

    /**
     * <p>Gets the identifier for this mapping from submission to image.</p>
     *
     * @return an <code>Identifier</code> identifying this mapping from submission to image.
     */
    public Identifier getId() {
        return this.id;
    }

    /**
     * <p>Sets the identifier for this mapping from submission to image.</p>
     *
     * @param id an <code>Identifier</code> identifying this mapping from submission to image. 
     */
    public void setId(Identifier id) {
        this.id = id;
    }

    /**
     * <p>Gets relative index of this image among other image associated with same submission.</p>
     *
     * @return an <code>Integer</code> providing the ordered index of this image among other images associated with same
     *         submission.
     */
    public Integer getSortIndex() {
        return this.sortIndex;
    }

    /**
     * <p>Sets relative index of this image among other image associated with same submission.</p>
     *
     * @param sortIndex an <code>Integer</code> providing the ordered index of this image among other images associated
     *        with same submission.
     */
    public void setSortIndex(Integer sortIndex) {
        this.sortIndex = sortIndex;
    }

    /**
     * <p>Gets the submission associated with the image.</p>
     *
     * @return a <code>Submission</code> representing the submission associated with the image.
     */
    public Submission getSubmission() {
        return this.id.getSubmission();
    }

    /**
     * <p>Sets the submission associated with the image.</p>
     *
     * @param submission a <code>Submission</code> representing the submission associated with the image.
     */
    public void setSubmission(Submission submission) {
        this.id.setSubmission(submission);
    }

    /**
     * <p>Gets the image associated with the submission.</p>
     *
     * @return an <code>Image</code> representing the image associated with the submission.
     */
    public Image getImage() {
        return this.id.getImage();
    }

    /**
     * <p>Sets the image associated with the submission.</p>
     *
     * @param image an <code>Image</code> representing the image associated with the submission.
     */
    public void setImage(Image image) {
        this.id.setImage(image);
    }

    /**
     * <p>Compares the specified <code>Object</code> (which is expected to be of <code>SubmissionImage</code> type) to
     * this instance. The comparison is based on natural comparison of <code>sortIndex</code> property.</p>
     * 
     * @param o an <code>Object</code> to be compared.
     * @return an <code>int</code> which is negative integer, zero, or a positive integer as this object is less than,
     *         equal to, or greater than the specified object.
     * @throws ClassCastException if the specified object's type prevents it from being compared to this submission
     *         image.
     */
    public int compareTo(Object o) {
        if (o == null) {
            return -1;
        }

        // Get properties of this object
        int thisIndex = Integer.MAX_VALUE;
        if (this.sortIndex != null) {
            thisIndex = this.sortIndex.intValue();
        }

        int thisImageTypeId = Integer.MAX_VALUE;
        if (this.id.getImage() != null) {
            thisImageTypeId = this.id.getImage().getImageTypeId().intValue();
        }

        // Get properties of the opponent object
        SubmissionImage another = (SubmissionImage) o;

        int anotherIndex = Integer.MAX_VALUE;
        if (another.getSortIndex() != null) {
            anotherIndex = another.getSortIndex().intValue();
        }

        int anotherImageTypeId = Integer.MAX_VALUE;
        if (another.getImage() != null) {
            anotherImageTypeId = another.getImage().getImageTypeId().intValue();
        }

        // Compare objects
        if (thisImageTypeId == anotherImageTypeId) {
            if (thisIndex == anotherIndex) {
                return 0;
            } else if (thisIndex < anotherIndex) {
                return -1;
            } else {
                return 1;
            }
        } else if (thisImageTypeId < anotherImageTypeId) {
            return -1;
        } else {
            return 1;
        }
    }

    /**
     * <p>Determines whether this submission image is equal to specified object or not.</p>
     *
     * @param o an <code>Object</code> to check for equality with this submission image.
     * @return <code>true</code> if specified object is of <code>SubmissionImage</code> type and both mappings have
     *         submissions and images with equal IDs and both mappings have the same sort index; <code>false</code>
     *         otherwise.
     */
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        } else if ((o == null) || !(o instanceof SubmissionImage)) {
            return false;
        } else {
            SubmissionImage that = (SubmissionImage) o;
            return equal(this.id, that.id) && equal(this.sortIndex, that.sortIndex);
        }
    }

    /**
     * <p>Evaluates the hash code value for this submission image. Such a hash code is evaluated based on hash codes of
     * the wrapped submission and image and sort index.</p>
     *
     * @return an <code>int</code> providing the hash code value for this submission image.
     */
    public int hashCode() {
        StringBuilder b = new StringBuilder();
        b.append(this.sortIndex == null ? " " : this.sortIndex).append(" ");
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
     * <p>A class representing a composite key for submission image mappings. Such a key consists of submission and
     * image comprising the mapping.</p>
     *
     * @author pvmagacho
     */
    public static class Identifier implements Serializable, Cloneable {

        /**
         * <p>A <code>Submission</code> representing the submission associated with the image.</p>
         */
        private Submission submission = null;

        /**
         * <p>An <code>Image</code> representing the image associated with the submission.</p>
         */
        private Image image = null;

        /**
         * <p>Constructs new <code>SubmissionImage$Identifier</code> instance. This implementation does nothing.</p>
         */
        public Identifier() {
        }

        /**
         * <p>Gets the submission associated with the image.</p>
         *
         * @return a <code>Submission</code> representing the submission associated with the image.
         */
        public Submission getSubmission() {
            return this.submission;
        }

        /**
         * <p>Sets the submission associated with the image.</p>
         *
         * @param submission a <code>Submission</code> representing the submission associated with the image.
         */
        public void setSubmission(Submission submission) {
            this.submission = submission;
        }

        /**
         * <p>Gets the image associated with the submission.</p>
         *
         * @return an <code>Image</code> representing the image associated with the submission.
         */
        public Image getImage() {
            return this.image;
        }

        /**
         * <p>Sets the image associated with the submission.</p>
         *
         * @param image an <code>Image</code> representing the image associated with the submission.
         */
        public void setImage(Image image) {
            this.image = image;
        }

        /**
         * <p>Determines whether this identifier is equal to specified object or not.</p>
         *
         * @param o an <code>Object</code> to check for equality with this identifier.
         * @return <code>true</code> if specified object is of <code>Identifier</code> type and both identifiers have
         *         submissions and images with equal IDs; <code>false</code> otherwise.
         */
        public boolean equals(Object o) {
            if (this == o) {
                return true;
            } else if ((o == null) || !(o instanceof Identifier)) {
                return false;
            } else {
                Identifier that = (Identifier) o;
                if ((this.submission != null) && (that.submission != null)) {
                    if ((this.image != null) && (that.image != null)) {
                        return equal(this.submission.getId(), that.submission.getId())
                               && equal(this.image.getId(), that.image.getId());
                    } else {
                        return (this.image == null) && (that.image == null);
                    }
                } else {
                    return (this.submission == null) && (that.submission == null);
                }
            }
        }

        /**
         * <p>Evaluates the hash code value for this identifier. Such a hash code is evaluated based on hash codes of
         * the wrapped submission and image.</p>
         *
         * @return an <code>int</code> providing the hash code value for this identifier.
         */
        public int hashCode() {
            StringBuilder b = new StringBuilder();
            b.append(this.submission == null ? " " : this.submission.getId()).append(" ");
            b.append(this.image == null ? " " : this.image.getId()).append(" ");
            return b.toString().hashCode();
        }

        /**
         * <p>Gets the string presentation of this submision image identifier.</p>
         *
         * @return a string representation of the object.
         */
        public String toString() {
            StringBuilder b = new StringBuilder();
            b.append("Submission:").append(this.submission == null ? " " : this.submission.getId()).append(" ");
            b.append("Image:").append(this.image == null ? " " : this.image.getId()).append(" ");
            return b.toString();
        }
    }
}

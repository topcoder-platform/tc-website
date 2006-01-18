package com.topcoder.dde.persistencelayer.bean;

import javax.ejb.CreateException;

/**
 * The base bean implementation class representing the CMP bean with the description CMP field and the status id CMP field.
 *
 * @version     1.0
 * @author      David Messinger (TCHandle mess)
 */
public abstract class DDEComponentInquiryBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDEComponentInquiryBean() {
    }

    public abstract long getProjectId();

    public abstract void setProjectId(long projectId);

    /**
     * Gets the rating.
     *
     * @return  rating.
     */
    public abstract long getRating();

    /**
     * Sets the rating.
     *
     * @param rating TopCoder rating.
     */
    public abstract void setRating(long rating);

    /**
     * Gets the component id.
     *
     * @return  the id of the component being inquired about.
     */
    public abstract long getComponentId();

    /**
     * Sets the componetId being inquired about
     *
     * @param componentId the id of the component being inquired about.
     */
    public abstract void setComponentId(long componentId);

    /**
     * user's TopCoder Id
     *
     * @return  the user's TopCoder Id
     */
    public abstract long getTcUserId();

    /**
     * Sets the user's TopCoder Id
     *
     * @param tcUserId the user's TopCoder Id
     */
    public abstract void setTcUserId(long tcUserId);


    /**
     * Sets if the user agreed to terms
     *
     * @return  the user's agreement to terms
     */
    public abstract void setAgreedToTerms(boolean agreedToTerms);

    /**
     * Gets if the user agreed to terms
     *
     * @return  the user's agreement to terms
     */
    public abstract boolean getAgreedToTerms();


    /**
     * Gets the user id for the user inquiring about the component.
     *
     * @return  the id of the user inquiring about the component
     */
    public abstract long getUserId();

    /**
     * Sets the userId for the person inquiring about the component
     *
     * @param userId the id of the user inquiring about the component
     */
    public abstract void setUserId(long userId);


    /**
     * Gets the user's comments about the inquiry
     *
     * @return  the comments entered by the user
     */
    public abstract String getComments();

    /**
     * Sets the user's comments about the inquiry
     *
     * @param comments the comments about the inquiry
     */
    public abstract void setComments(String comments);

    /**
     * Gets the component's phase at time of inquiry
     *
     * @return  the component's phase at time of inquiry
     */
    public abstract long getPhase();

    /**
     * Sets the component's phase at time of inquiry
     *
     * @param phase the component's phase at time of inquiry
     */
    public abstract void setPhase(long phase);

    /**
     * Gets the component's version at time of inquiry
     *
     * @return  the component's version at time of inquiry
     */
    public abstract long getVersion();

    /**
     * Sets the component's version at time of inquiry
     *
     * @param version the component's version at time of inquiry
     */
    public abstract void setVersion(long version);

    /**
     * Creates an entity object.
     *
     * @param componentId     the component being inquired about
     * @param userId          the user inquiring about the component
     * @param rating          the user's TopCoder rating
     * @param comments        the comments about the inquiry
     * @param agreedToTerms   if the user agreed to terms
     * @param phase           the component's phase at time of inquiry
     * @param tcUserId        the user's topcoder id
     * @param version         the component's version at time of inquiry
     *
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(long componentId, long userId, long rating, String comments, boolean agreedToTerms, long phase, long tcUserId, long version, long projectId) throws CreateException {
        setPrimaryKey();
        setComponentId(componentId);
        setUserId(userId);
        setRating(rating);
        setComments(comments);
        setAgreedToTerms(agreedToTerms);
        setPhase(phase);
        setTcUserId(tcUserId);
        setVersion(version);
        setProjectId(projectId);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param componentId     the component being inquired about
     * @param userId          the user inquiring about the component
     * @param rating          the user's TopCoder rating
     * @param comments        the comments about the inquiry
     * @param agreedToTerms   if the user agreed to terms
     * @param phase           the component's phase at time of inquiry
     * @param tcUserId         the user's topcoder id
     * @param version         the component's version at time of inquiry
     *
     */
    public void ejbPostCreate(long componentId, long userId, long rating, String comments, boolean agreedToTerms, long phase, long tcUserId, long version, long projectId) {
    }

}

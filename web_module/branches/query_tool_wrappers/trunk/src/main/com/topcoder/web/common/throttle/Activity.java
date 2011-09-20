package com.topcoder.web.common.throttle;
/*
 * Activity.java
 *
 * Created on March 28, 2006, 11:54 AM
 */


/**
 * Data class for each user activity.  This class is not thread safe.  If the throttler's
 * locking scheme is changed, this class may need to be synchronized.
 *
 * @author ivern
 */
public class Activity {
    /**
     * A string that uniquely identifies the user.  If a data type other than String
     * is needed, make sure that it hashes efficiently since that will affect the
     * performance of the throttler (the user Id is used as a key into the activity map).
     */
    private String userId;

    /**
     * Time at which the activity happened.
     */
    private long timeStamp;

    /**
     * Reference to the user's interval activity counter.
     */
    private Counter counter;

    /**
     * Constructs a new Activity instance.
     *
     * @param userId    the user id.
     * @param timeStamp the timestamp.
     * @param counter   a reference to the counter associated with the user id.
     */
    public Activity(String userId, long timeStamp, Counter counter) {
        this.userId = userId;
        this.timeStamp = timeStamp;
        this.counter = counter;
    }

    /**
     * Returns the user id.
     *
     * @return the user id.
     */
    public String getUserId() {
        return this.userId;
    }

    /**
     * Returns the timestamp.
     *
     * @return the timestamp.
     */
    public long getTimeStamp() {
        return this.timeStamp;
    }

    /**
     * Returns the counter reference.
     *
     * @return a reference to the counter associated with the user id.
     */
    public Counter getCounter() {
        return this.counter;
    }
}

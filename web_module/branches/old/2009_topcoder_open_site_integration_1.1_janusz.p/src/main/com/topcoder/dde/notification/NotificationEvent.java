package com.topcoder.dde.notification;

/**
 * <p>A value object class for.</p>
 *
 * @author isv
 * @version 1.0 04/22/2005
 */
public class NotificationEvent implements Comparable {

    /**
     * <p>A <code>long</code> providing the ID of notification eventName uniquelly distinguishing it among other events.</p>
     */
    private long id = 0;

    /**
     * <p>A <code>String</code> providing the textual description of this notification eventName. Such a description could
     * be used for displaying the notification eventName to users.</p>
     */
    private String description = null;

    /**
     * <p>A <code>String</code> providing the encoded name of the eventName.</p>
     */
    private String eventName = null;

    /**
     * <p>Constructs new <code>NotificationEvent</code> with specified ID and textual description.</p>
     *
     * @param id a <code>long</code> providing the ID of notification eventName.
     * @param description a <code>String</code> providing the textual description of the notification eventName.
     * @throws NullPointerException if specified <code>description</code> is <code>null</code>.
     */
    public NotificationEvent(long id, String description) {
        if (description == null) {
            throw new NullPointerException("The 'description' is NULL.");
        }

        this.id = id;
        this.description = description;
    }

    /**
     * <p>Gets the ID of this notification eventName uniquelly distinguishing it among other events.</p>
     *
     * @return a <code>long</code> providing the ID of this notification eventName.
     */
    public long getId() {
        return id;
    }

    /**
     * <p>Gets the human-readable textual description of this notification eventName.</p>
     *
     * @return a <code>String</code> providing the textual description of this notification eventName.
     */
    public String getDescription() {
        return description;
    }

    /**
     * <p>Gets the encoded name of this notification eventName.</p>
     *
     * @return a <code>String</code> providing the name of this notification eventName.</p>
     */
    public String getEventName() {
        return eventName;
    }

    /**
     * <p>Sets the human-readable textual description of this notification eventName.</p>
     *
     * @param description a <code>String</code> providing the textual description of this notification eventName.
     * @throws NullPointerException if specified <code>desription</code> is <code>null</code>.
     */
    public void setDescription(String description) {
        if (description == null) {
            throw new NullPointerException("The 'description' parameter is NULL");
        }
        this.description = description;
    }

    /**
     * <p>Sets the encoded name of this notification eventName.</p>
     *
     * @param eventName a <code>String</code> providing the encoded name of this notification eventName.
     * @throws NullPointerException if specified <code>eventName</code> is <code>null</code>.
     */
    public void setEventName(String eventName) {
        if (eventName == null) {
            throw new NullPointerException("The 'eventName' parameter is NULL");
        }
        this.eventName = eventName;
    }

    /**
     * <p>Compares this <code>NotificationEvent</code> with the specified object for order. Returns a comparison result
     * evaluated based on comparison of descriptions of both notification events.</p>
     *
     * @param o an <code>Object</code> to be compared with this <code>NotificationEvent</code>.
     * @return a negative integer, zero, or a positive integer as the description of this notification eventName is less
     *         than, equal to, or greater than the description of specified notification eventName.
     * @throws ClassCastException if the specified object's type is not <code>NotificationEvent</code>.
     */
    public int compareTo(Object o) {
        return this.description.compareTo(((NotificationEvent) o).getDescription());
    }
}

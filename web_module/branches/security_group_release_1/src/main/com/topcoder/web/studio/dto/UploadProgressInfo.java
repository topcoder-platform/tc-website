/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import com.topcoder.json.object.JSONObject;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Date;

/**
 * <p>A DTO providing the details for single <code>Studio</code> submission uploading.</p>
 * 
 * @author isv
 * @version 1.0 (Upload Progress Bar assembly)
 */
public class UploadProgressInfo implements Serializable {

    /**
     * <p>A <code>String</code> providing the name for session attribute which may be used for storing the objects of
     * this type.</p>
     */
    public static final String SESSION_ATTR = "UploadProgressInfo";
    
    /**
     * <p>A <code>long</code> providing the total length of uploaded files.</p>
     */
    private long totalLength;

    /**
     * <p>A <code>long</code> providing the number of bytes uploaded so far.</p>
     */
    private long bytesUploaded;

    /**
     * <p>A <code>Date</code> providing the start time for upload.</p>
     */
    private Date startTime;

    /**
     * <p>A <code>Date</code> providing the time of finishing the upload.</p>
     */
    private Date endTime;

    /**
     * <p>Constructs new <code>UploadProgressInfo</code> instance. This implementation does nothing.</p>
     */
    public UploadProgressInfo() {
    }

    /**
     * <p>Gets the start time for upload.</p>
     *
     * @return a <code>Date</code> providing the start time for upload.
     */
    public Date getStartTime() {
        return this.startTime;
    }

    /**
     * <p>Sets the start time for upload.</p>
     *
     * @param startTime a <code>Date</code> providing the start time for upload.
     */
    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    /**
     * <p>Gets the time of finishing the upload.</p>
     *
     * @return a <code>Date</code> providing the time of finishing the upload.
     */
    public Date getEndTime() {
        return this.endTime;
    }

    /**
     * <p>Sets the time of finishing the upload.</p>
     *
     * @param endTime a <code>Date</code> providing the time of finishing the upload.
     */
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    /**
     * <p>Gets the number of bytes uploaded so far.</p>
     *
     * @return a <code>long</code> providing the number of bytes uploaded so far.
     */
    public long getBytesUploaded() {
        return this.bytesUploaded;
    }

    /**
     * <p>Sets the number of bytes uploaded so far.</p>
     *
     * @param bytesUploaded a <code>long</code> providing the number of bytes uploaded in new portion of upload.
     */
    public void addBytesUploaded(long bytesUploaded) {
        this.bytesUploaded += bytesUploaded;
    }

    /**
     * <p>Gets the total length of uploaded files.</p>
     *
     * @return a <code>long</code> providing the total length of uploaded files.
     */
    public long getTotalLength() {
        return this.totalLength;
    }

    /**
     * <p>Sets the total length of uploaded files.</p>
     *
     * @param totalLength a <code>long</code> providing the total length of uploaded files.
     */
    public void setTotalLength(long totalLength) {
        this.totalLength = totalLength;
    }

    /**
     * <p>Gets the speed of uploading.</p>
     *
     * @return a <code>float</code> providing the speed of uploading (in bytes per second).
     */
    public float getUploadSpeed() {
        long timeElapsed = getTimeElapsed();
        if (timeElapsed == 0) {
            timeElapsed = 1;
        }
        return getBytesUploaded() * 1.00F / timeElapsed;
    }

    /**
     * <p>Gets the time taken for upload so far.</p>
     *
     * @return a <code>long</code> providing the time taken for upload so far (in seconds).
     */
    public long getTimeElapsed() {
        Date time;
        if (getEndTime() == null) {
            time = new Date();
        } else {
            time = getEndTime();
        }
        return (time.getTime() - this.startTime.getTime()) / 1000;
    }

    /**
     * <p>Converts this object into <code>JSON</code> presentation.</p>
     * 
     * @return a <code>JSONObject</code> constructed from this object. 
     */
    public JSONObject toJSON() {
        NumberFormat numberFormat = new DecimalFormat("00");
        JSONObject json = new JSONObject();
        json.setLong("bytesUploaded", getBytesUploaded());
        json.setLong("totalLength", getTotalLength());
        json.setFloat("uploadSpeed", getUploadSpeed());
      
        long timeElapsed = getTimeElapsed();
        json.setLong("timeElapsed", timeElapsed);
        long hours = timeElapsed / (60 * 24);
        long minutes = (timeElapsed - hours * 24 * 60) / 60;
        long seconds = timeElapsed % 60;
        json.setString("timeElapsedFormatted", 
                       numberFormat.format(hours) + ":" + numberFormat.format(minutes) + ":" 
                       + numberFormat.format(seconds));
        return json;
    }
}

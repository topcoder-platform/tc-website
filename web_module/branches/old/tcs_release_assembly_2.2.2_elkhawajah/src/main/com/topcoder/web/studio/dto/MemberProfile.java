/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.io.Serializable;
import java.net.URL;
import java.util.Date;
import java.util.Map;

/**
 * <p>A <code>DTO</code> class representing the <code>Studio</code> member profile.</p>
 *
 * <p>As of this version the profile maintains the following properties: username, quote, country, school, date and time
 * of registration to <code>Studio</code> website, photo, statistics per contest types.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since TopCoder Studio Member Profile Assembly
 */
public class MemberProfile implements Serializable {

    /**
     * <p>A <code>String</code> providing the handle identifying the <code>Studio</code> member.</p>
     */
    private String handle;

    /**
     * <p>A <code>String</code> providing the quote (if any) provided by the <code>Studio</code> member.</p>
     */
    private String quote;

    /**
     * <p>A <code>String</code> providing the name of the country the <code>Studio</code> member is from.</p>
     */
    private String country;

    /**
     * <p>A <code>String</code> providing the name of the school (if any) the <code>Studio</code> member is from.</p>
     */
    private String school;

    /**
     * <p>A <code>Date</code> providing the date and time when member has registered to <code>Studio</code> website.</p>
     */
    private Date memberSince;

    /**
     * <p>An <code>URL</code> referencing the image (if any) representing the <code>Studio</code> member photo.</p>
     */
    private URL imageUrl;

    /**
     * <p>A <code>Map</code> collecting the statistics per contest types for <code>Studio</code> member. Maps the
     * contest type ID to respective statistics for that contest type.</p>
     */
    private Map<Integer, ContestStatistics> statistics;

    /**
     * <p>Constructs new <code>MemberProfile</code> instance. This implementation does nothing.</p>
     */
    public MemberProfile() {
    }

    /**
     * <p>Gets the handle identifying the <code>Studio</code> member.</p>
     *
     * @return a <code>String</code> providing the handle identifying the <code>Studio</code> member.
     */
    public String getHandle() {
        return this.handle;
    }

    /**
     * <p>Sets the handle identifying the <code>Studio</code> member.</p>
     *
     * @param handle  a <code>String</code> providing the handle identifying the <code>Studio</code> member.
     */
    public void setHandle(String handle) {
        this.handle = handle;
    }

    /**
     * <p>Gets the quote provided by <code>Studio</code> member (if any).</p>
     *
     * @return a <code>String</code> providing the quote (if any) provided by the <code>Studio</code> member.
     */
    public String getQuote() {
        return this.quote;
    }

    /**
     * <p>Sets the quote provided by <code>Studio</code> member.</p>
     *
     * @param quote a <code>String</code> providing the quote provided by the <code>Studio</code> member.
     */
    public void setQuote(String quote) {
        this.quote = quote;
    }

    /**
     * <p>Gets the name of the country the <code>Studio</code> member is from.</p>
     *
     * @return a <code>String</code> providing the name of the country the <code>Studio</code> member is from.
     */
    public String getCountry() {
        return this.country;
    }

    /**
     * <p>Sets the name of the country the <code>Studio</code> member is from.</p>
     *
     * @param country a <code>String</code> providing the name of the country the <code>Studio</code> member is from.
     */
    public void setCountry(String country) {
        this.country = country;
    }

    /**
     * <p>Gets the name of the school the <code>Studio</code> member is from.</p>
     *
     * @return a <code>String</code> providing the name of the school (if any) the <code>Studio</code> member is from.
     */
    public String getSchool() {
        return this.school;
    }

    /**
     * <p>Sets the name of the school the <code>Studio</code> member is from.</p>
     *
     * @param school a <code>String</code> providing the name of the school (if any) the <code>Studio</code> member is
     *        from.
     */
    public void setSchool(String school) {
        this.school = school;
    }

    /**
     * <p>Gets the date and time of member registration to <code>Studio</code> website.</p>
     *
     * @return a <code>Date</code> providing the date and time when member has registered to <code>Studio</code>
     *         website.
     */
    public Date getMemberSince() {
        return this.memberSince;
    }

    /**
     * <p>Sets the date and time of member registration to <code>Studio</code> website.</p>
     *
     * @param memberSince a <code>Date</code> providing the date and time when member has registered to
     *        <code>Studio</code> website.
     */
    public void setMemberSince(Date memberSince) {
        this.memberSince = memberSince;
    }

    /**
     * <p>Gets the URL referencing the <code>Studio</code> member photo.</p>
     *
     * @return an <code>URL</code> referencing the image (if any) representing the <code>Studio</code> member photo.
     */
    public URL getImageUrl() {
        return this.imageUrl;
    }

    /**
     * <p>Sets the URL referencing the <code>Studio</code> member photo.</p>
     *
     * @param imageUrl an <code>URL</code> referencing the image (if any) representing the <code>Studio</code> member
     *        photo.
     */
    public void setImageUrl(URL imageUrl) {
        this.imageUrl = imageUrl;
    }

    /**
     * <p>Gets the statistics for the <code>Studio</code> member per various contest types launched on
     * <code>Studio</code> website.</p>
     *
     * @return a <code>Map</code> collecting the statistics per contest types for <code>Studio</code> member. Maps the
     *         contest type ID to respective statistics for that contest type.
     */
    public Map<Integer, ContestStatistics> getStatistics() {
        return this.statistics;
    }

    /**
     * <p>Sets the statistics for the <code>Studio</code> member per various contest types launched on
     * <code>Studio</code> website.</p>
     *
     * @param statistics a <code>Map</code> collecting the statistics per contest types for <code>Studio</code> member.
     *        Maps the contest type ID to respective statistics for that contest type.
     */
    public void setStatistics(Map<Integer, ContestStatistics> statistics) {
        this.statistics = statistics;
    }
}

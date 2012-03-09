/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dto;

import java.io.Serializable;
import java.net.URL;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>A <code>DTO</code> class representing the <code>Studio</code> member profile.</p>
 *
 * <p>As of this version the profile maintains the following properties: username, quote, country, school, date and time
 * of registration to <code>Studio</code> website, photo, statistics per contest types.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Member Profile Assembly
 */
public class MemberProfile implements Serializable {

    /**
     * <p>A <code>long</code> providing the ID of a user associated with this member profile.</p>
     */
    private long userId;

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
     * <p>A <code>Date</code> providing the date and time when member has registered to <code>Studio</code>
     * website.</p>
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
     * <p>A <code>double</code> providing the overall earnings.</p>
     */
    private double overallEarnings;

    /**
     * <p>A <code>List</code> providing the details on current registrations for user.</p>
     */
    private List<MemberProfileRegistration> currentRegistrations;

    /**
     * <p>A <code>List</code> providing the details on recent submissions for user.</p>
     */
    private List<MemberProfileSubmission> recentSubmissions;

    /**
     * <p>A <code>List</code> providing the details on winning submissions for user.</p>
     */
    private List<MemberProfileSubmission> winningSubmissions;

    private List<MemberProfileAchievement> achievements;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether the quote for profile is to be displayed or
     * not.</p>
     */
    private boolean displayQuote;

    /**
     * <p>A <code>boolean</code> providing the flag indicating whether the banner for profile is to be displayed.</p>
     */
    private boolean displayBanner;

    /**
     * <p>A <code>String</code> providing the details on quote location.</p>
     */
    private String quoteLocation;

    /**
     * <p>A <code>String</code> providing the banner style for profile.</p>
     */
    private String bannerStyle;

    /**
     * <p>Constructs new <code>MemberProfile</code> instance. This implementation does nothing.</p>
     */
    public MemberProfile() {
    }

    /**
     * <p>Gets the banner style for profile.</p>
     *
     * @return a <code>String</code> providing the banner style for profile.
     */
    public String getBannerStyle() {
        return this.bannerStyle;
    }

    /**
     * <p>Sets the banner style for profile.</p>
     *
     * @param bannerStyle a <code>String</code> providing the banner style for profile.
     */
    public void setBannerStyle(String bannerStyle) {
        this.bannerStyle = bannerStyle;
    }

    /**
     * <p>A <code>String</code> providing the quote color.</p>
     */
    private String quoteColor;

    /**
     * <p>Gets the quote color.</p>
     *
     * @return a <code>String</code> providing the quote color.
     */
    public String getQuoteColor() {
        return this.quoteColor;
    }

    /**
     * <p>Sets the quote color.</p>
     *
     * @param quoteColor a <code>String</code> providing the quote color.
     */
    public void setQuoteColor(String quoteColor) {
        this.quoteColor = quoteColor;
    }

    /**
     * <p>Gets the details on quote location.</p>
     *
     * @return a <code>String</code> providing the details on quote location.
     */
    public String getQuoteLocation() {
        return this.quoteLocation;
    }

    /**
     * <p>Sets the details on quote location.</p>
     *
     * @param quoteLocation a <code>String</code> providing the details on quote location.
     */
    public void setQuoteLocation(String quoteLocation) {
        this.quoteLocation = quoteLocation;
    }

    /**
     * <p>Gets the flag indicating whether the banner for profile is to be displayed.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether the banner for profile is to be displayed.
     */
    public boolean getDisplayBanner() {
        return this.displayBanner;
    }

    /**
     * <p>Sets the flag indicating whether the banner for profile is to be displayed.</p>
     *
     * @param displayBanner a <code>boolean</code> providing the flag indicating whether the banner for profile is to be
     *                     displayed.
     */
    public void setDisplayBanner(boolean displayBanner) {
        this.displayBanner = displayBanner;
    }

    /**
     * <p>Gets the flag indicating whether the quote for profile is to be displayed or not.</p>
     *
     * @return a <code>boolean</code> providing the flag indicating whether the quote for profile is to be displayed or
     *         not.
     */
    public boolean getDisplayQuote() {
        return this.displayQuote;
    }

    /**
     * <p>Sets the flag indicating whether the quote for profile is to be displayed or not.</p>
     *
     * @param displayQuote a <code>boolean</code> providing the flag indicating whether the quote for profile is to be
     *                     displayed or not.
     */
    public void setDisplayQuote(boolean displayQuote) {
        this.displayQuote = displayQuote;
    }

    /**
     * <p>Gets the details on winning submissions for user.</p>
     *
     * @return a <code>List</code> providing the details on winning submissions for user.
     */
    public List<MemberProfileSubmission> getWinningSubmissions() {
        return this.winningSubmissions;
    }

    /**
     * <p>Sets the details on winning submissions for user.</p>
     *
     * @param winningSubmissions a <code>List</code> providing the details on winning submissions for user.
     */
    public void setWinningSubmissions(List<MemberProfileSubmission> winningSubmissions) {
        this.winningSubmissions = winningSubmissions;
    }

    /**
     * <p>Gets the details on recent submissions for user.</p>
     *
     * @return a <code>List</code> providing the details on recent submissions for user.
     */
    public List<MemberProfileSubmission> getRecentSubmissions() {
        return this.recentSubmissions;
    }

    /**
     * <p>Sets the details on recent submissions for user.</p>
     *
     * @param recentSubmissions a <code>List</code> providing the details on recent submissions for user.
     */
    public void setRecentSubmissions(List<MemberProfileSubmission> recentSubmissions) {
        this.recentSubmissions = recentSubmissions;
    }

    /**
     * <p>Gets the ID of a user associated with this member profile.</p>
     *
     * @return a <code>long</code> providing the ID of a user associated with this member profile.
     */
    public long getUserId() {
        return this.userId;
    }

    /**
     * <p>Sets the ID of a user associated with this member profile.</p>
     *
     * @param userId a <code>long</code> providing the ID of a user associated with this member profile.
     */
    public void setUserId(long userId) {
        this.userId = userId;
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
     * @param handle a <code>String</code> providing the handle identifying the <code>Studio</code> member.
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
     *               from.
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
     *                    <code>Studio</code> website.
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
     *                 photo.
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
     *                   Maps the contest type ID to respective statistics for that contest type.
     */
    public void setStatistics(Map<Integer, ContestStatistics> statistics) {
        this.statistics = statistics;
    }

    /**
     * <p>Gets the overall earnings.</p>
     *
     * @return a <code>double</code> providing the overall earnings.
     */
    public double getOverallEarnings() {
        return this.overallEarnings;
    }

    /**
     * <p>Sets the overall earnings.</p>
     *
     * @param overallEarnings a <code>double</code> providing the overall earnings.
     */
    public void setOverallEarnings(double overallEarnings) {
        this.overallEarnings = overallEarnings;
    }

    /**
     * <p>Gets the details on current registrations for user.</p>
     *
     * @return a <code>List</code> providing the details on current registrations for user.
     */
    public List<MemberProfileRegistration> getCurrentRegistrations() {
        return this.currentRegistrations;
    }

    /**
     * <p>Sets the details on current registrations for user.</p>
     *
     * @param currentRegistrations a <code>List</code> providing the details on current registrations for user.
     */
    public void setCurrentRegistrations(List<MemberProfileRegistration> currentRegistrations) {
        this.currentRegistrations = currentRegistrations;
    }

    public List<MemberProfileAchievement> getAchievements() {
        return achievements;
    }

    public void setAchievements(List<MemberProfileAchievement> achievements) {
        this.achievements = achievements;
    }
}

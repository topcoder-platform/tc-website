package com.topcoder.web.tc.model;

import java.io.Serializable;

/**
 * Container for competition-related statistics
 * Data common among algorithm, design, and development competitions
 * Stored as Strings, as they are for presentation only
 *
 * @author mfogleman
 */
public class GeneralStats implements Serializable {

    private String rating;
    private String percentile;
    private String rank;
    private String countryRank;
    private String schoolRank;
    private String volatility;
    private String competitions;
    private String maxRating;
    private String minRating;
    private String earnings;
    private String reliability;

    public GeneralStats() {
        setRating("0");
        setPercentile("n/a");
        setRank("n/a");
        setCountryRank("n/a");
        setSchoolRank("n/a");
        setVolatility("n/a");
        setCompetitions("n/a");
        setMaxRating("n/a");
        setMinRating("n/a");
        setEarnings("n/a");
        setReliability("n/a");
    }

    public String toString() {
        StringBuffer b = new StringBuffer();
        b.append("\n");
        b.append("rating=").append(getRating()).append("\n");
        b.append("percentile=").append(percentile).append("\n");
        b.append("rank=").append(rank).append("\n");
        b.append("countryRank=").append(countryRank).append("\n");
        b.append("schoolRank=").append(schoolRank).append("\n");
        b.append("volatility=").append(volatility).append("\n");
        b.append("competitions=").append(competitions).append("\n");
        b.append("maxRating=").append(maxRating).append("\n");
        b.append("minRating=").append(minRating).append("\n");
        b.append("earnings=").append(earnings).append("\n");
        b.append("reliability=").append(reliability).append("\n");
        return b.toString();
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getRating() {
        return rating;
    }

    public void setPercentile(String percentile) {
        this.percentile = percentile;
    }

    public String getPercentile() {
        return percentile;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getRank() {
        return rank;
    }

    public void setCountryRank(String countryRank) {
        this.countryRank = countryRank;
    }

    public String getCountryRank() {
        return countryRank;
    }

    public void setSchoolRank(String schoolRank) {
        this.schoolRank = schoolRank;
    }

    public String getSchoolRank() {
        return schoolRank;
    }

    public void setVolatility(String volatility) {
        this.volatility = volatility;
    }

    public String getVolatility() {
        return volatility;
    }

    public void setCompetitions(String competitions) {
        this.competitions = competitions;
    }

    public String getCompetitions() {
        return competitions;
    }

    public void setMaxRating(String maxRating) {
        this.maxRating = maxRating;
    }

    public String getMaxRating() {
        return maxRating;
    }

    public void setMinRating(String minRating) {
        this.minRating = minRating;
    }

    public String getMinRating() {
        return minRating;
    }

    public void setEarnings(String earnings) {
        this.earnings = earnings;
    }

    public String getEarnings() {
        return earnings;
    }

    public void setReliability(String reliability) {
        this.reliability = reliability;
    }

    public String getReliability() {
        return reliability;
    }

}

/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

/**
 * <p>
 * This is a simple container class that has information of about the Top 10 Details.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author  kanakarajank
 * @version 1.0
 */
public class TopTenDTO {

	/**
	 * 
	 */
	int rank;
	
	/**
	 * 
	 */
	long coderId;
	
	/**
	 * 
	 */
	String handle;
	
	/**
	 * 
	 */
	long rating;
	
	/**
	 * 
	 */
	String name;
	
	/**
	 * 
	 */
	Double avgRating;
	
	/**
	 * 
	 */
	String styleClass;
	
	/**
	 * 
	 */
	int countryCode;
	
	/**
	 * @return the rank
	 */
	public int getRank() {
		return rank;
	}

	/**
	 * @param rank the rank to set
	 */
	public void setRank(int rank) {
		this.rank = rank;
	}

	/**
	 * @return the coderId
	 */
	public long getCoderId() {
		return coderId;
	}

	/**
	 * @param coderId the coderId to set
	 */
	public void setCoderId(long coderId) {
		this.coderId = coderId;
	}

	/**
	 * @return the handle
	 */
	public String getHandle() {
		return handle;
	}

	/**
	 * @param handle the handle to set
	 */
	public void setHandle(String handle) {
		this.handle = handle;
	}

	/**
	 * @return the rating
	 */
	public long getRating() {
		return rating;
	}

	/**
	 * @param rating the rating to set
	 */
	public void setRating(long rating) {
		this.rating = rating;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the avgRating
	 */
	public Double getAvgRating() {
		return avgRating;
	}

	/**
	 * @param avgRating the avgRating to set
	 */
	public void setAvgRating(Double avgRating) {
		this.avgRating = avgRating;
		this.rating = avgRating.longValue();
	}

	/**
	 * @return the styleClass
	 */
	public String getStyleClass() {
		String styleClass = "coderTextOrange";
        if (rating > 2199) {
            styleClass = "coderTextRed";
        } else if (rating > 1499 && rating < 2200) {
            styleClass = "coderTextYellow";
        } else if (rating > 1199 && rating < 1500) {
            styleClass = "coderTextBlue";
        } else if (rating > 899 && rating < 1200) {
            styleClass = "coderTextGreen";
        } else if (rating > 0 && rating < 900) {
            styleClass = "coderTextGray";
        } else if (rating == 0) {
            styleClass = "coderTextWhite";
        }
        return styleClass;
	}

	/**
	 * @param styleClass the styleClass to set
	 */
	public void setStyleClass(String styleClass) {
		this.styleClass = styleClass;
	}

	/**
	 * @return the countryCode
	 */
	public int getCountryCode() {
		return countryCode;
	}

	/**
	 * @param countryCode the countryCode to set
	 */
	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "TopTenDTO [rank=" + rank + ", coderId=" + coderId + ", handle="
				+ handle + ", rating=" + rating + ", name=" + name
				+ ", avgRating=" + avgRating + ", styleClass=" + styleClass
				+ ", countryCode=" + countryCode + "]";
	}

	
}

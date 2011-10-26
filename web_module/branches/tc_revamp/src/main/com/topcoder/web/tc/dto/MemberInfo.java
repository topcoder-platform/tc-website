/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.dto;

/**
 * <p>
 * This is a simple container class that has information of an Member.
 * </p>
 * <p>
 * Thread Safety: This class is not thread-safe because it's mutable.
 * </p>
 *
 * @author  kanakarajank
 * @version 1.0
 */
public class MemberInfo {
	
	/**
	 * coderId
	 */
	long coderId;
	
	/**
	 * handleId
	 */
	String handleId;
		
	/**
	 * 
	 */
	int hasImage;
	
	/**
	 * 
	 */
	String imagePath;
	
	/**
	 * 
	 */
	long rating;
	
	/**
	 * 
	 */
	long designRating;
	
	/**
	 * 
	 */
	long developmentRating;
	
	/**
	 * 
	 */
	long conceptRating;
	
	/**
	 * 
	 */
	long specRating;
	
	/**
	 * 
	 */
	long archRating;
	
	/**
	 * 
	 */
	long assemblyRating;
	
	/**
	 * 
	 */
	long testRating;
	
	/**
	 * 
	 */
	long testScenariosRating;
	
	/**
	 * 
	 */
	long uiPrototypeRating;
	
	/**
	 * 
	 */
	long riaBuildRating;
	
	/**
	 * 
	 */
	long mmRating;
	
	/**
	 * 
	 */
	int hasRating;
	
	/**
	 * 
	 */
	int hsRegistered;
	
	/**
	 * 
	 */
	int hasAchievements;
	
	/**
	 * 
	 */
	String schoolName;

	/**
	 * 
	 */
	double designEarnings;
	
	/**
	 * 
	 */
	double developmentEarnings;
	
	/**
	 * 
	 */
	double overallEarnings;
	
	/**
	 * 
	 */
	double totalEarnings;

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
	 * @return the handleId
	 */
	public String getHandleId() {
		return handleId;
	}

	/**
	 * @param handleId the handleId to set
	 */
	public void setHandleId(String handleId) {
		this.handleId = handleId;
	}

	/**
	 * @return the hasImage
	 */
	public int getHasImage() {
		return hasImage;
	}

	/**
	 * @param hasImage the hasImage to set
	 */
	public void setHasImage(int hasImage) {
		this.hasImage = hasImage;
	}

	/**
	 * @return the imagePath
	 */
	public String getImagePath() {
		return imagePath;
	}

	/**
	 * @param imagePath the imagePath to set
	 */
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
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
	 * @return the designRating
	 */
	public long getDesignRating() {
		return designRating;
	}

	/**
	 * @param designRating the designRating to set
	 */
	public void setDesignRating(long designRating) {
		this.designRating = designRating;
	}

	/**
	 * @return the developmentRating
	 */
	public long getDevelopmentRating() {
		return developmentRating;
	}

	/**
	 * @param developmentRating the developmentRating to set
	 */
	public void setDevelopmentRating(long developmentRating) {
		this.developmentRating = developmentRating;
	}

	/**
	 * @return the conceptRating
	 */
	public long getConceptRating() {
		return conceptRating;
	}

	/**
	 * @param conceptRating the conceptRating to set
	 */
	public void setConceptRating(long conceptRating) {
		this.conceptRating = conceptRating;
	}

	/**
	 * @return the specRating
	 */
	public long getSpecRating() {
		return specRating;
	}

	/**
	 * @param specRating the specRating to set
	 */
	public void setSpecRating(long specRating) {
		this.specRating = specRating;
	}

	/**
	 * @return the archRating
	 */
	public long getArchRating() {
		return archRating;
	}

	/**
	 * @param archRating the archRating to set
	 */
	public void setArchRating(long archRating) {
		this.archRating = archRating;
	}

	/**
	 * @return the assemblyRating
	 */
	public long getAssemblyRating() {
		return assemblyRating;
	}

	/**
	 * @param assemblyRating the assemblyRating to set
	 */
	public void setAssemblyRating(long assemblyRating) {
		this.assemblyRating = assemblyRating;
	}

	/**
	 * @return the testRating
	 */
	public long getTestRating() {
		return testRating;
	}

	/**
	 * @param testRating the testRating to set
	 */
	public void setTestRating(long testRating) {
		this.testRating = testRating;
	}

	/**
	 * @return the testScenariosRating
	 */
	public long getTestScenariosRating() {
		return testScenariosRating;
	}

	/**
	 * @param testScenariosRating the testScenariosRating to set
	 */
	public void setTestScenariosRating(long testScenariosRating) {
		this.testScenariosRating = testScenariosRating;
	}

	/**
	 * @return the uiPrototypeRating
	 */
	public long getUiPrototypeRating() {
		return uiPrototypeRating;
	}

	/**
	 * @param uiPrototypeRating the uiPrototypeRating to set
	 */
	public void setUiPrototypeRating(long uiPrototypeRating) {
		this.uiPrototypeRating = uiPrototypeRating;
	}

	/**
	 * @return the riaBuildRating
	 */
	public long getRiaBuildRating() {
		return riaBuildRating;
	}

	/**
	 * @param riaBuildRating the riaBuildRating to set
	 */
	public void setRiaBuildRating(long riaBuildRating) {
		this.riaBuildRating = riaBuildRating;
	}

	/**
	 * @return the mmRating
	 */
	public long getMmRating() {
		return mmRating;
	}

	/**
	 * @param mmRating the mmRating to set
	 */
	public void setMmRating(long mmRating) {
		this.mmRating = mmRating;
	}

	/**
	 * @return the hasRating
	 */
	public int getHasRating() {
		return hasRating;
	}

	/**
	 * @param hasRating the hasRating to set
	 */
	public void setHasRating(int hasRating) {
		this.hasRating = hasRating;
	}

	/**
	 * @return the hsRegistered
	 */
	public int getHsRegistered() {
		return hsRegistered;
	}

	/**
	 * @param hsRegistered the hsRegistered to set
	 */
	public void setHsRegistered(int hsRegistered) {
		this.hsRegistered = hsRegistered;
	}

	/**
	 * @return the hasAchievements
	 */
	public int getHasAchievements() {
		return hasAchievements;
	}

	/**
	 * @param hasAchievements the hasAchievements to set
	 */
	public void setHasAchievements(int hasAchievements) {
		this.hasAchievements = hasAchievements;
	}

	/**
	 * @return the schoolName
	 */
	public String getSchoolName() {
		return schoolName;
	}

	/**
	 * @param schoolName the schoolName to set
	 */
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	/**
	 * @return the designEarnings
	 */
	public double getDesignEarnings() {
		return designEarnings;
	}

	/**
	 * @param designEarnings the designEarnings to set
	 */
	public void setDesignEarnings(double designEarnings) {
		this.designEarnings = designEarnings;
	}

	/**
	 * @return the developmentEarnings
	 */
	public double getDevelopmentEarnings() {
		return developmentEarnings;
	}

	/**
	 * @param developmentEarnings the developmentEarnings to set
	 */
	public void setDevelopmentEarnings(double developmentEarnings) {
		this.developmentEarnings = developmentEarnings;
	}

	/**
	 * @return the overallEarnings
	 */
	public double getOverallEarnings() {
		return overallEarnings;
	}

	/**
	 * @param overallEarnings the overallEarnings to set
	 */
	public void setOverallEarnings(double overallEarnings) {
		this.overallEarnings = overallEarnings;
	}

	/**
	 * @return the totalEarnings
	 */
	public double getTotalEarnings() {
		return totalEarnings;
	}

	/**
	 * @param totalEarnings the totalEarnings to set
	 */
	public void setTotalEarnings(double totalEarnings) {
		this.totalEarnings = totalEarnings;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "MemberInfo [coderId=" + coderId + ", handleId=" + handleId
				+ ", hasImage=" + hasImage + ", imagePath=" + imagePath
				+ ", rating=" + rating + ", designRating=" + designRating
				+ ", developmentRating=" + developmentRating
				+ ", conceptRating=" + conceptRating + ", specRating="
				+ specRating + ", archRating=" + archRating
				+ ", assemblyRating=" + assemblyRating + ", testRating="
				+ testRating + ", testScenariosRating=" + testScenariosRating
				+ ", uiPrototypeRating=" + uiPrototypeRating
				+ ", riaBuildRating=" + riaBuildRating + ", mmRating="
				+ mmRating + ", hasRating=" + hasRating + ", hsRegistered="
				+ hsRegistered + ", hasAchievements=" + hasAchievements
				+ ", schoolName=" + schoolName + ", designEarnings="
				+ designEarnings + ", developmentEarnings="
				+ developmentEarnings + ", overallEarnings=" + overallEarnings
				+ "]";
	}
	
}

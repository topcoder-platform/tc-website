package com.topcoder.web.ep.dto;

import java.sql.Timestamp;
import java.util.List;

public class AssignmentDTO {
    Long roundId = null;
    Long classroomId = null;
    String classroomName = null;
    List<Long> components = null;
    List<Double> points = null;
    Timestamp startDate = null;
    Timestamp endDate = null;
    String assignmentName = null;
    Long coderPhaseLength = null;
    Long showAllScores = null;
    Long scoreType = null;
    List<Integer> languages = null;

    
    public AssignmentDTO() {
        super();
    }
    
    public AssignmentDTO(Long roundId, Long classroomId, String classroomName, List<Long> components, List<Double> points, Timestamp startDate, Timestamp endDate, String assignmentName, Long coderPhaseLength, Long showAllScores, Long scoreType, List<Integer> languages) {
        super();
        this.roundId = roundId;
        this.classroomId = classroomId;
        this.classroomName = classroomName;
        this.components = components;
        this.points = points;
        this.startDate = startDate;
        this.endDate = endDate;
        this.assignmentName = assignmentName;
        this.coderPhaseLength = coderPhaseLength;
        this.showAllScores = showAllScores;
        this.scoreType = scoreType;
        this.languages = languages;
    }
    
    /**
     * @return the assignmentName
     */
    public String getAssignmentName() {
        return assignmentName;
    }
    /**
     * @param assignmentName the assignmentName to set
     */
    public void setAssignmentName(String assignmentName) {
        this.assignmentName = assignmentName;
    }
    /**
     * @return the classroomId
     */
    public Long getClassroomId() {
        return classroomId;
    }
    /**
     * @param classroomId the classroomId to set
     */
    public void setClassroomId(Long classroomId) {
        this.classroomId = classroomId;
    }
    /**
     * @return the classroomName
     */
    public String getClassroomName() {
        return classroomName;
    }
    /**
     * @param classroomName the classroomName to set
     */
    public void setClassroomName(String classroomName) {
        this.classroomName = classroomName;
    }
    /**
     * @return the coderPhaseLength
     */
    public Long getCoderPhaseLength() {
        return coderPhaseLength;
    }
    /**
     * @param coderPhaseLength the coderPhaseLength to set
     */
    public void setCoderPhaseLength(Long coderPhaseLength) {
        this.coderPhaseLength = coderPhaseLength;
    }
    /**
     * @return the components
     */
    public List<Long> getComponents() {
        return components;
    }
    /**
     * @param components the components to set
     */
    public void setComponents(List<Long> components) {
        this.components = components;
    }
    
    public void addComponent(Long componentId) {
        this.components.add(componentId);
    }

    public void removeComponent(Long componentId) {
        this.components.remove(componentId);
    }

    /**
     * @return the endDate
     */
    public Timestamp getEndDate() {
        return endDate;
    }
    /**
     * @param endDate the endDate to set
     */
    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }
    /**
     * @return the languages
     */
    public List<Integer> getLanguages() {
        return languages;
    }
    /**
     * @param languages the languages to set
     */
    public void setLanguages(List<Integer> languages) {
        this.languages = languages;
    }
    /**
     * @return the points
     */
    public List<Double> getPoints() {
        return points;
    }
    /**
     * @param points the points to set
     */
    public void setPoints(List<Double> points) {
        this.points = points;
    }
    /**
     * @return the roundId
     */
    public Long getRoundId() {
        return roundId;
    }
    /**
     * @param roundId the roundId to set
     */
    public void setRoundId(Long roundId) {
        this.roundId = roundId;
    }
    /**
     * @return the scoreType
     */
    public Long getScoreType() {
        return scoreType;
    }
    /**
     * @param scoreType the scoreType to set
     */
    public void setScoreType(Long scoreType) {
        this.scoreType = scoreType;
    }
    /**
     * @return the showAllScores
     */
    public Long getShowAllScores() {
        return showAllScores;
    }
    /**
     * @param showAllScores the showAllScores to set
     */
    public void setShowAllScores(Long showAllScores) {
        this.showAllScores = showAllScores;
    }
    /**
     * @return the startDate
     */
    public Timestamp getStartDate() {
        return startDate;
    }
    /**
     * @param startDate the startDate to set
     */
    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }
    
    
}

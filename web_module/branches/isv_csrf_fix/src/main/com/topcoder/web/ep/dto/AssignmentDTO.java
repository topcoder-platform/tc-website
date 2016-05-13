package com.topcoder.web.ep.dto;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class AssignmentDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private Long roundId = null;
    private Long classroomId = null;
    private String classroomName = null;
    private String schoolName = null;
    
    private List<ComponentDTO> components = null;

    private Timestamp startDate = null;
    private Timestamp endDate = null;
    private String assignmentName = null;
    private Long coderPhaseLength = null;
    private Long showAllScores = null;
    private Long scoreType = null;
    private List<Integer> languages = null;

    
    public AssignmentDTO() {
        super();
        this.components = new ArrayList<ComponentDTO>();
        this.languages = new ArrayList<Integer>();
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
    public List<ComponentDTO> getComponents() {
        return components;
    }
    /**
     * @param components the components to set
     */
    public void setComponents(List<ComponentDTO> components) {
        this.components = components;
    }
    
    public void addComponent(ComponentDTO component) {
        this.components.add(component);
    }

    public void removeComponent(ComponentDTO component) {
        this.components.remove(component);
    }

    public void clearComponents() {
        this.components.clear();
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

    public String getSchoolName() {
        return schoolName;

    }
    
    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;        
    }
    
}

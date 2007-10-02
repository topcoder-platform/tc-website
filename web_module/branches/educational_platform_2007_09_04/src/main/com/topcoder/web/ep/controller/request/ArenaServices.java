package com.topcoder.web.ep.controller.request;

import java.sql.Timestamp;
import java.util.List;

public interface ArenaServices {

    public void addNewAssignment(Long classroomId, String classroomName, List<Long> components, List<Double> points, Timestamp startDate, Timestamp endDate, String assignmentName, Long coderPhaseLength, Long showAllScores, Long scoreType, List<Integer> languages);

    public void editAssignment(Long roundId, Long classroomId, String classroomName, List<Long> components, List<Double> points, Timestamp startDate, Timestamp endDate, String assignmentName, Long coderPhaseLength, Long showAllScores, Long scoreType, List<Integer> languages);

}
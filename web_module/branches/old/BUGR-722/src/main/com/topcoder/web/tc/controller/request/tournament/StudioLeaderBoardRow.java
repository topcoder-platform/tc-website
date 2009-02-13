/*
* StudioLeaderBoardRow
*
* Created Aug 2, 2007
*/
package com.topcoder.web.tc.controller.request.tournament;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id: StudioLeaderBoardRow.java 68101 2008-01-21 18:39:50Z pulky $
 */
public class StudioLeaderBoardRow {

    private Integer rank;
    private Long userId;
    private String handleLower;
    private String handle;
    private Integer completedContests;
    private List<Integer> completedPoints;
    private List<Integer> placements;    
    private Integer currentContests;
    private Integer bestPoints;
        
    public Integer getBestPoints() {
        return bestPoints;
    }

    public StudioLeaderBoardRow(Long userId, String handle, String handleLower) {
        super();
        this.userId = userId;
        this.handleLower = handleLower;
        this.handle = handle;
        this.completedContests = 0;
        this.completedPoints = new ArrayList<Integer>();
        this.placements = new ArrayList<Integer>();
        this.currentContests = 0;
    }
    
    public void calculateBestPoints(int max) {
        int total = 0;
        Collections.sort(completedPoints);
        for (int i = completedPoints.size() - 1; i >= 0 && completedPoints.size() - i <= max ; i--) {
            total += completedPoints.get(i); 
        }
        bestPoints = total;
    }

    public Integer getCompletedContests() {
        return completedContests;
    }
    public void setCompletedContests(Integer completedContests) {
        this.completedContests = completedContests;
    }
    public List<Integer> getCompletedPoints() {
        return new ArrayList<Integer>(completedPoints);
    }
    public void setCompletedPoints(List<Integer> completedPoints) {
        this.completedPoints = completedPoints;
    }
    public Integer getCurrentContests() {
        return currentContests;
    }
    public void setCurrentContests(Integer currentContests) {
        this.currentContests = currentContests;
    }
    public String getHandleLower() {
        return handleLower;
    }
    public void setHandleLower(String handleLower) {
        this.handleLower = handleLower;
    }
    public Integer getRank() {
        return rank;
    }
    public void setRank(Integer rank) {
        this.rank = rank;
    }
    public Long getUserId() {
        return userId;
    }
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public List<Integer> getPlacements() {
        return new ArrayList<Integer>(placements);
    }

    public void setPlacements(List<Integer> placements) {
        this.placements = placements;
    }
}

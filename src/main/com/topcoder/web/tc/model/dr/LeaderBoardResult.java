/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.web.tc.model.dr;

import java.util.List;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * Bean for the leader board result.
 * 
 * @author pulky
 * @version $Id: LeaderBoardResult.java 72666 2008-09-01 15:40:37Z pwolfus $
 * Create Date: Sep 1, 2008
 */
public class LeaderBoardResult {

    List<IBoardRow> results;
    Double totalPoints;
    Double totalTopFivePrize;
    Double totalTopPerformerPrize;
    Double totalPrizes;

    
    public LeaderBoardResult(List<IBoardRow> results, Double totalPoints,
            Double totalTopFivePrize, Double totalTopPerformerPrize, Double totalPrizes) {
        super();
        this.results = results;
        this.totalPoints = totalPoints;
        this.totalPrizes = totalPrizes;
        this.totalTopFivePrize = totalTopFivePrize;
        this.totalTopPerformerPrize = totalTopPerformerPrize;
    }
    
    public List<IBoardRow> getResults() {
        return results;
    }
    public void setResults(List<IBoardRow> results) {
        this.results = results;
    }
    public Double getTotalPoints() {
        return totalPoints;
    }
    public void setTotalPoints(Double totalPoints) {
        this.totalPoints = totalPoints;
    }
    public Double getTotalTopFivePrize() {
        return totalTopFivePrize;
    }
    public void setTotalTopFivePrize(Double totalTopFivePrize) {
        this.totalTopFivePrize = totalTopFivePrize;
    }
    public Double getTotalTopPerformerPrize() {
        return totalTopPerformerPrize;
    }
    public void setTotalTopPerformerPrize(Double totalTopPerformerPrize) {
        this.totalTopPerformerPrize = totalTopPerformerPrize;
    }
    public Double getTotalPrizes() {
        return totalPrizes;
    }
    public void setTotalPrizes(Double totalPrizes) {
        this.totalPrizes = totalPrizes;
    }
    
}

/*
 * GameResult
 * 
 * Created Aug 6, 2008
 */
package com.topcoder.web.winformula.model;

import java.io.Serializable;

/**
 * @author Diego Belfer (Mural)
 * @version $Id: GameResult.java 72272 2008-08-11 16:58:57Z pwolfus $
 */
public class GameResult implements Serializable {
    private int homeScore;
    private int awayScore;

    public GameResult(int homeScore, int awayScore) {
        this.awayScore = awayScore;
        this.homeScore = homeScore;
    }

    public int getHomeScore() {
        return homeScore;
    }

    public int getAwayScore() {
        return awayScore;
    }
    
    @Override
    public String toString() {
        return "{"+homeScore+", "+awayScore+"}";
    }
}

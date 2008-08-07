/*
 * PredictionItem
 * 
 * Created Aug 6, 2008
 */
package com.topcoder.web.winformula.model;

import java.io.Serializable;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
public class PredictionItem implements Serializable {
    private String homeTeamName;
    private String awayTeamName;
    private GameResult predictedResult;
    private GameResult realResult;
    private Integer score;
    
    
    public PredictionItem(String homeTeamName, String awayTeamName, GameResult predictedResult) {
        this(homeTeamName, awayTeamName, predictedResult, null, null);
        
    }
    
    public PredictionItem(String homeTeamName, String awayTeamName, GameResult predictedResult, GameResult realResult,
            Integer predictionScore) {
        this.homeTeamName = homeTeamName;
        this.awayTeamName = awayTeamName;
        this.predictedResult = predictedResult;
        this.realResult = realResult;
        this.score = predictionScore;
    }

    public String getHomeTeamName() {
        return homeTeamName;
    }

    public String getAwayTeamName() {
        return awayTeamName;
    }

    public GameResult getPredictedResult() {
        return predictedResult;
    }

    public GameResult getRealResult() {
        return realResult;
    }

    public Integer getScore() {
        return score;
    }
    
    public String toString() {
        return "{home="+homeTeamName+", away="+awayTeamName+", score="+score+", predicted="+predictedResult+", real="+realResult+"}";
    }
    
    public Boolean getPickedWinner() {
        if (realResult == null) {
            return Boolean.FALSE;
        }
        int real = realResult.getHomeScore() - realResult.getAwayScore();
        int pred = predictedResult.getHomeScore() - predictedResult.getAwayScore();

        return ((real > 0 && pred > 0) || (real < 0 && pred < 0) || (real == 0 && pred == 0)); 
    }
}

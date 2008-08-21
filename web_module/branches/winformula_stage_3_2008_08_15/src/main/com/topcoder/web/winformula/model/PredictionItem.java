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
    private Integer totalScoreVariance;
    private Integer victoryMarginVariance;
    private Boolean pickedWinner;
    
    
    public PredictionItem(String homeTeamName, String awayTeamName, GameResult predictedResult) {
        this(homeTeamName, awayTeamName, predictedResult, null, null, null, null, null);
        
    }
    
    public PredictionItem(String homeTeamName, String awayTeamName, GameResult predictedResult, GameResult realResult,
            Integer predictionScore, Integer totalScoreVariance, Integer victoryMarginVariance,
            Boolean pickedWinner) {
        this.homeTeamName = homeTeamName;
        this.awayTeamName = awayTeamName;
        this.predictedResult = predictedResult;
        this.realResult = realResult;
        this.score = predictionScore;
        this.totalScoreVariance = totalScoreVariance;
        this.victoryMarginVariance = victoryMarginVariance;
        this.pickedWinner = pickedWinner;
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
    
    public Integer getTotalScoreVariance() {
        return totalScoreVariance;
    }
    
    public Integer getVictoryMarginVariance() {
        return victoryMarginVariance;
    }
    
    public Boolean getPickedWinner() {
        return pickedWinner;
    }
    
    public String toString() {
        return "{home="+homeTeamName+", away="+awayTeamName+", score="+score+", totalScoreVariance="+totalScoreVariance+", victoryMarginVariance="+victoryMarginVariance+", pickedWinner="+pickedWinner+", predicted="+predictedResult+", real="+realResult+"}";
    }
}
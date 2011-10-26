/*
 * PredictionResultTransformer
 * 
 * Created Aug 18, 2008
 */
package com.topcoder.web.winformula.algorithm.services;

import java.util.ArrayList;
import java.util.List;

import com.topcoder.web.winformula.model.GameResult;
import com.topcoder.web.winformula.model.Prediction;
import com.topcoder.web.winformula.model.PredictionItem;
import com.topcoder.web.winformula.model.PredictionStat;
import com.topcoder.web.winformula.model.PredictionSummary;

/**
 * @author Diego Belfer (Mural)
 * @version $Id: PredictionResultTransformer.java 80243 2011-10-21 09:50:13Z lmmortal $
 */
public class PredictionResultTransformer {
    
    //ResultObject = Object[] {Week 1, .. Week n}
    //Week = Object [] {week id, score, prediction}
    //                  Integer, Integer, Prediction
    //prediction = Object[] {Game1... Game N}
    //Game = Object[] {homeTeam, awayTeam, homePScore, awayPScore, homeScore, awayScore, predictionScore}
    //                 String,   String, Integer, Integer, Integer, Integer, Integer
    public static PredictionSummary transformPredictions(Object o) {
        if (o == null) {
            return PredictionSummary.NULL_SUMMARY;
        }
        int totalGamesWithScore = 0;
        int totalCorrect = 0;
        
        Object[] weeks = (Object[]) o;
        List<Prediction> predictions = new ArrayList(weeks.length);
        int bestWeekIndex=-1;
        int worstWeekIndex=-1;
        for (int i = 0; i < weeks.length; i++) {
            Object[] week = (Object[]) weeks[i];
            Integer weekId = (Integer) week[0];
            Integer score = (Integer) week[1];
            Object[] results = (Object[]) week[2];
            List<PredictionItem> items = new ArrayList(results.length);
            int weekCorrect = 0;
            int weekWithScore = 0;
            for (int j = 0; j < results.length; j++) {
                Object[] game = (Object[]) results[j];
                String homeTeam = (String) game[0];
                String awayTeam = (String) game[1];
                Integer homePScore = (Integer) game[2];
                Integer awayPScore = (Integer) game[3];
                Integer homeScore = (Integer) game[4];
                Integer awayScore = (Integer) game[5];
                Integer predictionScore = (Integer) game[6];
                GameResult pscore = null;
                if (homePScore != null && awayPScore != null) {
                    pscore = new GameResult(homePScore.intValue(), awayPScore.intValue());
                }
                GameResult rscore = null;
                if (homeScore != null && awayScore != null) {
                    weekWithScore++;
                    rscore = new GameResult(homeScore.intValue(), awayScore.intValue());
                }
                PredictionItem predictionItem = new PredictionItem(homeTeam, awayTeam, pscore, rscore, predictionScore);
                if (predictionItem.getPickedWinner() != null && predictionItem.getPickedWinner().booleanValue()) {
                    weekCorrect++;
                }
                items.add(predictionItem);
            }
            Prediction prediction = new Prediction(weekId.intValue(), items, score, new PredictionStat(weekWithScore, weekCorrect));
            Double weekAccuracy = prediction.getStats().getAccuracy();
            if (weekAccuracy != null) {
                if (bestWeekIndex == -1 || predictions.get(bestWeekIndex).getStats().getAccuracy().compareTo(weekAccuracy) < 0) {
                    bestWeekIndex = i;
                }
                if (worstWeekIndex == -1 || predictions.get(worstWeekIndex).getStats().getAccuracy().compareTo(weekAccuracy) > 0) {
                    worstWeekIndex = i;
                }
            }
            predictions.add(prediction);
            totalCorrect += weekCorrect;
            totalGamesWithScore += weekWithScore;
        }
        return new PredictionSummary(new PredictionStat(totalGamesWithScore, totalCorrect), predictions, worstWeekIndex, bestWeekIndex);
    }
}

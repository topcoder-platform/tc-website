/*
 * ViewGameDetails
 * 
 * Created Aug 8, 2008
 */
package com.topcoder.web.winformula.controller.request;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.tag.ListSelectTag;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.controller.GamesHelper;
import com.topcoder.web.winformula.model.GameData;
import com.topcoder.web.winformula.model.GameResult;
import com.topcoder.web.winformula.model.PredictionItem;
import com.topcoder.web.winformula.model.WeekData;

/**
 * @autor Pablo Wolfus (pulky)
 * @version $Id$
 */
public class ViewGameDetails extends StatsBase {
    protected static final Logger log = Logger.getLogger(ViewGameDetails.class);
    
    private int gameId = -1;

    protected void statsProcessing() throws Exception {
        try {
            TCRequest request = getRequest();
            TCResponse response = getResponse();

            String selectedGame = StringUtils.checkNull(request.getParameter("game"));
            try {
                gameId = Integer.parseInt(selectedGame);
            } catch (Exception e) {
            }

            if (gameId == -1) {
                String selectedWeek = StringUtils.checkNull(request.getParameter("week"));
                int weekId = -1;
                try {
                    weekId = Integer.parseInt(selectedWeek);
                } catch (Exception e) {
                }

                if (weekId > 0) {
                    ResultSetContainer rsc = getGamesForWeek(weekId);
                    if (rsc.size() > 0) {
                        gameId = rsc.getIntItem(0, "game_id");
                    } else {
                        throw new TCWebException("Invalid parameters");
                    }
                } else {
                    throw new TCWebException("Invalid parameters");
                }
            }
            
            // get data from DB
            // first the game's general data
            GameData gd = getGameData(gameId);
            
            if (gd != null) {
                // then the weeks
                setWeeks();

                // then the games
                request.setAttribute("games", setGames(gd.getWeek().getId()));
    
                // then the games predictions
                ResultSetContainer rsc = GamesHelper.getGamesPredictions(gameId);
    
                // make it a list of beans
                List<PredictionItem> predictions = GamesHelper.processResult(rsc);
    
                // sort
                if (predictions != null) {
                    GamesHelper.sortResult(request, predictions);
            
                    // crop
                    predictions = GamesHelper.cropResult(request, response, predictions);

                    gd.setPredictions(predictions);
                }
                request.setAttribute("week", gd.getWeek().getId());
            }    
            
            request.setAttribute("game", gameId);
            request.setAttribute("result", gd);

            setNextPage(Constants.PAGE_GAME_DETAILS);
            setIsNextPageInContext(true);
        } catch (PermissionException pe) {
            throw pe;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private void setWeeks() throws Exception {
        Request r = new Request();
        r.setContentHandle("prediction_weeks");

        DataAccessInt dai = new CachedDataAccess(MaxAge.FIVE_MINUTES, DBMS.WINFORMULA_DATASOURCE_NAME);
        ResultSetContainer rscWeeks = dai.getData(r).get("prediction_weeks");

        getRequest().setAttribute("maxWeek", rscWeeks.get(rscWeeks.size()-1).getIntItem("week_id"));
    }
        
    private GameData getGameData(int gameId) throws Exception {
        Request r = new Request();
        r.setContentHandle("game_data");
        r.setProperty(Constants.GAME_ID, String.valueOf(gameId));

        DataAccessInt dai = new CachedDataAccess(DBMS.WINFORMULA_DATASOURCE_NAME);
        ResultSetContainer rsc = dai.getData(r).get("game_data");
        
        if (rsc.size() > 0) {
            ResultSetRow rsr = rsc.get(0);
            Integer weekId = rsr.getIntItem("week_id");
            String weekDesc = rsr.getStringItem("week_desc");
            String home = rsr.getStringItem("home");
            String away = rsr.getStringItem("away");
            Integer homeScore = GamesHelper.getNullableIntItem(rsr, "home_score");
            Integer awayScore = GamesHelper.getNullableIntItem(rsr, "away_score");
            Double winPercent = GamesHelper.getNullableDoubleItem(rsr, "win_percent");

            GameResult gr = null;
            
            if (homeScore != null && awayScore != null) {
                gr = new GameResult(homeScore, awayScore);
            }
            
            return new GameData(new WeekData(weekId, weekDesc), home, away, gr, winPercent, null);
            
        } else {
            return null;
        }
    }

    private List<ListSelectTag.Option> setGames(long weekId) throws Exception {
        ResultSetContainer rscGames = getGamesForWeek(weekId);
        List<ListSelectTag.Option> games;
        if (rscGames.size() > 0) {
            games = new ArrayList<ListSelectTag.Option>(rscGames.size());
            boolean found = false;
            for (ResultSetRow rsr : rscGames) {
                games.add(new ListSelectTag.Option(String.valueOf(rsr.getIntItem("game_id")), rsr.getStringItem("game_desc"), rsr.getIntItem("game_id") == gameId));
                if (rsr.getIntItem("game_id") == gameId) {
                    found = true;
                }
            }
            if (!found && rscGames.size() > 0) {
                gameId = rscGames.get(0).getIntItem("game_id");
            }
        } else { 
            log.info("games is null or empty");
            games = Collections.emptyList();
        }
        return games;
    }

    private ResultSetContainer getGamesForWeek(long weekId) throws Exception {
        Request r = new Request();
        String commandName = "week_games";
        r.setContentHandle(commandName);
        r.setProperty(Constants.WEEK_ID, String.valueOf(weekId));
        DataAccessInt dai = new CachedDataAccess(MaxAge.QUARTER_HOUR, DBMS.WINFORMULA_DATASOURCE_NAME);
        return dai.getData(r).get(commandName);
    }

}

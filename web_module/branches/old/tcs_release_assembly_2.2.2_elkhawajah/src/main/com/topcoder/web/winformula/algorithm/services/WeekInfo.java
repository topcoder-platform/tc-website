/*
 * WeekInfo
 * 
 * Created Aug 15, 2008
 */
package com.topcoder.web.winformula.algorithm.services;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
public class WeekInfo {
    public static final int WEEK_ALLOW_PREDICTIONS = 1;
    public static final int WEEK_WITH_FINAL_PREDICTIONS = 2;
    public static final int WEEK_SCORED_AND_CLOSED = 3;
    
    private int id;
    private Map<String, Game> games = new HashMap<String, Game>();
    private int statusId;
    
    public WeekInfo(int weekId, int statusId) {
        this.id = weekId;
        this.statusId = statusId;
    }
    
    public int getId() {
        return id;
    }

    public void addGame(int gameId, String homeTeam, String awayTeam, int statusId, Integer homeScore, Integer awayScore) {
        games.put(buildKey(homeTeam, awayTeam), new Game(gameId, homeTeam, awayTeam, statusId, homeScore, awayScore));
    }
    
    public boolean isWeekAllowingPredictions() {
        return statusId != WEEK_SCORED_AND_CLOSED;
    }

    public int getGameId(String homeTeamName, String awayTeamName) {
        Game game = games.get(buildKey(homeTeamName, awayTeamName));
        if (game != null) {
            return game.getId();
        }
        throw new IllegalArgumentException("Invalid teams for the games of the weeks: "+homeTeamName+", "+awayTeamName);
    }
    
    public int getGameCount() {
        return games.size();
    }

    private String buildKey(String homeTeamName, String awayTeamName) {
        return homeTeamName.toLowerCase()+"|"+awayTeamName.toLowerCase();
    }
    
    public static class Game {
        public static final int FUTURE_GAME = 0;
        public static final int PLAYED_GAME = 1;
        public static final int SUSPENDED_GAME = 2;
        public static final int CANCELLED_GAME = 3;
        private int id;
        private String homeTeam;
        private String awayTeam;
        private Integer homeScore;
        private Integer awayScore;
        private int statusId;
        
        public Game(int id, String homeTeam, String awayTeam, int statusId, Integer homeScore, Integer awayScore) {
            this.id = id;
            this.homeTeam = homeTeam;
            this.awayTeam = awayTeam;
            this.statusId = statusId;
            this.homeScore = homeScore;
            this.awayScore = awayScore;
        }
        
        public int getId() {
            return id;
        }
        public String getHomeTeam() {
            return homeTeam;
        }
        public String getAwayTeam() {
            return awayTeam;
        }
        public Integer getHomeScore() {
            return homeScore;
        }
        public Integer getAwayScore() {
            return awayScore;
        }
        public int getStatusId() {
            return statusId;
        }
        public boolean forTeams(String homeTeamName, String awayTeamName) {
            return homeTeam.equalsIgnoreCase(homeTeamName) && awayTeam.equalsIgnoreCase(awayTeamName);
        }
        
    }
}

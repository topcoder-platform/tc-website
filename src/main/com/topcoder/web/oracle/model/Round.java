package com.topcoder.web.oracle.model;

import com.topcoder.web.common.model.Base;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 13, 2007
 */
public class Round extends Base {
    private Integer id;
    private String name;
    private Contest contest;
    private Set<Prize> prizes;
    private Set<Room> rooms;
    private RoundStatus status;
    private Set<Prediction> predictions;
    private Set<RoundConfig> config;


    public Round() {
        prizes = new TreeSet<Prize>();
        rooms = new HashSet<Room>();
        config = new HashSet<RoundConfig>();
        predictions = new HashSet<Prediction>();
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Contest getContest() {
        return contest;
    }

    public void setContest(Contest contest) {
        this.contest = contest;
    }

    public Set<Room> getRooms() {
        return rooms;
    }

    public void setRooms(Set<Room> rooms) {
        this.rooms = rooms;
    }

    public Set<Prize> getPrizes() {
        return prizes;
    }

    public void setPrizes(Set<Prize> prizes) {
        this.prizes = prizes;
    }

    public RoundStatus getStatus() {
        return status;
    }

    public void setStatus(RoundStatus status) {
        this.status = status;
    }

    /**
     * Add the room to this round and add the association
     * between that room and this round.
     *
     * @param r the room
     */
    public void addRoom(Room r) {
        r.setRound(this);
        rooms.add(r);
    }

    public void addPrize(Prize p) {
        prizes.add(p);
    }


    public Set<Prediction> getPredictions() {
        return predictions;
    }

    public void setPredictions(Set<Prediction> predictions) {
        this.predictions = predictions;
    }

        /**
     * Add the prediction to this round and add the association
     * between that prediction and this round.
     *
     * @param p the prediction
     */
    public void addPrediction(Prediction p) {
        p.setRound(this);
        predictions.add(p);
    }

    public Set getConfig() {
        return config;
    }

    public void setConfig(Set<RoundConfig> config) {
        this.config = config;
    }

    /**
     * Add a piece of configuration information to this contest
     * and make the association between that object and this contest
     *
     * @param config the config info to add
     */
    public void addConfig(RoundConfig config) {
        config.setRound(this);
        this.config.add(config);
    }


    public Map<Integer, String> getConfigMap() {
        HashMap<Integer, String> m = new HashMap<Integer, String>();
        for (RoundConfig anInfo : config) {
            m.put(anInfo.getProperty().getId(), anInfo.getValue());
        }
        return m;
    }

}

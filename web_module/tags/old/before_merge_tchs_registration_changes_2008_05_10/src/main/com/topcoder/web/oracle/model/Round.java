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
    private Set<RoundPhase> phases;


    public Round() {
        prizes = new TreeSet<Prize>();
        rooms = new HashSet<Room>();
        config = new HashSet<RoundConfig>();
        predictions = new HashSet<Prediction>();
        phases = new HashSet<RoundPhase>();
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

    public Set getConfig() {
        return config;
    }

    public void setConfig(Set<RoundConfig> config) {
        this.config = config;
    }

    /**
     * Add a piece of configuration information to this round
     * and make the association between that object and this round
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

    public RoundConfig getConfig(Integer propertyId) {
        for (RoundConfig r : config) {
            if (r.getProperty().getId().equals(propertyId)) {
                return r;
            }
        }
        return null;
    }


    public Set<RoundPhase> getPhases() {
        return phases;
    }

    public void setPhases(Set<RoundPhase> phases) {
        this.phases = phases;
    }

    /**
     * Add a phase to this round
     * and make the association between that object and this round
     *
     * @param phase the phase to add
     */
    public void addPhase(RoundPhase phase) {
        phase.setRound(this);
        phases.add(phase);
    }

    public Map<Integer, RoundPhase> getPhaseMap() {
        HashMap<Integer, RoundPhase> ret = new HashMap<Integer, RoundPhase>();
        for (RoundPhase rp : phases) {
            ret.put(rp.getPhase().getId(), rp);
        }
        return ret;
    }

    public RoundPhase getPhase(Integer phaseId) {
        for (RoundPhase rp : phases) {
            if (rp.getPhase().getId().equals(phaseId)) {
                return rp;
            }
        }
        return null;
    }
}

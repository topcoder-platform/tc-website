package com.topcoder.web.oracle.model;

import com.topcoder.web.common.model.Base;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 13, 2007
 */
public class Contest extends Base {
    private Integer id;
    private String name;
    private ContestType type;
    private ContestStatus status;
    private Set<Round> rounds;
    private Set<Prize> prizes;

    public Contest() {
        rounds = new HashSet<Round>();
        prizes = new TreeSet<Prize>();
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

    public ContestType getType() {
        return type;
    }

    public void setType(ContestType type) {
        this.type = type;
    }

    public Set<Round> getRounds() {
        return rounds;
    }

    /**
     * Add a round to this contest and make the associate between that
     * round and this contest.
     *
     * @param r the round to add
     */
    public void addRound(Round r) {
        r.setContest(this);
        rounds.add(r);
    }

    public void setRounds(Set<Round> rounds) {
        this.rounds = rounds;
    }

    public ContestStatus getStatus() {
        return status;
    }

    public void setStatus(ContestStatus status) {
        this.status = status;
    }

    public Set<Prize> getPrizes() {
        return prizes;
    }

    public void setPrizes(Set<Prize> prizes) {
        this.prizes = prizes;
    }

    /**
     * Add a prize to this contest.
     *
     * @param p the prize to add
     */
    public void addPrize(Prize p) {
        prizes.add(p);
    }

}

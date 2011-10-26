package com.topcoder.utilities.dwload.contestresult;

import java.util.ArrayList;
import java.util.List;

/**
 * Class to store the result of a contest.
 * 
 * @author Cucu
 *
 */
public class ContestResult {
    private long coderId;
    private double initialPoints = 0.0;
    private double finalPoints = 0.0;
    private double taxableFinalPoints = 0.0;
    private double potentialPoints = 0.0;
    private int place = 0;
    private Double prize = null;
    
    private List<ProjectResult> results = new ArrayList<ProjectResult>(); 
        
    public List<ProjectResult> getResults() {
        return new ArrayList<ProjectResult>(results);
    }

    public void setResults(List<ProjectResult> results) {
        this.results = results;
    }

    public void addResult(ProjectResult result) {
        this.results.add(result);
    }
    
    public ContestResult(long coderId) {
        this.coderId = coderId;
    }

    public long getCoderId() {
        return coderId;
    }

    public double getFinalPoints() {
        return finalPoints;
    }

    public void setFinalPoints(double finalPoints) {
        this.finalPoints = finalPoints;
    }

    public void setTaxableFinalPoints(double taxableFinalPoints) {
        this.taxableFinalPoints = taxableFinalPoints;
    }

    public double getTaxableFinalPoints() {
        return taxableFinalPoints;
    }

    public double getInitialPoints() {
        return initialPoints;
    }

    public void setInitialPoints(double initialPoints) {
        this.initialPoints = initialPoints;
    }

    public void addPoints(double points, boolean isTaxable) {
        this.initialPoints += points;
        this.finalPoints += points;
        
        if (isTaxable) {
            this.taxableFinalPoints += points;
        }
    }
    
    public void discountPoints(double points) {
        this.finalPoints -= points;
    }

    public double getPotentialPoints() {
        return potentialPoints;
    }

    public void setPotentialPoints(double potentialPoints) {
        this.potentialPoints = potentialPoints;
    }
    
    public void addPotentialPoints(double points) {
        this.potentialPoints += points;
    }

    public int getPlace() {
        return place;
    }

    public void setPlace(int place) {
        this.place = place;
    }

    public Double getPrize() {
        return prize;
    }

    public void setPrize(Double prize) {
        this.prize = prize;
    }
}

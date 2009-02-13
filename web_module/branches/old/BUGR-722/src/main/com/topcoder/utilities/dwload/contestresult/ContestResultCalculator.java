package com.topcoder.utilities.dwload.contestresult;

import java.util.List;

/**
 * Interface for classes that calculate contest points and prizes based on project results. 
 * 
 * @author Cucu
 *
 */
public interface ContestResultCalculator {
    List<ContestResult> calculateResults(List<ProjectResult> pr, List<Double> prizesAmount);
    
    double calculatePointsAwarded(ProjectResult pr);
    
    double calculatePotentialPoints(ProjectResult pr);

}

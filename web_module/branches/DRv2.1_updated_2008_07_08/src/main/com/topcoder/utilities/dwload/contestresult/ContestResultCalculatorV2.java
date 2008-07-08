package com.topcoder.utilities.dwload.contestresult;

import java.util.List;

/**
 * Interface for classes that calculate contest points and prizes based on project results. 
 * 
 * @author Cucu
 *
 */
public interface ContestResultCalculatorV2 {
    List<ContestResult> calculateResults(List<ContestResult> cr);
    
    double calculatePointsAwarded(ProjectResult pr);
    
    double calculatePotentialPoints(ProjectResult pr);

}

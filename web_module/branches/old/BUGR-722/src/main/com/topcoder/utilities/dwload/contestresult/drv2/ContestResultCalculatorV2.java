package com.topcoder.utilities.dwload.contestresult.drv2;

import java.util.List;

import com.topcoder.utilities.dwload.contestresult.ContestResult;
import com.topcoder.utilities.dwload.contestresult.ProjectResult;

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

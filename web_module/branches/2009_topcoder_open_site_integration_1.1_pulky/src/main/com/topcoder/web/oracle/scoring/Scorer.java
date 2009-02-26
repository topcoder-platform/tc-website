package com.topcoder.web.oracle.scoring;

import com.topcoder.web.oracle.model.Prediction;
import com.topcoder.web.oracle.model.Round;

import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 27, 2007
 */
public interface Scorer {
    Set<Prediction> generateScores(Round round) throws GeneralScoringException;
}

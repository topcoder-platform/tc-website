package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.model.Prediction;
import com.topcoder.web.oracle.model.Round;
import com.topcoder.web.common.model.User;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 23, 2007
 */
public interface PredictionDAO {

    Prediction find(Integer id);

    void saveOrUpdate(Prediction prediction);

    boolean alreadCompeted(User u, Round r);

    boolean alreadyCompeted(Long userId, Integer roundId);

    List<Prediction> getPredictions(Integer roundId);

    List<Prediction> getPredictions(Round r);

}

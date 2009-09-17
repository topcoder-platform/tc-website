package com.topcoder.web.oracle.dao;

import com.topcoder.web.common.model.User;
import com.topcoder.web.oracle.model.Prediction;
import com.topcoder.web.oracle.model.Room;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 23, 2007
 */
public interface PredictionDAO {

    Prediction find(Integer id);

    void saveOrUpdate(Prediction prediction);

    boolean alreadCompeted(User u, Room r);

    boolean alreadyCompeted(Long userId, Integer roomId);

    List<Prediction> getPredictions(Long userId, Integer roomId);

    List<Prediction> getPredictions(User u, Room r);

}

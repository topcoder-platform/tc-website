/*
 * EvaluationManager.java
 *
 * Copyright � 2002, TopCoder, Inc. All rights reserved
 *
 */
package com.topcoder.apps.review.document;

import com.topcoder.apps.review.persistence.Common;
import com.topcoder.util.cache.refreshable.RefreshException;
import com.topcoder.util.cache.refreshable.Refreshable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


/**
 * Provides access to the read-only Evaluation objects.
 *
 * @author TCSDeveloper
 */
public class EvaluationManager implements Refreshable {
    public static final long ID_TYPE_SUBJECTIVE = 1;
    public static final long ID_TYPE_OBJECTIVE = 2;
    public static final long ID_TYPE_SUBJECTIVE_YESNO = 3;

    private Map evaluationMap = new HashMap();
    private Evaluation[] subjectiveEvaluationArr = null;
    private Evaluation[] subjectiveEvaluationYesNoArr = null;
    private Evaluation[] objectiveEvaluationArr = null;

    /**
     * DOCUMENT ME!
     *
     * @return Evaluation[]
     */
    public Evaluation[] getSubjectiveEvaluations(int answerType) {
        if (answerType == SubjectiveScorecardQuestion.ANSWER_1234)
            return subjectiveEvaluationArr;
        else if (answerType == SubjectiveScorecardQuestion.ANSWER_YESNO)
            return subjectiveEvaluationYesNoArr;
        return new Evaluation[0];

    }

    /**
     * DOCUMENT ME!
     *
     * @return Evaluation[]
     */
    public Evaluation[] getObjectiveEvaluations() {
        return objectiveEvaluationArr;
    }

    /**
     * DOCUMENT ME!
     *
     * @param id
     *
     * @return Evaluation
     */
    public Evaluation getEvaluation(long id) {
        return (Evaluation) evaluationMap.get(new Long(id));
    }

    /* (non-Javadoc)
     * @see com.topcoder.util.cache.refreshable.Refreshable#refresh()
     */
    public void refresh() throws RefreshException {
        Map newMap = new HashMap();

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = Common.getDataSource().getConnection();

            ps = conn.prepareStatement(
                    "SELECT e.evaluation_id, e.evaluation_name, " +
                    "e.value, e.evaluation_type_id " +
                    "FROM evaluation e " +
                    "ORDER BY e.evaluation_id");
            rs = ps.executeQuery();

            List subjList = new LinkedList();
            List subjYesNoList = new LinkedList();
            List objList = new LinkedList();
            while (rs.next()) {
                long id = rs.getLong(1);
                String name = rs.getString(2);
                double value = rs.getDouble(3);
                long evalType = rs.getLong(4);

                Evaluation evaluation = new Evaluation(id, name, value);
                newMap.put(new Long(id), evaluation);
                if (evalType == ID_TYPE_SUBJECTIVE) {
                    subjList.add(evaluation);
                } else if (evalType == ID_TYPE_OBJECTIVE) {
                    objList.add(evaluation);
                } else if (evalType == ID_TYPE_SUBJECTIVE_YESNO) {
                    subjYesNoList.add(evaluation);
                }
            }
            subjectiveEvaluationArr = (Evaluation[]) subjList.toArray(new Evaluation[subjList.size()]);
            subjectiveEvaluationYesNoArr = (Evaluation[]) subjYesNoList.toArray(new Evaluation[subjYesNoList.size()]);
            objectiveEvaluationArr = (Evaluation[]) objList.toArray(new Evaluation[objList.size()]);
        } catch (SQLException e) {
            throw new RefreshException(e);
        } finally {
            Common.close(conn, ps, rs);
        }

        evaluationMap = newMap;
    }
    // end getEvaluation
}

// end EvaluationManager

/*
 * CoderSkillBean.java
 *
 * Created on October 8, 2004, 2:23 PM
 */

package com.topcoder.web.ejb.coderskill;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.BaseEJB;

import javax.ejb.EJBException;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author  rfairfax
 */
public class CoderSkillBean extends BaseEJB {

    private final static Logger log = Logger.getLogger(CoderSkillBean.class);

    public void createCoderSkill(long coderId, int skillId, int ranking, String dataSource) {
        int ret = insert("coder_skill",
                new String[]{"coder_id", "skill_id", "ranking"},
                new String[]{String.valueOf(coderId), String.valueOf(skillId), String.valueOf(ranking)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows inserted into " +
                    "'coder_skill'. Inserted " + ret + ", " +
                    "should have inserted 1."));
        }
    }

    public void bulkCreateCoderSkill(long coderId, int[] skillId, int[] ranking, String dataSource) {
        if (skillId.length != ranking.length)
            throw new IllegalArgumentException("All arrays must have the same length");

        for (int i = 0; i < skillId.length; i++) {
            createCoderSkill(coderId, skillId[i], ranking[i], dataSource);
        }
    }

    public void removeCoderSkill(long coderId, int skillId, String dataSource) {
        int ret = delete("coder_skill",
                new String[]{"coder_id", "skill_id"},
                new String[]{String.valueOf(coderId), String.valueOf(skillId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows deleted from " +
                    "'coder_skill'. Deleted " + ret + ", " +
                    "should have deleted 1."));
        }
    }

    public void bulkRemoveCoderSkill(long coderId, int[] skillId, String dataSource) {
        for (int i = 0; i < skillId.length; i++) {
            removeCoderSkill(coderId, skillId[i], dataSource);
        }
    }

    public void setRanking(long coderId, int skillId, int ranking, String dataSource) {
        int ret = update("coder_skill",
                new String[]{"ranking"},
                new String[]{String.valueOf(ranking)},
                new String[]{"coder_id", "skill_id"},
                new String[]{String.valueOf(coderId), String.valueOf(skillId)},
                dataSource);
        if (ret != 1) {
            throw(new EJBException("Wrong number of rows updated in " +
                    "'coder_skill'. Updated " + ret + ", " +
                    "should have updated 1."));
        }
    }

    public void bulkSetRanking(long coderId, int[] skillId, int[] ranking, String dataSource) {
        if (skillId.length != ranking.length)
            throw new IllegalArgumentException("All arrays must have the same length");

        for (int i = 0; i < skillId.length; i++) {
            setRanking(coderId, skillId[i], ranking[i], dataSource);
        }
    }

    private static final String GET_SKILLS_BY_GROUP = "SELECT * FROM " +
            "coder_skill cs, skill s, skill_type st " +
            "where s.skill_id = cs.skill_id and " +
            "s.skill_type_id = st.skill_type_id and " +
            "st.skill_type_id = ? and " +
            "cs.coder_id = ? ";

    public ResultSetContainer getSkillsByType(long coderId, int skillTypeId, String dataSource) {
        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        ResultSet rs = null;
        try {

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(GET_SKILLS_BY_GROUP);
            ps.setInt(1, skillTypeId);
            ps.setLong(2, coderId);

            rs = ps.executeQuery();
            return new ResultSetContainer(rs);

        } catch (SQLException e) {
            DBMS.printSqlException(true, e);
            throw new EJBException(e.getMessage());
        } catch (Exception e) {
            throw new EJBException(e.getMessage());
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
    }
}

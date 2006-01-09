package com.topcoder.web.ejb.coder;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

import javax.naming.InitialContext;
import javax.ejb.EJBException;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;


/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 6, 2005
 */
public class CoderImageBean extends BaseEJB {

    public void createCoderImage(long coderId, long imageId, boolean display, String dataSource) {
            insert("coder_image_xref",
                    new String[]{"coder_id", "image_id", "display_flag"},
                    new String[]{String.valueOf(coderId), String.valueOf(imageId), display?"1":"0"},
                    dataSource);
    }

    public void setDisplayFlag(long coderId, long imageId, boolean display, String dataSource) {
        update("coder_image_xref", new String[]{"display_flag"},
                new String[]{display?"1":"0"},
                new String[]{"coder_id", "image_id"},
                new String[]{String.valueOf(coderId), String.valueOf(imageId)},
                dataSource);
    }

    public boolean display(long coderId, long imageId, String dataSource) {
        try {
            Integer ret = selectInt("coder_image_xref", "display_flag", new String[]{"coder_id", "image_id"},
                    new String[]{String.valueOf(coderId), String.valueOf(imageId)}, dataSource);
            return ret.intValue()==1;
        } catch (RowNotFoundException e) {
            return false;
        }
    }

    private final String IMAGES = "select i.image_id " +
                                       ", i.file_name " +
                                       ", i.image_type_id " +
                                       ", i.link " +
                                       ", i.height " +
                                       ", i.width " +
                                       ", i.modify_date " +
                                    "from coder_image_xref x " +
                                       ", image i " +
                                   "where i.image_id = x.image_id " +
                                     "and x.coder_id = ? " +
                                     "and i.image_type_id = ?";

    public ResultSetContainer getImages(long coderId, int imageTypeId, String dataSource) {
        Connection conn = null;
        PreparedStatement ps = null;
        InitialContext ctx = null;
        ResultSet rs = null;
        try {

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(IMAGES);
            ps.setLong(1, coderId);
            ps.setInt(2, imageTypeId);
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

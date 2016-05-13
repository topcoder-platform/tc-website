/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */

package com.topcoder.apps.review.rboard;

import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.text.SimpleDateFormat;
import java.text.FieldPosition;

import javax.ejb.CreateException;
import javax.ejb.EJBException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.util.idgenerator.bean.IdGen;
import com.topcoder.util.idgenerator.bean.IdGenHome;
import com.topcoder.web.common.RowNotFoundException;
import com.topcoder.web.common.model.SoftwareComponent;

import com.topcoder.shared.util.logging.Logger;

/**
 * Implementation of the RBoardPayment EJB.
 *
 * Simple EJB for rboard_payment table.
 *
 * @author pulky
 * @version 1.0.0
 */
public class RBoardPaymentBean extends BaseEJB {

    private static Logger log = Logger.getLogger(RBoardPaymentBean.class);

    public ResultSetContainer getPayments(long projectId, long phaseId, String dataSource) throws RemoteException {
        Connection conn = null;

        try {
            conn = DBMS.getConnection(dataSource);

            return selectSet("rboard_payment",
                    new String[] {"primary_ind", "amount"},
                    new String[] {"project_id", "phase_id"},
                    new String[] {String.valueOf(projectId), String.valueOf(phaseId)},
                    conn);

        } catch (SQLException sqle) {
            DBMS.printSqlException(true, sqle);
            throw new EJBException(sqle);
        } catch (Exception e) {
            throw new EJBException(e);
        } finally {
            close(conn);
        }
    }
}

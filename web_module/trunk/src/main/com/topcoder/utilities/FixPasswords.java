package com.topcoder.utilities;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.QueryDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.QueryRequest;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.web.common.BaseProcessor;

import javax.naming.Context;
import java.util.Iterator;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Feb 25, 2005
 */
public class FixPasswords {

    public static void main(String[] args) {
        FixPasswords p = new FixPasswords();


        try {
            p.doIt();
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use Options | File Templates.
        }

    }

    public void doIt() throws Exception {

        Context context = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
            ApplicationServer.SECURITY_PROVIDER_URL);
    try {
        String s = "select su.password, u.user_id from user u, security_user su where u.user_id =su.login_id";
        String t = "update user set password = ?  where user_id = ?";


        DataAccessInt dai = new QueryDataAccess(DBMS.OLTP_DATASOURCE_NAME);
        QueryRequest qr = new QueryRequest();
        qr.addQuery("all", s);
        ResultSetContainer rsc = (ResultSetContainer)dai.getData(qr).get("all");

        PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) context.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemote pmr = pmrh.create();
        ResultSetContainer.ResultSetRow row = null;
        Connection conn = null;
        PreparedStatement ps =null;
        try {
            conn = DBMS.getConnection();
            ps = conn.prepareStatement(t);
            int count = 0;
            for (Iterator it = rsc.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow)it.next();
                String pass = pmr.getPassword(row.getLongItem("user_id"));
                ps.setString(1, pass);
                ps.setLong(2, row.getLongItem("user_id"));
                count += ps.executeUpdate();
                if (count%25==0) System.out.println(""+count + " records updated");
            }
        } finally {
            try {ps.close();} catch (Exception e) {};
            try {conn.close();} catch (Exception e) {};
        }
    } catch (Exception e) {
        throw e;
    }
    }

}

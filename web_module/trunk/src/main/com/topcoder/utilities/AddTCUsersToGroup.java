package com.topcoder.utilities;

import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.TCSubject;

import javax.naming.Context;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 21, 2006
 */
public class AddTCUsersToGroup {

private static Logger log = Logger.getLogger(AddTCUsersToGroup.class);

    public static void main(String[] args) {
        try {
            addGroup(getUserIds());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    private static List getUserIds() throws Exception {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;


        try {
            conn = DBMS.getDirectConnection();
            ps = conn.prepareStatement("select coder_id from coder");
            rs =  ps.executeQuery();

            ArrayList ret = new ArrayList(100000);
            while(rs.next()) {
                ret.add(new Long(rs.getLong("coder_id")));
            }
            return ret;
        } finally {
            DBMS.close(rs);
            DBMS.close(ps);
            DBMS.close(conn);
        }
    }


    private static String addGroup(List users) throws Exception {

        Context context = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                ApplicationServer.SECURITY_PROVIDER_URL);
        try {


            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) context.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            GroupPrincipal g = pmr.getGroup(10);
            TCSubject gp = new TCSubject(132456);
            for (Iterator it = users.iterator(); it.hasNext();) {
                long userId = ((Long)it.next()).longValue();
                log.info("add " + userId + " to group");
                pmr.addUserToGroup(g, new UserPrincipal("", userId), gp);
            }

        } catch (Exception e) {
            throw e;
        }
    }

}

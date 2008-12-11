package com.topcoder.utilities;

import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.Context;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * @author dok
 * @version $Revision: 45976 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 21, 2006
 */
public class AddTCUsersToGroup {

private static Logger log = Logger.getLogger(AddTCUsersToGroup.class);

    public static void main(String[] args) {
        try {
            addGroup();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void addGroup() throws Exception {

        Context context = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                ApplicationServer.SECURITY_PROVIDER_URL);
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {


            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) context.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            GroupPrincipal g = pmr.getGroup(10);
            TCSubject gp = new TCSubject(132456);
            conn = DBMS.getDirectConnection();
            ps = conn.prepareStatement("select c.coder_id from coder c, security_user u where u.login_id = c.coder_id and not exists (select '1' from user_group_xref where group_id = 10 and login_id = c.coder_id)");
            rs =  ps.executeQuery();

            while(rs.next()) {
                long userId = rs.getLong("coder_id");
                log.info("add " + userId + " to group");
                pmr.addUserToGroup(g, new UserPrincipal("", userId), gp);
            }

        } finally {
            DBMS.close(rs);
            DBMS.close(ps);
            DBMS.close(conn);
        }
    }

}

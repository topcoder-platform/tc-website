package com.topcoder.utilities;

import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.utilities.cheaterChecker.Contest;

import javax.naming.Context;

/**
 * @author dok
 * Date: Feb 17, 2004
 */
public class PasswordSetter {

    private static Logger log = Logger.getLogger(PasswordSetter.class);

    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("SYNTAX: java " + Contest.class.getName() + "<handle> <password>");
            return;
        }
        String handle = args[0];
        String password = args[1];
        try {
            setPassword(handle, password);
            System.out.println(handle + "'s password set to " + password);
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
        return;


    }


    private static void setPassword(String handle, String password) throws Exception {

        Context context = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                ApplicationServer.SECURITY_PROVIDER_URL);
        try {

            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) context.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            UserPrincipal p = pmr.getUser(handle);
            pmr.editPassword(p, password, new TCSubject(132456));

        } catch (Exception e) {
            throw e;
        }
    }

}


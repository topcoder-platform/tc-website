package com.topcoder.utilities;

import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.utilities.cheaterChecker.Contest;

import javax.naming.Context;

public class PasswordGetter {

    private static Logger log = Logger.getLogger(PasswordGetter.class);

    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("SYNTAX: java " + Contest.class.getName() + "<handle>");
            return;
        }
        String handle = args[0];
        try {
            System.out.println(handle + " -> " + getPassword(handle));
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
        return;


    }


    private static String getPassword(String handle) throws Exception {

        Context context = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                ApplicationServer.SECURITY_PROVIDER_URL);
        try {

            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) context.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            UserPrincipal p = pmr.getUser(handle);
            return pmr.getPassword(p.getId());

        } catch (Exception e) {
            throw e;
        }
    }

}

package com.topcoder.common.web.util;

import com.topcoder.common.web.error.TCException;
import com.topcoder.ejb.Util.Util;
import com.topcoder.ejb.Util.UtilHome;
import com.topcoder.shared.util.TCContext;

import javax.naming.Context;


public final class HitCount {


    public static final void incrementAdvertiser(int advertiserId)
            throws TCException {
        Context ctx = null;
        try {
            ctx = TCContext.getInitial();
            UtilHome home = (UtilHome) ctx.lookup("jma.UtilHome");
            Util util = home.create();
            util.incrementAdvertiserHitCount(advertiserId);
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException("common.web.util.HitCount:incrementAdvertiserHitCount: Error " + e);
        } finally {
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


    public static final void incrementPressRelease(int id, String host)
            throws TCException {
        Context ctx = null;
        try {
            ctx = TCContext.getInitial();
            UtilHome home = (UtilHome) ctx.lookup("jma.UtilHome");
            Util util = home.create();
            util.incrementPressReleaseHitCount(id, host);
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException("common.web.util.HitCount:incrementPressReleaseHitCount: Error " + e);
        } finally {
            if (ctx != null) {
                try {
                    ctx.close();
                } catch (Exception ignore) {
                }
            }
        }
    }


}

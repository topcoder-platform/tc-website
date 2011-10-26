package com.topcoder.web.tc.controller.request;

import com.topcoder.ejb.Util.Util;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;

import javax.naming.InitialContext;

/**
 * @author dok
 * @version $Revision: 58289 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 21, 2006
 */
public class LinkTracking extends BaseProcessor {
    protected void businessProcessing() throws Exception {
        String refer;
        String link;
        InitialContext ctx = null;
        try {
            link = StringUtils.checkNull((String) getRequest().getAttribute("link"));
            if ("".equals(link)) {
                link = StringUtils.checkNull(getRequest().getParameter("link"));
            }
            refer = StringUtils.checkNull((String) getRequest().getAttribute("refer"));
            if ("".equals(refer)) {
                refer = StringUtils.checkNull(getRequest().getParameter("refer"));
            }
            String ip = getRequest().getRemoteHost();
            if (
                    !(
                            ip.equals("65.112.118.193")
                                    || ip.equals("65.112.118.193")
                                    || ip.equals("65.112.118.194")
                                    || ip.equals("65.112.118.195")
                                    || ip.equals("65.112.118.196")
                                    || ip.equals("65.112.118.197")
                                    || ip.equals("65.112.118.210")
                    )
                    ) {
                ctx = new javax.naming.InitialContext();
                Util util = (Util) BaseProcessor.createEJB(ctx, Util.class);
                util.incrementSponsorHitCount(link, refer);
            }
            log.debug(link);
            setNextPage(link);
            setIsNextPageInContext(false);
        } catch (Exception e) {
            throw new NavigationException(e);
        } finally {
            TCContext.close(ctx);
        }
    }
}

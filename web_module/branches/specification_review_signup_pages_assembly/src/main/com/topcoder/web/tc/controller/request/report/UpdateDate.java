package com.topcoder.web.tc.controller.request.report;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import java.util.StringTokenizer;
import java.util.NoSuchElementException;
import java.util.GregorianCalendar;

public class UpdateDate extends Base {

    protected void businessProcessing() throws TCWebException {
        String userId = getRequest().getParameter(Constants.USER_ID);
        String date = getRequest().getParameter(Constants.CONTACT_TEXT);

        if (!((SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY)).isAdmin())
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        if (StringUtils.checkNull(userId).equals("")) {
            throw new NavigationException("Request missing user id");
        }

        try {
            long time = -1;
            int m=0, d=0, y=0;
            StringTokenizer st = new StringTokenizer(date.trim(), "/");
            try{
                if(st.hasMoreTokens()){
                    m = Integer.parseInt(st.nextToken());
                    d = Integer.parseInt(st.nextToken());
                    y = Integer.parseInt(st.nextToken());
                    if(y<100)y+=2000;
                    GregorianCalendar gc = new GregorianCalendar(y,m-1,d);
                    time = gc.getTime().getTime();
                }
            }catch(NoSuchElementException nsee){
                throw new Exception("Date is not formatted properly.");
            }catch(NumberFormatException nfe){
                throw new Exception("Date is not formatted properly.");
            }
            Coder coder = (Coder) createEJB(getInitialContext(), Coder.class);
            coder.setContactDate(Long.parseLong(userId), time, DBMS.OLTP_DATASOURCE_NAME);

            SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
            String note = null;
            if(time == -1){
                note = "Contact date cleared.";
            }else{
                note = "Contact date set to "+(m<10?"0":"")+m+"/"+(d<10?"0":"")+d+"/"+y+".";
            }
            setNextPage(info.getServletPath() + "?" + Constants.MODULE_KEY + "=UpdateNote&" + Constants.NOTE_ID + "=&" + Constants.NOTE_TEXT + "=" + note + "&" + Constants.USER_ID + "=" + userId);
            setIsNextPageInContext(false);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


}

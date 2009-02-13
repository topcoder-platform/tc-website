package com.topcoder.utilities;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.ejb.company.Company;
import com.topcoder.web.ejb.user.Contact;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author dok
 * @version $Revision: 47477 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 16, 2006
 */
public class ContactCompanyCreator {

    private static Logger log = Logger.getLogger(ContactCompanyCreator.class);

    public static void main(String[] args) {
        try {
            doit(getList());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    private static void doit(List stuff) throws Exception {
        InitialContext ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                ApplicationServer.SECURITY_PROVIDER_URL);
        try {
            Contact contact = (Contact) BaseProcessor.createEJB(ctx, Contact.class);
            log.debug("got contact bean");
            Company company = (Company) BaseProcessor.createEJB(ctx, Company.class);
            thingy curr;
            for (int i = 0; i < stuff.size(); i++) {
                curr = (thingy) stuff.get(i);
                long companyId = company.createCompany();
                company.setName(companyId, curr.getCompany());
                company.setPrimaryContactId(companyId, curr.getUserId());
                contact.createContact(companyId, curr.getUserId(), DBMS.OLTP_DATASOURCE_NAME);
                contact.setTitle(curr.getUserId(), curr.getTitle(), DBMS.OLTP_DATASOURCE_NAME);
                if (i % 25 == 0) {
                    log.debug(i + " done so far");
                }
            }
        } finally {
            try {
                ctx.close();
            } catch (Exception e) {
            }
            ;

        }


    }

    private final static String select =
            "select u.user_id\n" +
                    "     , (select demographic_answer_text from demographic_answer da, demographic_response dr where dr.demographic_answer_id = da.demographic_answer_id and dr.demographic_question_id = 8 and dr.user_id = u.user_id) as title\n" +
                    "     , (select demographic_response from demographic_response dr where dr.demographic_question_id = 15 and dr.user_id = u.user_id) as company\n" +
                    "  from user u\n" +
                    " where u.user_id in (select user_id from demographic_response where demographic_question_id = 8 and demographic_answer_id is not null)\n" +
                    "   and u.user_id in (select user_id from demographic_response where demographic_question_id = 15 and trim(demographic_response)!='')" +
                    " and not exists (select 1 from contact where contact_id = user_id)";

    private static List getList() throws NamingException, SQLException {

        log.debug("in get list");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList ret = new ArrayList(40000);
        try {
            conn = DBMS.getDirectConnection();
            log.debug("got connection");
            ps = conn.prepareStatement(select);
            rs = ps.executeQuery();
            int i = 0;
            while (rs.next()) {
                ret.add(new thingy(rs.getLong("user_id"), rs.getString("title"), rs.getString("company")));
                i++;
                if (i % 25 == 0) {
                    log.debug("loaded " + i);
                }
            }

        } finally {
            try {
                rs.close();
            } catch (Exception e) {
            }
            ;
            try {
                ps.close();
            } catch (Exception e) {
            }
            ;
            try {
                conn.close();
            } catch (Exception e) {
            }
            ;
        }
        return ret;
    }

    private static class thingy {
        private long userId;
        private String title;
        private String company;

        thingy(long userId, String title, String company) {
            this.userId = userId;
            this.title = title;
            this.company = company;
        }

        public long getUserId() {
            return userId;
        }

        public void setUserId(long userId) {
            this.userId = userId;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public String getCompany() {
            return company;
        }

        public void setCompany(String company) {
            this.company = company;
        }
    }

}

package com.topcoder.web.common.tag;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;

import javax.naming.NamingException;
import javax.servlet.jsp.JspException;
import java.sql.SQLException;
import java.util.*;

/**
 * My comments/description/notes go here
 * @deprecated
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class QueryIteratorTag extends IteratorTag {
    private String command = null;
    private ResultSetContainer rsc = null;
    private Hashtable params;

    /**
     *
     * @see javax.servlet.jsp.tagext.Tag#doStartTag()
     */
    public int doStartTag() throws JspException {
        try {
            DataAccessInt dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Request dataRequest = new Request();
            dataRequest.setContentHandle(command);

            if (params != null) {
                Enumeration e = params.keys();
                while (e.hasMoreElements()) {
                    Object key = e.nextElement();
                    dataRequest.setProperty(
                            (String) key,
                            (String) params.get(key)
                    );
                }
            }

            Map result = dai.getData(dataRequest);
            // for now will take first of queries results
            Iterator i = result.keySet().iterator();
            if (i.hasNext()) {
                rsc = (ResultSetContainer) result.get(i.next());
            } else {
                rsc = null;
            }
            setCollection(rsc);
        } catch (NamingException ne) {
            ne.printStackTrace();
            throw new JspException("NamingException occured: " + ne.getMessage());
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            throw new JspException("SQLException occured: " + sqle.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            throw new JspException("Exception occured: " + e.getMessage());
        }
        return super.doStartTag();
    }

    /**
     * Sets the query name.
     *
     * @param cmd The query to set
     */
    public void setCommand(String cmd) {
        command = cmd;
    }

    /**
     * Sets the query parameters. Format is: 'name:value, name:value, ...'.
     *
     * @param param The params to set
     */
    public void setParam(String param) {
        params = new Hashtable();
        StringTokenizer st = new StringTokenizer(param, " ,");
        while (st.hasMoreTokens()) {
            StringTokenizer st2 = new StringTokenizer(st.nextToken(), ":");
            if (st2.countTokens() != 2) continue;
            params.put(st2.nextToken(), st2.nextToken());
        }
    }

    /**
     * Just in case the app server is caching tag (jboss!!!)
     * we have to clear out all the instance variables at the
     * end of execution
     */
    public int doEndTag() throws JspException {
        this.command = null;
        this.rsc = null;
        this.params = null;
        return super.doEndTag();
    }
}

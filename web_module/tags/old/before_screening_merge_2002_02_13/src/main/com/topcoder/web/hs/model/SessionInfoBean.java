package com.topcoder.web.hs.model;

import java.io.*;
import java.util.*;
import com.topcoder.shared.security.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.util.*;
import com.topcoder.common.web.util.Data;
import com.topcoder.shared.util.logging.Logger;

/**
 * Holds some details about the current user for the benefit of curious JSPs.
 */
public class SessionInfoBean implements Serializable {

    private static Logger log = Logger.getLogger(SessionInfoBean.class);

    private String handle = null;
    private int userid = -1;  //@@@ should be long
    private int schoolid = -1;  //@@@ should be long
    /** group may be:
     * 'G' guest
     * 'S' student
     * 'C' coach
     * 'A' admin
     */
    private char group = 'G';
    private int rating = 0;

    public SessionInfoBean() { }

    public String getHandle() { return handle; }
    public void   setHandle(String handle) { this.handle = handle; }
    public int    getUserId() { return userid; }
    public void   setUserId(int userid) { this.userid = userid; }
    public int    getSchoolId() { return schoolid; }
    public void   setSchoolId(int schoolid) { this.schoolid = schoolid; }
    public char   getGroup() { return group; }
    public void   setGroup(char group) {
        if(0>"GSCA".indexOf(group))
            throw new IllegalArgumentException("no group class '"+group+"'");
        this.group = group;
    }
    public int    getRating() { return rating; }
    public void   setRating(int rating) { this.rating = rating; }

    public boolean isLoggedIn() { return group != 'G'; }
    public boolean isGuest()    { return group == 'G'; }
    public boolean isStudent()  { return group == 'S'; }
    public boolean isCoach()    { return group == 'C'; }
    public boolean isAdmin()    { return group == 'A'; }

    /**
     * This method has all the smarts.  It takes a User object and a
     * Set of Strings listing groups to which the user belongs, and
     * populates all the properties of this bean sensibly from them.
     * For coaches and students, it also uses a database query to get
     * rating and school id.
     */
    public void setAll(User user, Set groups) {

        setUserId((int)user.getId());
        setHandle(user.getUserName());

        if(groups.contains("Admin")) setGroup('A');
        else if(groups.contains("Student")) setGroup('S');
        else if(groups.contains("Coach")) setGroup('C');
        else {
            setGroup('G');
            setHandle("");  // anonymous looks nameless to the jsps
        }

        setSchoolId(-1);
        setRating(0);

        if(isGuest() || isAdmin()) return;

        try {
            Data.initializeDataTypes();

            Map qm = new TreeMap();
            qm.put("cr", ""+userid);
            qm.put(DataAccessConstants.COMMAND, "SessionInfoBean");
            Request dataRequest = new Request(qm);
            DataAccessInt dai = new CachedDataAccess((javax.sql.DataSource)TCContext.getInitial().lookup(DBMS.OLTP_DATASOURCE_NAME));

            Map res = dai.getData(dataRequest);
            ResultSetContainer rsc = (ResultSetContainer)res.get("user_to_school_and_rating");
            ResultSetContainer.ResultSetRow rr = rsc.getRow(0);

            setSchoolId(Integer.parseInt(rr.getItem("school_id").toString()));
            setRating(Integer.parseInt(rr.getItem("rating").toString()));

        } catch(Exception e) {
            log.error("caught exception from database queries, some values left at defaults", e);
        }
    }
}

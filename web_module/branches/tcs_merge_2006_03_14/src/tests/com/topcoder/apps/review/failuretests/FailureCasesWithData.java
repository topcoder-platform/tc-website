package com.topcoder.apps.review.failuretests;

import com.topcoder.apps.review.document.*;
import com.topcoder.apps.review.projecttracker.*;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import org.apache.cactus.ServletTestCase;

import java.rmi.*;

import java.sql.*;
import java.util.*;

import javax.naming.*;

import javax.rmi.PortableRemoteObject;

import javax.sql.*;

public class FailureCasesWithData extends FailureTestsBase {
    protected DataSource dataSource;

    public FailureCasesWithData(String name) {
        super(name);
    }


    final long baseid = -1000000;

    final String baseuserid = "ORPFailureUser";
    final java.sql.Date startDate = new java.sql.Date(new java.util.Date().getTime() - 1000L);
    final java.sql.Date endDate = new java.sql.Date(new java.util.Date().getTime() + 1000000000L);
    PreparedStatement psUserRole, psPaymentInfo;

    User[] users;
    Project[] projects;

    long objcount = 0;

    protected long ident() {
        return baseid - (objcount++);
    }

    Connection conn = null;

    public void setUp() throws Exception {
        super.setUp();


        PreparedStatement ps = null;
        ResultSet rs = null;

        dataSource = (DataSource) ctx.lookup("java:/InformixDS");

        conn = dataSource.getConnection();
        psUserRole = conn.prepareStatement("INSERT INTO r_user_role " +
                "(r_user_role_v_id,r_user_role_id,r_role_id,project_id,login_id,payment_info_id,modify_user,cur_version)" +
                " VALUES (?,?,?,?,?,?,?,?)");

        psPaymentInfo = conn.prepareStatement("INSERT INTO payment_info " +
                "(payment_info_v_id, payment_info_id, payment, payment_stat_id, modify_user, cur_version) " +
                " VALUES (?,?,?,?,?,?)");


//			describe(conn,"security_user");
//describe(conn, "project_type");
//describe(conn,"r_user_role");
//describe(conn,"payment_info");

        deleteRows();
        List tmpusers = new LinkedList();

        for (int i = 0; i < arrRole.length; i++) { // 7 roles
            for (int j = 0; j < arrRevResp.length; j++) { // 3 reviewer responsibilities
                String name = arrRole[i].getName() + "_" + arrRevResp[j];
                tmpusers.add(new User(ident(), name + "_handle", name + "_first", name + "_last", "foo+" + name + "@foo.cx"));
            }
        }
        tmpusers.add(new User(ident(), "nobody_handle", "nobody_first", "nobody_last", "foo+nobody@foo.cx"));
        users = (User[]) tmpusers.toArray(new User[0]);

        int uidx = 0;
        List tmpprojects = new LinkedList();
        for (int p = 0; p < arrPhase.length; p++) {
            for (int q = 0; q < arrProjType.length; q++) {
                List listUserRoles = new ArrayList();
                for (int i = 0; i < arrRole.length; i++) { // 7 roles
                    Role r = arrRole[i];
                    for (int j = 0; j < arrRevResp.length; j++) { // 3 reviewer responsibilities
                        User u = users[uidx++ % users.length];
                        UserRole ur = new UserRole(ident(), r, u,
                                new PaymentInfo(ident(), (float) 12345.67,
                                        arrPayStatus[uidx % arrPayStatus.length],
                                        ident()),
                                arrRevResp[j],
                                ident());
                        listUserRoles.add(ur);
                    }
                }

                PhaseInstance pi = new PhaseInstance(ident(), arrPhase[p], startDate, endDate, ident());

                tmpprojects.add(new Project(ident(), 1,
                        1,
                        "projectname" + p,
                        "version 1.0",
                        null,
                        null, // winner
                        new PhaseInstance[]{pi}, //PhaseInstance[] timeline,
                        pi, //PhaseInstance currentPhase,
                        (UserRole[]) listUserRoles.toArray(new UserRole[0]), //UserRole[] userRole,
                        "some notes", //java.lang.String notes,
                        "an overview", //java.lang.String overView,
                        arrProjType[q], //ProjectType projectType,
                        new ProjectStatus(ProjectStatus.ID_PENDING_START, "starting"),
                        false, // notification sent
                        -1, //long requestorId,
                        ident())); //long versionId);
            }
        }
        projects = (Project[]) tmpprojects.toArray(new Project[0]);
    }

    protected void update(Connection conn, String sql) {
        try {
            conn.createStatement().executeUpdate(sql);
        } catch (Throwable t) {
        }
    }

    protected void update(PreparedStatement sql) {
        try {
            sql.executeUpdate();
        } catch (Throwable t) {
        }
    }

    void deleteRows() {
        String[] tabs = new String[]{
            "project",
            "payment_info",
            "r_user_role",
            "subjective_resp",
            "objective_resp",
            "scorecard_question",
            "agg_response",
            "agg_worksheet",
            "testcase_review",
            "agg_review",
            "fix_item",
            "final_review"};
        for (int i = 0; i < tabs.length; i++) {
            update(conn, "DELETE FROM " + tabs[i]);
        }
    }

    public void tearDown() throws Exception {
        super.tearDown();

        PreparedStatement ps = null;
        ResultSet rs = null;


        try {
            deleteRows();
        } finally {
            try {
                if (ps != null) ps.close();
            } finally {
                if (conn != null) conn.close();
            }
        }
    }


    protected void describe(Connection conn, String table)
            throws Exception {
        describe(conn, table, null);
    }

    protected void describe(Connection conn, String table, String where)
            throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        StringBuffer msg = new StringBuffer("Table: " + table);
        try {
            ps = conn.prepareStatement("SELECT * FROM " + table + (where == null ? "" : (" WHERE " + where)));
            rs = ps.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            msg.append("---------------------------------\n");
            int max = rsmd.getColumnCount();
            for (int i = 1; i <= max; i++) {
                String name = rsmd.getColumnName(i);
                String type = rsmd.getColumnTypeName(i);
                msg.append(name + "(" + type + ")");
                if (i < max) msg.append(", ");
            }
            msg.append("\n");
            int ct = 0;
            while (rs.next() && ct++ < 10) {
                for (int i = 1; i <= max; i++) {
                    msg.append(String.valueOf(rs.getObject(i)));
                    ;
                    if (i < max) msg.append(", ");
                }
                msg.append("\n");
            }
        } finally {
            System.out.println("\n" + msg);
            try {
                if (rs != null) rs.close();
            } finally {
                if (ps != null) ps.close();
            }
        }
    }

/*
Table: payment_info---------------------------------
payment_info_v_id(serial), payment_info_id(decimal), payment(money), payment_stat_id(decimal), modify_date(datetime year to fraction(3)), modify_user(decimal), cur_v
ersion(decimal)
1, 1, 10.00, 1, 2003-07-19 19:02:14.0, 2059064, 1
2, 2, 20.00, 2, 2003-07-19 19:02:14.0, 2059064, 1
*/
    public void savePaymentInfo(final PaymentInfo pi)
            throws Exception {
        psPaymentInfo.setLong(1, 1);
        psPaymentInfo.setLong(2, pi.getId());
        psPaymentInfo.setFloat(3, pi.getPayment());
        psPaymentInfo.setLong(4, pi.getPaymentStatus().getId());
        psPaymentInfo.setLong(5, users[0].getId());
        psPaymentInfo.setLong(6, 1);
        psPaymentInfo.executeUpdate();
    }
/*
Table: r_user_role---------------------------------
r_user_role_v_id(serial), r_user_role_id(decimal), r_role_id(decimal), project_id(decimal), login_id(decimal), payment_info_id(decimal), r_resp_id(decimal), modify_d
ate(datetime year to fraction(3)), modify_user(decimal), cur_version(decimal)
1, 1, 2, 2809382, 2059064, 1, 0, 2003-07-19 19:02:15.0, 2059064, 1
2, 2, 3, 2809382, 2059064, 2, 3, 2003-07-19 19:02:15.0, 2059064, 1
*/
    public void saveUserRole(UserRole ur, Project p)
            throws Exception {
        savePaymentInfo(ur.getPaymentInfo());
        psUserRole.setLong(1, ur.getId());
        psUserRole.setLong(2, ur.getId());
        psUserRole.setLong(3, ur.getRole().getId());
        psUserRole.setLong(4, p.getId());
        psUserRole.setLong(5, ur.getUser().getId());
        psUserRole.setLong(6, ur.getPaymentInfo().getId());
        psUserRole.setLong(7, ur.getId());
        psUserRole.setLong(8, 1);
        psUserRole.executeUpdate();
    }

}
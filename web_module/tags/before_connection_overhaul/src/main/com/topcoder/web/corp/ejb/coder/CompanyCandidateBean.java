package com.topcoder.web.corp.ejb.coder;

import com.topcoder.web.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.DBMS;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.ejb.EJBException;
import java.rmi.RemoteException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 27, 2003 1:39:05 AM
 */

public class CompanyCandidateBean extends BaseEJB {

    private static Logger log = Logger.getLogger(CompanyCandidateBean.class);
    private static final String dataSourceName = "java:comp/env/datasource";

    /**
     *
     * @param companyId
     * @param candidateId
     * @throws RemoteException
     */
    public void createCompanyCandidate(long companyId, long candidateId)
        throws RemoteException {

        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("companyId: ");
        varBuf.append(companyId);
        varBuf.append(" candidateId: ");
        varBuf.append(candidateId);

        debugBuf.append("createCompanyCandidate called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());
        // begin method
        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("INSERT INTO company_candidate_xref (company_id, ");
            query.append("candidate_id) values(?,?) ");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1,companyId);
            pstmt.setLong(2,candidateId);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            DBMS.printSqlException(true,e);
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in createCompanyCandidate. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in createCompanyCandidate. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in createCompanyCandidate. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createCompanyCandidate");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createCompanyCandidate");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createCompanyCandidate");}}
        }
    }

    /**
     *
     * @param companyId
     * @param candidateId
     * @throws RemoteException
     */
    public void removeCompanyCandidate(long companyId, long candidateId)
        throws RemoteException {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("companyId: ");
        varBuf.append(companyId);
        varBuf.append(" candidateId: ");
        varBuf.append(candidateId);

        debugBuf.append("removeCompanyCandidate called. ");
        debugBuf.append(varBuf.toString());

        log.debug(debugBuf.toString());
        // begin method
        Context ctx = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        DataSource ds = null;

        try {
            StringBuffer query = new StringBuffer(120);
            query.append("DELETE from company_candidate_xref ");
            query.append("WHERE company_id = ? ");
            query.append("AND candidate_id = ?");

            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup(dataSourceName);
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(query.toString());

            pstmt.setLong(1,companyId);
            pstmt.setLong(2,candidateId);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            DBMS.printSqlException(true,e);
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in removeCompanyCandidate. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in removeCompanyCandidate. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in removeCompanyCandidate. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in removeCompanyCandidate");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in removeCompanyCandidate");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in removeCompanyCandidate");}}
        }
    }
}

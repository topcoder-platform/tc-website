package com.topcoder.web.ejb.user;

import com.topcoder.shared.ejb.BaseEJB;
import com.topcoder.shared.util.logging.Logger;

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
    public void createCompanyCandiate(long companyId, long candidateId)
        throws RemoteException {

        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("companyId: ");
        varBuf.append(companyId);
        varBuf.append(" candidateId: ");
        varBuf.append(candidateId);

        debugBuf.append("createCompanyCandiate called. ");
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
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in createCompanyCandiate. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in createCompanyCandiate. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in createCompanyCandiate. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in createCompanyCandiate");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in createCompanyCandiate");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in createCompanyCandiate");}}
        }
    }

    /**
     *
     * @param companyId
     * @param candidateId
     * @throws RemoteException
     */
    public void removeCompanyCandiate(long companyId, long candidateId)
        throws RemoteException {
        // construct debug message
        StringBuffer debugBuf = new StringBuffer(200);
        StringBuffer varBuf = new StringBuffer(200);

        varBuf.append("companyId: ");
        varBuf.append(companyId);
        varBuf.append(" candidateId: ");
        varBuf.append(candidateId);

        debugBuf.append("removeCompanyCandiate called. ");
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
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("SQLException in removeCompanyCandiate. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (NamingException e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("NamingException in removeCompanyCandiate. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } catch (Exception e) {
            StringBuffer exceptionBuf = new StringBuffer(200);
            exceptionBuf.append("Exception in removeCompanyCandiate. ");
            exceptionBuf.append(varBuf.toString());
            throw new EJBException(exceptionBuf.toString());
        } finally {
            if (pstmt != null) {try {pstmt.close();} catch (Exception ignore) {log.error("FAILED to close PreparedStatement in removeCompanyCandiate");}}
            if (conn != null) {try {conn.close();} catch (Exception ignore) {log.error("FAILED to close Connection in removeCompanyCandiate");}}
            if (ctx != null) {try {ctx.close();} catch (Exception ignore) {log.error("FAILED to close Context in removeCompanyCandiate");}}
        }
    }
}

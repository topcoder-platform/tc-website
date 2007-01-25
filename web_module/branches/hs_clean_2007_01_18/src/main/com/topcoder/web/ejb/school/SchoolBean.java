package com.topcoder.web.ejb.school;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJBException;
import javax.naming.InitialContext;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.idgenerator.IDGenerationException;
import com.topcoder.web.common.IdGeneratorClient;
import com.topcoder.web.common.model.SchoolType;
import com.topcoder.web.ejb.BaseEJB;

public class SchoolBean extends BaseEJB {
    private static final Logger log = Logger.getLogger(SchoolBean.class);

    public long createSchool(String dataSource, String idDataSource, String sortLetter, String city, String country, long userId, String name) throws EJBException {
        log.debug("create school (many fields) called...");

        long school_id = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        try {

            school_id = IdGeneratorClient.getSeqId("SCHOOL_SEQ");

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO school (school_id, sort_letter, city, country_code, user_id, name) ");
            query.append("VALUES (?, ?, ?, ?, ?, ?)");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, school_id);
            ps.setString(2, sortLetter);
            ps.setString(3, city);
            ps.setString(4, country);
            ps.setLong(5, userId);
            ps.setString(6, name);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'school'. Inserted " + rc + ", should have " +
                        "inserted 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (IDGenerationException e) {
            throw new EJBException(e);
        } finally {
            close(ps);
            close(conn);
        }
        return (school_id);
    }

    public long createSchool(String dataSource, String idDataSource) throws EJBException {
        log.debug("create school called...");

        long school_id = 0;

        Connection conn = null;
        PreparedStatement ps = null;
        try {
            school_id = IdGeneratorClient.getSeqId("SCHOOL_SEQ");

            StringBuffer query = new StringBuffer(1024);
            query.append("INSERT ");
            query.append("INTO school (school_id) ");
            query.append("VALUES (?)");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, school_id);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows inserted into " +
                        "'school'. Inserted " + rc + ", should have " +
                        "inserted 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (IDGenerationException e) {
            throw new EJBException(e);
        } finally {
            close(ps);
            close(conn);
        }
        return (school_id);
    }

    public void setSchoolDivisionCode(long schoolId,
                                      String schoolDivisionCode, String dataSource)
            throws EJBException {
        log.debug("setSchoolDivisionCode called...");

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;
        try {
            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE school ");
            query.append("SET school_division_code=? ");
            query.append("WHERE school_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, schoolDivisionCode);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'school'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void setFullName(long schoolId, String fullName, String dataSource)
            throws EJBException {
        log.debug("setFullName called...");
        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE school ");
            query.append("SET full_name=? ");
            query.append("WHERE school_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, fullName);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'school'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void setShortName(long schoolId, String shortName, String dataSource)
            throws EJBException {
        log.debug("setShortName called...");

        Connection conn = null;
        PreparedStatement ps = null;

        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("UPDATE school ");
            query.append("SET short_name=? ");
            query.append("WHERE school_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, shortName);
            ps.setLong(2, schoolId);

            int rc = ps.executeUpdate();
            if (rc != 1) {
                throw(new EJBException("Wrong number of rows updated in 'school'. " +
                        "Updated " + rc + ", should have updated 1."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(ps);
            close(conn);
            close(ctx);
        }
    }

    public void setUserId(long schoolId, long userId, String dataSource) throws EJBException {
        log.debug("setUserId called...");
        update("school",
                new String[]{"user_id"},
                new String[]{String.valueOf(userId)},
                new String[]{"school_id"},
                new String[]{String.valueOf(schoolId)},
                dataSource);
    }

    public String getSchoolDivisionCode(long schoolId, String dataSource)
            throws EJBException {
        log.debug("getSchoolDivisionCode called...");

        String schoolDivisionCode = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT school_division_code ");
            query.append("FROM school ");
            query.append("WHERE school_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, schoolId);

            rs = ps.executeQuery();
            if (rs.next()) {
                schoolDivisionCode = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'school' " +
                        "with school_id=" + schoolId + "."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (schoolDivisionCode);
    }

    public String getFullName(long schoolId, String dataSource)
            throws EJBException {
        log.debug("getFullName called...");
        String full_name = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT full_name ");
            query.append("FROM school ");
            query.append("WHERE school_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, schoolId);

            rs = ps.executeQuery();
            if (rs.next()) {
                full_name = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'school' " +
                        "with school_id=" + schoolId + "."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (full_name);
    }

    public long getSchoolId(String name, String dataSource) throws EJBException {
        long ret = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT school_id ");
            query.append("FROM school ");
            query.append("WHERE lower(name) = ?");
            query.append(" ORDER by school_id asc");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setString(1, name.toLowerCase());

            rs = ps.executeQuery();
            if (rs.next()) {
                ret = rs.getLong(1);
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return ret;
    }

    public String getShortName(long schoolId, String dataSource)
            throws EJBException {
        log.debug("getShortName called...");
        String shortName = null;

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        InitialContext ctx = null;
        try {

            StringBuffer query = new StringBuffer(1024);
            query.append("SELECT short_name ");
            query.append("FROM school ");
            query.append("WHERE school_id=?");

            conn = DBMS.getConnection(dataSource);
            ps = conn.prepareStatement(query.toString());
            ps.setLong(1, schoolId);

            rs = ps.executeQuery();
            if (rs.next()) {
                shortName = rs.getString(1);
            } else {
                throw(new EJBException("No rows found when selecting from 'school' " +
                        "with school_id=" + schoolId + "."));
            }
        } catch (SQLException _sqle) {
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(conn);
            close(ctx);
        }
        return (shortName);
    }

   
    public void mergeSchools(long idSrc, long idDest) throws EJBException {
    	log.debug("MergeSchools called ");
        Connection connOltp = null;
//        Connection connDW = null;
        PreparedStatement ps = null;
        PreparedStatement psIns = null;
        ResultSet rs = null;
        try {
        	connOltp = DBMS.getConnection(DBMS.OLTP_DATASOURCE_NAME);
        	connOltp.setAutoCommit(false);
  //      	connDW = DBMS.getConnection(DBMS.DW_DATASOURCE_NAME);

        	// get information for the destination school
        	ps = connOltp.prepareStatement("select school_type_id, name, (select team_id from team t where t.school_id = s.school_id) as team_id " +
        								   " from school s where school_id = ? ");
        	ps.setLong(1, idDest);
        	
        	rs = ps.executeQuery();
        	
            if (!rs.next()) {
            	throw new IllegalArgumentException("School with id " + idDest + " not found! ");
            }
            
            
            int destTypeId = rs.getInt("school_type_id");
            long teamId = -1;
            boolean fixDestStudents = false;
            
            if (destTypeId == SchoolType.HIGH_SCHOOL.intValue()) {

            	// If it is a high school but the team is missing
            	if (rs.getObject("team_id") == null) {
	            	log.debug("School " + idDest + " is missing the team!");
	            	
	                teamId = IdGeneratorClient.getSeqId("TEAM_SEQ");
	
	            	psIns = connOltp.prepareStatement("insert into team(team_id, team_name, team_type, school_id, modify_date) " + 
	            									  " values(?,?,4,?,current)");
	            	psIns.setLong(1, teamId);
	            	psIns.setString(2, rs.getString("name"));
	            	psIns.setLong(3, idDest);
	            	psIns.executeUpdate();
	            	psIns.close();
	            	
	            	log.debug("Created team  " + teamId);
	            	fixDestStudents = true;
	            } else {
	            	teamId = rs.getLong("team_id");
	            }
        	}
            rs.close();
            ps.close();
        	
        	log.debug("team_id=" + teamId); 
            if (teamId > 0) {
	        	// get the students for the src school and if the destination didn't have a team but needs it, from destination also.
	        	//List students = new ArrayList();
	        	
	        	StringBuffer studentsSB = new StringBuffer(100);
	        	
	        	String schoolIds = idSrc + (fixDestStudents? "," + idDest : "");
	        	ps = connOltp.prepareStatement("select coder_id from current_school where school_id in (" + schoolIds + ")");
	        	rs = ps.executeQuery();
	        	while (rs.next()) {
	        		log.debug("add student: " + rs.getLong(0));
	        	//	students.add(new Long(rs.getLong(0)));
	        		studentsSB.append(",").append(rs.getLong(0));
	        	}
	        	
	        	String students = studentsSB.substring(1);
	        	rs.close();
	        	ps.close();
	        	
				ps = connOltp.prepareStatement("update team_coder_xref set team_id = ? where coder_id in (" + students +")");
				ps.setLong(1, teamId);
	        	
				int rowCount = ps.executeUpdate();
	        	log.info("Updated " + rowCount + " rows in team_coder_xref");	        	
	        	ps.close();
	        	
	        	ps = connOltp.prepareStatement("update round_registration set team_id = ? " +
	        				" where round_id in (select round_id from round r where r.round_type_id in (17,18)) " +
	        				" and coder_id in ( " + students + ") and eligible=1 ");
				ps.setLong(1, teamId);
	        	
				rowCount = ps.executeUpdate();
	        	log.info("Updated " + rowCount + " rows in round_registration");	        	
	        	ps.close();
            }
	        	
        	// Fix current School
        	ps = connOltp.prepareStatement("update current_school set school_id = ? where school_id = ?");
        	ps.setLong(1, idDest);
        	ps.setLong(2, idSrc);
        	
        	int rowCount = ps.executeUpdate();
        	ps.close();
        	log.info("Updated " + rowCount + " rows in current_school");
        	
        	// set viewable=0 for source school
        	ps = connOltp.prepareStatement("update school set viewable = 0 where school_id = ?");
        	ps.setLong(1, idSrc);
        	
        	rowCount = ps.executeUpdate();
        	ps.close();
        	log.info("Updated " + rowCount + " rows in school with viewable = 0");
        	
        	
        	// Get the destination school type and team
        	/*
        	
        	// Retrieve teams
        	long teamSrc = -1;
        	long teamDest = -1;
        	ps = connOltp.prepareStatement("select team_id from team where school_id = ?");
        	ps.setLong(1, idDest);
        	
        	rs = ps.executeQuery();
        	
        	if (rs.next()) {
        		teamDest = rs.getLong(1);
        	}
        	ps.setLong(1, idSrc);
        	
        	rs.close();
        	
        	rs = ps.executeQuery();
        	
        	if (rs.next()) {
        		teamSrc = rs.getLong(1);
        	}
        	if ((teamSrc > 0 && teamDest < 0) || (teamSrc < 0 && teamDest > 0)) {
        		throw new IllegalArgumentException("One school has an associated team but the other doesn't");        		
        	}
        	
        	if (teamSrc > 0) {
        		mergeTeams(connOltp,  teamSrc, teamDest);
        	}
        	*/
        	connOltp.commit();
        } catch (SQLException _sqle) {
        	try {
        		connOltp.rollback();
        	} catch (Exception e) {
        		throw new EJBException(e.getMessage());
        	}
            DBMS.printSqlException(true, _sqle);
            throw(new EJBException(_sqle.getMessage()));
        } catch (Exception ex) {
        	try {
        		connOltp.rollback();
        	} catch (Exception e) {
        		throw new EJBException(e.getMessage());
        	}
            throw(new EJBException(ex.getMessage()));
        } finally {
            close(rs);
            close(ps);
            close(connOltp);
        }
    }

	private void mergeTeams(Connection connOltp/*, Connection connDW*/, long teamSrc, long teamDest) throws SQLException {
		PreparedStatement ps = null;
		//ResultSet rs = null;
		try {
			// Fix table team_coder_xref
			ps = connOltp.prepareStatement("update team_coder_xref set team_id = ? where team_id = ?");
			ps.setLong(1, teamDest);
			ps.setLong(2, teamSrc);
        	
			int rowCount = ps.executeUpdate();
        	log.info("Updated " + rowCount + " rows in team_coder_xref");	        	
        	ps.close();
        	
        	// Fix table round_registration
        	ps = connOltp.prepareStatement("update round_registration set team_id=? where team_id=?");
			ps.setLong(1, teamDest);
			ps.setLong(2, teamSrc);
			rowCount = ps.executeUpdate();
        	log.info("Updated " + rowCount + " rows in round_registration ");	
        	
        	// get the rounds where the src team has participated in order to fix them
/*        	ps = connOltp.prepareStatement("select distinct round_id from round_registration where team_id=? and eligible=1");
        	rs = ps.executeQuery();

        	while(rs.next()) {
        		long roundId = rs.getLong(0);
        		fixTeamPoints(connOltp, connDW, roundId, teamSrc, teamDest);
        	}        	
        	
        	ps.close();
        	
        	// Fix table room_result in DW.
        	ps = connDW.prepareStatement("update room_result set team_id=? where team_id=?");
			ps.setLong(1, teamDest);
			ps.setLong(2, teamSrc);
			rowCount = ps.executeUpdate();
        	log.info("Updated " + rowCount + " rows in room_result");	
  */      	
		} finally {
			//close(rs);
			close(ps);
		}
		
	}

	private void fixTeamPoints(Connection connOltp, Connection connDW, long roundId, long teamSrc, long teamDest) throws SQLException{
        StringBuffer query = new StringBuffer(1024);

		query.append(" select rr.team_points, rr.coder_id ");
		query.append(" from room_result rr, ");
		query.append(" round_registration rreg ");
		query.append(" where rreg.round_id = ? ");
		query.append(" and rr.round_id = ? ");
		query.append(" and rreg.coder_id = rr.coder_id ");
		query.append(" and rreg.team_id in(?, ?) ");
		query.append(" and not rr.team_point is null ");		
		query.append(" order by team_points desc ");

		PreparedStatement ps = null;
		PreparedStatement psFixOltp = null;
		PreparedStatement psFixDW = null;
		ResultSet rs = null;
		
		psFixOltp = connOltp.prepareStatement("update room_result set team_points=null where round_id = ? and coder_id=?");
		psFixDW = connDW.prepareStatement("update room_result set team_points=null where round_id = ? and coder_id=?");
		try {
			ps = connOltp.prepareStatement(query.toString());
			ps.setLong(1, roundId);
			ps.setLong(2, roundId);
			ps.setLong(3, teamSrc);
			ps.setLong(4, teamDest);
			
			rs = ps.executeQuery();
			int pos = 1;
			while (rs.next()) {
				if (pos > 3) {
					psFixOltp.setLong(1, roundId);
					psFixOltp.setLong(2, rs.getLong("coder_id"));
					int rowCount = psFixOltp.executeUpdate();
					if (rowCount != 1) {
						throw new SQLException("Exactly 1 row should have been updated in oltp, but " + rowCount + " were updated");
					}

					psFixDW.setLong(1, roundId);
					psFixDW.setLong(2, rs.getLong("coder_id"));
					rowCount = psFixDW.executeUpdate();
					if (rowCount != 1) {
						throw new SQLException("Exactly 1 row should have been updated in DW, but " + rowCount + " were updated");
					}
					
					log.debug("In round " + roundId + " the team_points for coder " + rs.getLong("coder_id") + " were set to null");
					
				} else {
					log.debug("In round " + roundId + " the team_points for coder " + rs.getLong("coder_id") + " were not changed. Points: " + rs.getLong("team_points"));					
				}
				pos++;
			}
				
		} finally {			
			close(rs);
			close(ps);
			close(psFixOltp);
			close(psFixDW);
		}
		
	}
    
    

}

;

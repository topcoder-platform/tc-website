package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileEducationObject;

public interface ProfileEducation extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer education_id, Integer profile_id, Integer degree_type_id, Integer school_id, Date graduation_date, String new_school ) throws RemoteException, SQLException;
	public void delete( Integer education_id ) throws RemoteException, SQLException;
	public ProfileEducationObject request( int cmd, ProfileEducationObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setProfileId( Integer education_id, Integer profile_id ) throws RemoteException, SQLException;
	public Integer getProfileId( Integer education_id ) throws RemoteException, SQLException;
	public void setDegreeTypeId( Integer education_id, Integer degree_type_id ) throws RemoteException, SQLException;
	public Integer getDegreeTypeId( Integer education_id ) throws RemoteException, SQLException;
	public void setSchoolId( Integer education_id, Integer school_id ) throws RemoteException, SQLException;
	public Integer getSchoolId( Integer education_id ) throws RemoteException, SQLException;
	public void setGraduationDate( Integer education_id, Date graduation_date ) throws RemoteException, SQLException;
	public Date getGraduationDate( Integer education_id ) throws RemoteException, SQLException;
	public void setNewSchool( Integer education_id, String new_school ) throws RemoteException, SQLException;
	public String getNewSchool( Integer education_id ) throws RemoteException, SQLException;
}

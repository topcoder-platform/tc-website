package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileExperienceObject;

public interface ProfileExperience extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer experience_id, Date date_start, Date date_end, String job_title, String company_name, String company_url, String job_description, Integer profile_id, Integer salary_id, Integer industry_id, Integer job_role_id, Integer job_type_id, Integer location_id, Integer co_size_id ) throws RemoteException, SQLException;
	public void delete( Integer experience_id ) throws RemoteException, SQLException;
	public ProfileExperienceObject request( int cmd, ProfileExperienceObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setDateStart( Integer experience_id, Date date_start ) throws RemoteException, SQLException;
	public Date getDateStart( Integer experience_id ) throws RemoteException, SQLException;
	public void setDateEnd( Integer experience_id, Date date_end ) throws RemoteException, SQLException;
	public Date getDateEnd( Integer experience_id ) throws RemoteException, SQLException;
	public void setJobTitle( Integer experience_id, String job_title ) throws RemoteException, SQLException;
	public String getJobTitle( Integer experience_id ) throws RemoteException, SQLException;
	public void setCompanyName( Integer experience_id, String company_name ) throws RemoteException, SQLException;
	public String getCompanyName( Integer experience_id ) throws RemoteException, SQLException;
	public void setCompanyUrl( Integer experience_id, String company_url ) throws RemoteException, SQLException;
	public String getCompanyUrl( Integer experience_id ) throws RemoteException, SQLException;
	public void setJobDescription( Integer experience_id, String job_description ) throws RemoteException, SQLException;
	public String getJobDescription( Integer experience_id ) throws RemoteException, SQLException;
	public void setProfileId( Integer experience_id, Integer profile_id ) throws RemoteException, SQLException;
	public Integer getProfileId( Integer experience_id ) throws RemoteException, SQLException;
	public void setSalaryId( Integer experience_id, Integer salary_id ) throws RemoteException, SQLException;
	public Integer getSalaryId( Integer experience_id ) throws RemoteException, SQLException;
	public void setIndustryId( Integer experience_id, Integer industry_id ) throws RemoteException, SQLException;
	public Integer getIndustryId( Integer experience_id ) throws RemoteException, SQLException;
	public void setJobRoleId( Integer experience_id, Integer job_role_id ) throws RemoteException, SQLException;
	public Integer getJobRoleId( Integer experience_id ) throws RemoteException, SQLException;
	public void setJobTypeId( Integer experience_id, Integer job_type_id ) throws RemoteException, SQLException;
	public Integer getJobTypeId( Integer experience_id ) throws RemoteException, SQLException;
	public void setLocationId( Integer experience_id, Integer location_id ) throws RemoteException, SQLException;
	public Integer getLocationId( Integer experience_id ) throws RemoteException, SQLException;
	public void setCoSizeId( Integer experience_id, Integer co_size_id ) throws RemoteException, SQLException;
	public Integer getCoSizeId( Integer experience_id ) throws RemoteException, SQLException;
}

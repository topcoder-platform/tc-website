package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.sql.SQLException;
import	javax.ejb.EJBObject;
import	java.rmi.RemoteException;
import	com.topcoder.web.TCES.ejb.ProfileSkillObject;

public interface ProfileSkill extends javax.ejb.EJBObject {
	public static final int	INSERT	= 1;
	public static final int	SELECT	= 2;
	public static final int	UPDATE	= 3;
	public static final int	DELETE	= 4;

	public void create( Integer profile_skill_id, Integer profile_id, Integer skill_level_id, Integer skill_id, Integer proficiency ) throws RemoteException, SQLException;
	public void delete( Integer profile_skill_id ) throws RemoteException, SQLException;
	public ProfileSkillObject request( int cmd, ProfileSkillObject obj ) throws RemoteException, SQLException;
	public String list() throws RemoteException, SQLException;
	public void setProfileId( Integer profile_skill_id, Integer profile_id ) throws RemoteException, SQLException;
	public Integer getProfileId( Integer profile_skill_id ) throws RemoteException, SQLException;
	public void setSkillLevelId( Integer profile_skill_id, Integer skill_level_id ) throws RemoteException, SQLException;
	public Integer getSkillLevelId( Integer profile_skill_id ) throws RemoteException, SQLException;
	public void setSkillId( Integer profile_skill_id, Integer skill_id ) throws RemoteException, SQLException;
	public Integer getSkillId( Integer profile_skill_id ) throws RemoteException, SQLException;
	public void setProficiency( Integer profile_skill_id, Integer proficiency ) throws RemoteException, SQLException;
	public Integer getProficiency( Integer profile_skill_id ) throws RemoteException, SQLException;
}

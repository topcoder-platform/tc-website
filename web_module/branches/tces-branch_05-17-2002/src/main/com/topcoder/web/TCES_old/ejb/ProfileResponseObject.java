package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the profile_response table.
 * @see com.topcoder.web.TCES.ejb.ProfileResponse
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileResponseObject 
  implements Serializable {
	public Long	response_id;
	public Long	profile_id;
	public Long	question_id;
	public Long	answer_id;
	public String	text;
}

package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

/**
 * This class serves as a convenient wrapper for database
 * fields from the profile_question table.
 * @see com.topcoder.web.TCES.ejb.ProfileQuestion
 * @author Phil Selby, May 22nd, 2002
 */

public class ProfileQuestionObject 
  implements Serializable {
	public Integer	question_id;
	public String	text;
	public Integer	question_type;
	public Integer	question_style;
}

package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

public class ProfileAnswerObject 
  implements Serializable {
	public Integer	answer_id;
	public Integer	question_id;
	public String	text;
}

package	com.topcoder.web.TCES.ejb;

import	java.sql.Date;
import	java.io.Serializable;

public class ProfileQuestionObject 
  implements Serializable {
	public Integer	question_id;
	public String	text;
	public Integer	question_type;
	public Integer	question_style;
}

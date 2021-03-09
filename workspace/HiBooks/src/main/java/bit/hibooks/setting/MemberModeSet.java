package bit.hibooks.setting;

public class MemberModeSet {
	public final static int LOGIN_F_NO_MEMBER = 1;
	public final static int LOGIN_F_WRONG_PASSWORD = 2;
	public final static int LOGIN_SUCCESS = 3;
	public final static int LOGIN_ADMIN = 4;
	
	public final static int JOIN_F_EMAIL_EXIST = 10;
	public final static int JOIN_SUCCESS = 11;
	public final static int MAIL_AUTH_SUCCESS = 12;
	public final static int MAIL_AUTH_FAIL =13;
	
	public final static int UPDATE_ACCESS_SUC = 14;
	public final static int UPDATE_ACCESS_FAIL = 15;
	public final static int UPDATE_PWD_SUC = 16;
	public final static int UPDATE_INFO_SUC = 17;
}

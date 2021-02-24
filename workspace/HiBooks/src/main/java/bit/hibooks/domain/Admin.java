package bit.hibooks.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Admin {
	private String a_email;
	private String a_pwd;
	private String a_name;
	private String a_grade;
}

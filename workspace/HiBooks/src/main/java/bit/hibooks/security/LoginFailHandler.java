package bit.hibooks.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

@Service
public class LoginFailHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		System.out.println(exception);
		if(exception instanceof BadCredentialsException) {
			request.setAttribute("loginFailMsg", "아이디 또는 비밀번호가 틀립니다");
		}else if(exception instanceof DisabledException) {
			request.setAttribute("loginFailMsg", "로그인 전 이메일 인증을 해주세요");
		}
		RequestDispatcher rd = request.getRequestDispatcher("login.do");
		rd.forward(request, response);
	}

}

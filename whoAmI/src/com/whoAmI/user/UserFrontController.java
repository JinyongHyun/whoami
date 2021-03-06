 package com.whoAmI.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.whoAmI.action.ActionForward;

public class UserFrontController extends HttpServlet {
	//get post 두가지 방식을 계속 만들어줘야 하기때문에 doprocess라는 메소드를 만들어서 개발한다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	} 	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();  
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward af = null;
		
		//ok는 db연산할때 붙여준다
		if(command.equals("/user/UserCheckIdOk.user")) {
			new UserCheckIdOk().execute(req, resp);
			
		}else if(command.equals("/user/Join.user")) {
			af = new ActionForward();
			af.setRedirect(false);
			af.setPath("/app/User_Account/join.jsp");  
			//페이지 이동
			//false 는 데이터를 안고 가고 true는 데이터를 안고가지 않는다.
		}else if(command.equals("/user/UserJoin.user")) {
			af = new UserJoin().execute(req, resp);
		
		}else if(command.equals("/user/UserJoinOk.user")) {
			af = new UserJoinOk().execute(req, resp);
		
		}else if(command.equals("/user/UserLogin.user")) {
			af = new ActionForward();
			af.setRedirect(false);
			af.setPath("/app/User_Account/login.jsp");  
			
		}else if(command.equals("/user/UserLoginOk.user")) {
			//System.out.println(req.getParameter("userEmail"));
			af=new UserLoginOk().execute(req, resp);
			
		}else if(command.equals("/user/Main.user")) {
			af = new ActionForward();
			af.setRedirect(false);
			af.setPath("/app/mainPage/mainPage.jsp");
		
		}else if(command.equals("/user/UserLogout.user")) {
			af = new UserLogout().execute(req, resp);
		
		}else if(command.equals("/user/SendEmailOK.user")) {
			af=new SendEmailOK().execute(req, resp);
		
		}else if(command.equals("/user/ChangePw.user")) {
			af = new ActionForward();
			af.setRedirect(false);
			af.setPath("/app/User_Account/pw_setup.jsp");
		
		}else if(command.equals("/user/ChangePwOK.user")) {
			af = new ChangePwOK().execute(req, resp);
		
		}else if(command.equals("/user/FindPw.user")){
			af = new ActionForward();
			af.setRedirect(false);
			af.setPath("/app/User_Account/pw_find.jsp");
		} else if(command.equals("/user/UserDeleteOk.user")){
		    af = new UserDeleteOk().execute(req, resp);
	}
		
		//전송안할지
		if(af != null) {
			if(af.isRedirect()) {
				//redirect
				resp.sendRedirect(af.getPath());
			}else {
				//forward
				//request객체에서 Dispatch을 가져온 뒤, 이동할 경로를 전달한다.
				//dispatch : 요청과 응답을 관리해주는 객체
				RequestDispatcher dispatcher = req.getRequestDispatcher(af.getPath());
				//dispatcher객체에서 forward()를 사용할 때 request와 response객체 둘 다 전달해주면
				//응답할 화면까지 데이터가 유지된다.
				dispatcher.forward(req, resp);
			}
		}
	}
}
	

		
		
	


















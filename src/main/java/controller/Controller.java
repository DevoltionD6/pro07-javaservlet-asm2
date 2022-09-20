package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Account;

/**
 * Servlet implementation class Controller
 */
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8"); // vietnamese character
		try {
			request.getSession(true).invalidate();

			// email and password valid
			String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
			String regexPass = "[a-zA-Z0-9_!@#$%^&*]+";

			// collect data from a login form
			String user = request.getParameter("username");
			String password = request.getParameter("password");
			Account acc = new Account();
			acc.setName(user);
			acc.setPwd(password);
			HttpSession session = request.getSession(true);
			if (!password.matches(regexPass) || !user.matches(regexMail)) {
				session.setAttribute("error", "Invalid Syntax");
				response.sendRedirect("login.jsp");
				return;
			}

			// read infomation of account in web.xml
			String uid = getServletContext().getInitParameter("username");
			String pwd = getServletContext().getInitParameter("password");
			if (user != null && acc.getPwd().equals(pwd) && acc.getName().equalsIgnoreCase(uid)) {
//			if (user != null && user.trim().length() > 0 && password != null && password.trim().length() > 0) {
				System.out.println(user + ":" + password);
//				if (user != null && user.length() != 0 && user.equals("uid") && password != null
//						&& password.length() != 0 && password.equals("uid")) {
				if (request.getParameter("remember") != null) {
					String remember = request.getParameter("remember");
					System.out.println("remember : " + remember);
					Cookie cUserName = new Cookie("cookuser", user.trim());
					Cookie cPassword = new Cookie("cookpass", password.trim());
					Cookie cRemember = new Cookie("cookrem", remember.trim());
					cUserName.setMaxAge(60 * 60 * 24 * 15);// 15 days
					cPassword.setMaxAge(60 * 60 * 24 * 15);
					cRemember.setMaxAge(60 * 60 * 24 * 15);
					response.addCookie(cUserName);
					response.addCookie(cPassword);
					response.addCookie(cRemember);
				}
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("sessuser", user.trim());
//					RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin.jsp");
//					requestDispatcher.forward(request, response);
//				}
//			} else {
//				System.out.println("Username and Password are required fields.");
//				request.setAttribute("msg", "Username and Password are required fields.");
//				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
//				requestDispatcher.forward(request, response);
//			}

//			if (user != null && acc.getPwd().equals(pwd) && acc.getName().equalsIgnoreCase(uid)) {

				// set session
//				session.setAttribute("user", user);

				// login is valid now redirect to index page of admin
				response.sendRedirect("admin/admin.jsp");
			} else {
				session.setAttribute("error", "wrong username or password;");
				response.sendRedirect("login.jsp");
			}

		} catch (NullPointerException e) {
			// TODO: handle exception
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);

		} catch (Exception ex) {
			// TODO: handle exception
			response.getWriter().print(ex);
		}

	}

}

package com.backend;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.backend.*;

import jdk.jshell.StatementSnippet;

import java.io.IOException;
import java.sql.Connection;

/**
 * Servlet implementation class InfoChange
 */
@SuppressWarnings("unused")
@WebServlet("/InfoChange")
public class InfoChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session;
	private Connection con;
	
    public InfoChange() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		session = request.getSession();
		
		String str = request.getParameter("action");
		String[] s = new String[2];
		if(str !=null) {
			s = str.split(" ");
			Emp e = (Emp) ((Emp[]) session.getAttribute("employee-info"))[Integer.parseInt(s[1])];
			session.setAttribute("employee", e);
		}
		String save = request.getParameter("save");
		String add = request.getParameter("add");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		    con = DriverManager.getConnection("jdbc:mysql://growmoredb.crjabqxdvl7c.us-east-2.rds.amazonaws.com:3306/RailwayDB","admin", "Keshav100%");
			if(add != null) {
				if(add.equals("add")) {
					response.sendRedirect("addCustRep.jsp");
				}
				else if(add.equals("addinto")) {
					add(request, response);
				}
			}
			else if(save != null) {
				edit(request, response);
			}
			else {
				if(s[0].equals("Edit")) {
					response.sendRedirect("Info.jsp");
				}
				else {
					delete(request, response);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
			
		
		
	}
	
	private void edit(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String first = request.getParameter("first"),
				last = request.getParameter("last"),
				user = request.getParameter("username"),
				pass = request.getParameter("password");
		
		int ssn = Integer.parseInt(request.getParameter("ssn"));
		
		Statement s = con.createStatement();
		s.execute("UPDATE employee SET ssn='" + ssn + "',firstname='" + first + "',lastname='" + last + "' WHERE username='" + user + "'");
		
		response.sendRedirect("customerRep.jsp");
	}
	
	
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws Exception{
	    Emp e = (Emp) session.getAttribute("employee");
	    
	    Statement s = con.createStatement();
	    s.execute("DELETE FROM employee WHERE username='" + e.getUsername()+ "'");
		
		response.sendRedirect("customerRep.jsp");
	}
	
	private void add(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String first = request.getParameter("first"),
				last = request.getParameter("last"),
				user = request.getParameter("username"),
				pass = request.getParameter("password");
		
		int ssn = Integer.parseInt(request.getParameter("ssn"));
		
		Statement s = con.createStatement();
		s.execute("INSERT INTO employee (username, password, firstname, lastname, ssn) VALUE ('" + user + "','" + pass + "','" + first + "','" + last + "'," + ssn + ")");
		
		Statement s1 = con.createStatement();
		s1.execute("INSERT INTO customerRep (custRep_user, custRep_pass, custRep_ssn) SELECT username, password, ssn FROM employee WHERE username='" + user + "'");
		
		response.sendRedirect("customerRep.jsp");
	}

}

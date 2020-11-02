package com.thinking.machines.services;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import com.thinking.machines.beans.*;
import com.thinking.machines.pojo.*;
import java.net.*;
public class Start extends HttpServlet
{
public void doPost(HttpServletRequest rq,HttpServletResponse rs)
{
doGet(rq,rs);
}
public void doGet(HttpServletRequest rq,HttpServletResponse rs)
{ 
try
{
System.out.println("Start Service Chali");
RequestDispatcher requestDispatcher;
requestDispatcher=rq.getRequestDispatcher("login.jsp");
requestDispatcher.forward(rq,rs);
}catch(Exception e)
{
System.out.println(e);
}
}
}

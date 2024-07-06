<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cloud </title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-georgia.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 24}
.style2 {padding:0; margin:0; width:100%; line-height:0; clear: both;}
.style3 {font-size: 36px; }
.style21 {
	font-size: 14px;
	color: #353c3e;
}
.style25 {color: #353c3e}
.style26 {font-size: 24px}
.style27 {font-size: 24px; color: #353c3e; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="C_Main.jsp">CLOUD</a></li>
          <li><a href="C_Login.jsp">LOGOUT</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3">Leveraging Data Deduplication to Improve the Performance of Primary Storage Systems in the Cloud</h1>
      </div>
      <div class="clr style1"></div>
      <div class="slider style1">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /> </a> </div>
        <div class="style2"></div>
      </div>
      <div class="clr style1"></div>
    </div>
  </div>
  <div class="content style1">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2> Cloud Requests </h2>
          <p class="infopost style25">&nbsp;</p>
          <span class="style25">
          <%
	try
	{
		String cloud=(String)application.getAttribute("cloudname"); 			
		int uid = Integer.parseInt(request.getParameter("usid"));
		String memory=request.getParameter("memory");
		String cost=request.getParameter("cost");
		String dname=request.getParameter("dname");
		String slafrom=request.getParameter("slafrom");
		String slato=request.getParameter("slato");
		
		
		%>
          </span>
          <table width="479"  style="border-collapse:collapse" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <th width="204" height="30" class="style25" scope="row"><div align="left">Assigned Memory:</div></th>
              <td width="253" class="style25"><%=memory%>Memory</td>
            </tr>
            <tr>
              <th height="30" class="style25" scope="row"><div align="left">Amounted Payed By <%=dname%>:</div></th>
              <td class="style25"><%=cost%></td>
            </tr>
            <tr>
              <th height="30" class="style25" scope="row"><div align="left">SLA From:</div></th>
              <td class="style25"><%=slafrom%></td>
            </tr>
            <tr>
              <th height="30" class="style25" scope="row"><div align="left">SLA To:</div></th>
              <td class="style25"><%=slato%></td>
            </tr>
          </table>
          <span class="style25"><br />
          <%
		String quer5="Select *from cloudstorage where cloud='"+cloud+"' "; 
		Statement st5=connection.createStatement();
		ResultSet rs5=st5.executeQuery(quer5);
		if (rs5.next())
		{
					int assmem = Integer.parseInt(memory);
					int cmem = Integer.parseInt(rs5.getString(3));
		if(cmem>=assmem)
		{
			String query2="Select *from cloudpurchase where downer='"+dname+"' and cloud='"+cloud+"' "; 
			Statement st2=connection.createStatement();
			ResultSet rs2=st2.executeQuery(query2);
			if (rs2.next())
			{	
				String status=rs2.getString(8);
				if(status.equalsIgnoreCase("Memory Requested"))
				{
					int tmem=Integer.parseInt(rs2.getString(9));
					int freemem=Integer.parseInt(rs2.getString(12));
					int assignedmemory = Integer.parseInt(request.getParameter("memory"));
					String totmem=String.valueOf(tmem+assignedmemory);
					String nfreemem=String.valueOf(freemem+assignedmemory);
					
					String Approved="Approved";
					String strQuery = "update cloudpurchase set status='"+Approved+"',memory='"+totmem+"',slafrom='"+slafrom+"',slato='"+slato+"',freemem='"+nfreemem+"' where id='"+uid+"'";
					Statement st=connection.createStatement();
					st.executeUpdate(strQuery);
					
				st.executeUpdate("insert into slarequest(cloud,downer,status,memory,slafrom,slato) values('"+cloud+"','"+dname+"','No','"+totmem+"','"+slafrom+"','"+slato+"')");
					
					String newcmem=String.valueOf(cmem-assmem);
									
				String strQuer = "update cloudstorage set memory='"+newcmem+"' where cloud='"+cloud+"'";
				Statement st3=connection.createStatement();
				st3.executeUpdate(strQuer);
					
					SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
					Date now = new Date();
					
					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;
					
					
					String task="Updated Memory & SLA";
					st.executeUpdate("insert into transaction(user,fname,task,dt) values('"+cloud+"','"+dname+"','"+task+"','"+dt+"')");
					
					%>
          </p>
          </span>
          <p class="style25">&nbsp;</p>
         <h3 class="style21 style26">Assigned Sucessfully !!</h3>
          <span class="style25">
          <%			
				}
				else
				{
				
					String Approved="Approved";int free=0; 
					String strQuery2 = "update cloudpurchase set status='"+Approved+"',memory='"+memory+"',slafrom='"+slafrom+"',slato='"+slato+"',freemem='"+memory+"' where id='"+uid+"'";
					Statement st=connection.createStatement();
					st.executeUpdate(strQuery2);
					
					String newcmem=String.valueOf(cmem-assmem);
									
				String strQuer = "update cloudstorage set memory='"+newcmem+"' where cloud='"+cloud+"'";
				Statement st3=connection.createStatement();
				st3.executeUpdate(strQuer);
				st.executeUpdate("insert into slarequest(cloud,downer,status,memory,slafrom,slato) values('"+cloud+"','"+dname+"','No','"+newcmem+"','"+slafrom+"','"+slato+"')");
					
					SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
					SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
					Date now = new Date();
					
					String strDate = sdfDate.format(now);
					String strTime = sdfTime.format(now);
					String dt = strDate + "   " + strTime;
					
					
					String task="Assigned Memory & SLA";
					st.executeUpdate("insert into transaction(user,fname,task,dt) values('"+cloud+"','"+dname+"','"+task+"','"+dt+"')");
					
					%>
          </p>
          </span>
          <p class="style25">&nbsp;</p>
         <h3 class="style27">Assigned Sucessfully !!</h3>
          <span class="style25">
          <%			
				}
			
			}	
			else	
			{	
			
				String Approved="Approved";
				String strQuery2 = "update cloudpurchase set status='"+Approved+"',memory='"+memory+"',slafrom='"+slafrom+"',slato='"+slato+"' where id='"+uid+"'";
				Statement st=connection.createStatement();
				st.executeUpdate(strQuery2);
				
				String newcmem=String.valueOf(cmem-assmem);
									
				String strQuer = "update cloudstorage set memory='"+newcmem+"' where cloud='"+cloud+"'";
				Statement st3=connection.createStatement();
				st3.executeUpdate(strQuer);
				
				SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
				SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
				Date now = new Date();
				
				String strDate = sdfDate.format(now);
				String strTime = sdfTime.format(now);
				String dt = strDate + "   " + strTime;
				
				st.executeUpdate("insert into slarequest(cloud,downer,status,memory,slafrom,slato) values('"+cloud+"','"+dname+"','No','"+memory+"','"+slafrom+"','"+slato+"')");
				
				String task="Assigned Memory & SLA";
				st.executeUpdate("insert into transaction(user,fname,task,dt) values('"+cloud+"','"+dname+"','"+task+"','"+dt+"')");
				
				%>
          </p>
          </span>
          <p class="style25">&nbsp;</p>
          <h3 class="style27">Assigned Sucessfully !!</h3>
          <span class="style25">
          <%
			
			}		
		}
		else
		{
			%>
          </span>
          <h3 class="style27">You Have Less Memory On Your Cloud Space Please Add Memory To Continue !!</h3>
          <span class="style25">
          <%
		}
	}		
	
	connection.close();
	}
	
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
			
			
			%>
          </span>
          <div class="img">
            <div align="justify"></div>
          </div>
          <div class="post_content">
            <p align="right"><a href="C_Main.jsp">Back</a></p>
          </div>
          <div class="style2"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="gadget">
          <h2 class="star"> Menu</h2>
          <div class="style2"></div>
          <ul class="sb_menu">
            <li><a href="C_Main.jsp">Home</a></li>
            <li><a href="C_Login.jsp">Logout</a></li>
          </ul>
        </div>
      </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="fbg style1">
    <div class="fbg_resize">
      <div class="col c1">
        <h2>Storage Capacity</h2>
        <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
      <div class="col c2">
        <h2>Data Redundancy</h2>
        <p align="justify">Experimental studies reveal that data redundancy exhibits a much higher level of intensity on the I/O path than that on disks due to relatively high temporal access locality associated with small I/O requests to redundant data. Moreover, directly applying data deduplication to primary storage systems in the Cloud will likely cause space contention in memory and data fragmentation<br />
        on disks.</p>
      </div>
      <div class="col c3">
        <h2>Primary Storage</h2>
        <p align="justify">Recent studies have shown that moderate to high data redundancy clearly exists in primary storage systems in the Cloud. Our experimental studies reveal that data redundancy exhibits a much higher level of intensity on the I/O path than that on<br />
        disks due to relatively high temporal access locality associated with small I/O requests to redundant data.</p>
      </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="footer style1">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center class="style1"></div>
</body>
</html>

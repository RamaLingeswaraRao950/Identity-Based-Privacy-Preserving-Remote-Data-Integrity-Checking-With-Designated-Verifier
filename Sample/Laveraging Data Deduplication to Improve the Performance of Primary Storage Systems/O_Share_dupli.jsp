<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Owner </title>
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
.style18 {
	font-size: 16px;
	font-style: italic;
	font-weight: bold;
}
.style19 {font-size: 18px; color: #353C3E;}
.style21 {font-size: 14px}
.style23 {color: #666666; font-weight: bold;}
.style33 {font-size: 18px; color: #595f61; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="O_Main.jsp">Hi <%=application.getAttribute("doname")%> !!</a></li>
          <li><a href="O_Login.jsp">Logout</a></li>
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
          <h2><span>File Share Status </span></h2>
          <p>
            <%
			  
			  	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9="",s10="",s11="",s12="",s13="",s14="",s15="";

	try 
	{
		String msg="";

			String dname=(String)application.getAttribute("doname");
			String task="Shared File";
			String org_f=request.getParameter("org_f");
			String dup_f=request.getParameter("dup_f");
			
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
			Date now = new Date();
			
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
			String keys = "ef50a0ef2c3e3a5f";
			byte[] keyValue = keys.getBytes();
			Key key = new SecretKeySpec(keyValue, "AES");
			Cipher c = Cipher.getInstance("AES");
			c.init(Cipher.ENCRYPT_MODE, key);
			String dt1 = new String(Base64.encode(dt.getBytes()));
			
			
			
			String quer1="select * from cloudserver where fname='"+org_f+"'";
			Statement st1=connection.createStatement();
			ResultSet rs=st1.executeQuery(quer1);
			if ( rs.next() )
			{
					int i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(3);
					s4=rs.getString(4);
					s5=rs.getString(5);
					s6=rs.getString(6);
					s7=rs.getString(7);
					s8=rs.getString(8);
					s9=rs.getString(9);
					s10=rs.getString(10);
					s11=rs.getString(11);
					s12=rs.getString(12);
					s13=rs.getString(13);
					s14=rs.getString(14);
					s15=rs.getString(15);
					
					Statement st6=connection.createStatement();
					st6.executeUpdate("delete  from cloudserver where fname='"+dup_f+"' ");

			String org_f1 = new String(Base64.encode(org_f.getBytes()));
					
							
					Statement st21=connection.createStatement();
					st21.executeUpdate("insert into cloudserver(fname,ownername,cname,ct1,mac1,ct2,mac2,ct3,mac3,ct4,mac4,sk,dt,fsize,status) values ('"+ dup_f+ "','"+ dname+ "','cloud','"+ org_f1+ "','Shared','"+ org_f1+ "','Shared','"+ org_f1+ "','Shared','"+ org_f1+ "','Shared','"+ s13+ "','" + dt + "','"+s15+"','Shared')");
					
					String query2="Select *from cloudpurchase where downer='"+dname+"' and cloud='cloud' "; 
				Statement st2=connection.createStatement();
				ResultSet rs2=st2.executeQuery(query2);
				if (rs2.next()==true)
				{
					int freemem=Integer.parseInt(rs2.getString(12));
					int fsize1=Integer.parseInt(s15);
					
					String newmemory=String.valueOf(freemem+fsize1);
					Statement st=connection.createStatement();
					String strQuer2 = "update cloudpurchase set freemem='"+newmemory+"' where downer='"+dname+"' and cloud='cloud'";
					st.executeUpdate(strQuer2);
				}		
					Statement st3=connection.createStatement();
	st3.executeUpdate("insert into  shared_files(dupli_file,dupli_file_owner,shared_file,shared_file_owner,fsize,dt) values ('"+dup_f+"','"+dname+"','"+org_f+"','"+s3+"','"+s15+"','" + dt + "')");
					
					String strQuery2 = "insert into transaction(user,fname,task,dt,fsize) values('"+dname+"','"+dup_f+"','"+task+"','"+dt+"','"+s15+"')";
			Statement st=connection.createStatement();
			st.executeUpdate(strQuery2);
					
					
					Statement st5=connection.createStatement();
						st5.executeUpdate("delete from deduplication where dfname='"+dup_f+"' and name='"+dname+"'");
					
					%>
          </p>
          <h3 class="style33">File &quot; <%=dup_f%> &quot; Shared Sucessfully !!</h3>
          <a href="O_Main.jsp">Back</a><br />
          <%
					
			}
	}
	catch(Exception e)
	{
		out.print(e);
	}
	%>
<div class="post_content">
            <p align="justify">&nbsp;</p>
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
            <li><a href="O_Main.jsp">Home</a></li>
            <li><a href="O_Login.jsp">Logout</a></li>
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

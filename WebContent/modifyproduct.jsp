 <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>  
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>Modify product</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-background-color="white" data-active-color="danger">

  

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                    INFOTECH
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="dashboard.jsp">
                        <i class="ti-panel"></i>
                        <p>Stats</p>
                    </a>
                </li>
                <li>
                    <a href="productslist.jsp">
                        <i class="ti-list"></i>
                        <p>Products list</p>
                    </a>
                </li>
                
                <li>
                    <a href="addproduct.jsp">
                        <i class="ti-plus"></i>
                        <p>Add Product</p>
                    </a>
                </li>
                <li  class="active">
                    <a href="modifyproduct.jsp">
                        <i class="ti-pencil"></i>
                        <p>Modify Product </p>
                    </a>
                </li>
             
                <li>
                    <a href="deleteproduct.jsp">
                        <i class="ti-trash"></i>
                        <p>Delete Product</p>
                    </a>
                    </li>
                      <li>
                    <a href="message.jsp">
                        <i class="ti-comments-smiley"></i>
                        <p>Messages List</p>
                    </a>
               </li>
               
            </ul>
    	</div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#">Stats</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                           
                        </li>
                        <li class="dropdown">
                          
                        </li>
						<li>
                           <a href="alogin.jsp">
                        <i class="ti-export"></i>
                        <p>Log out</p>
                    </a>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>
<br>
<br>

<center><h5 id="success" style="display: none;"> Product Modified Successfully</h5></center>
                        <p class="ti-arrow-up">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Modify products</h4>
                           
                            </div>
                            <div class="content table-responsive table-full-width">
                            
                            
                                <table class="table table-striped">
                                    <thead>
                                        <th>ID</th>
                                        <th>Image</th>
                                    	<th>Name</th>
                                    	<th>Category</th>
                                    	<th>Description</th>
                                    	<th>Price</th>
                                    	<th>Quantity</th>
                                    	<th> Action </th>
                                    	
                                    </thead>
                                    <tbody>
                                        <tr>
                                        
                                        
                                        
                                        
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "infotech";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

%>

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM produit where description not like '...'";

resultSet = statement.executeQuery(sql);    
while(resultSet.next()){
	%>                                
                                        <form action="modproduct.jsp" method="get">
                                        <tr>
                                        	<td><%=resultSet.getString("id") %></td>
                                        	<td><input type="image" widh="150px" height="200px" src="images/<%=resultSet.getString("image") %>"></td>
                                        	<td><%=resultSet.getString("nom") %></td>
                                        	<td><%=resultSet.getString("categorie") %></td>
                                        	<td><%=resultSet.getString("description") %></td>
                                        	<td><%=resultSet.getString("prix") %></td>
                                        	<td><%=resultSet.getString("qte") %></td>
                                        	<td><input type="submit" value="Modifier">
                                        	<input type="hidden" name="b1"  value="<%=resultSet.getString("id") %>">
                                        	</td>
                            
                                        
                                        </tr>
                                       
                               </form>
 
   <% }



%>
     </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                    </div>
                    </div>
                   </div>
                   </div>
                   </div>
     
                 
  <%              
 
    
  }
  catch (Exception ex) {
  out.println("Unable to connect to batabase.");

     }
  finally {
      // close all the connections.
      statement.close();
      connection.close();
  }
 
 
 
 %>
              
                   
                   
                   
                   
                   
                   
                   
                   
                   
                
                   
                   
                   
                   
                   
                   
                   
                   </body>
                      <!--   Core JS Files   -->
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script> 
        
</html>

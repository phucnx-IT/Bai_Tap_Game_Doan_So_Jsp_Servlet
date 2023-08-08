<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Record</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.2.1 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>

<body>
        <div class="container" style="padding-top: 100px;">
                <div style="text-align: center;">
                        <h1 class="text-success">Guess Number Ranking</h1>
                </div>
                <div>
                        <table class="table">
                                <tr>
                                        <th scope="col">Rank</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Count</th>
                                        <th scope="col">Date End</th>
                                </tr>
                                <c:set var="countNum" value="${0}"></c:set>
                                <c:forEach var="player" items="${PlayerList}">
	                                <tr>
	                                	
	                                        <th scope="row">${countNum = countNum + 1}</th>
	                                        <td>${player.name}</td>
	                                        <td>${player.count}</td>
	                                        <td>${player.dateFinish}</td>
	                                </tr>
                                </c:forEach>
                        </table>
                </div>
                <div class="container end_game" style="text-align: center;">
		                <div class="col-lg-12">
		                        <a name="" id="" class="btn btn-primary" href= "<%=request.getContextPath()%>/game" role="button">Play Again</a>
		                        <a name="" id="" class="btn btn-primary" href="<%=request.getContextPath()%>/logout" role="button">Logout</a>
		                </div>
		        </div>
        </div>
  <!-- Bootstrap JavaScript Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>
</body>

</html>
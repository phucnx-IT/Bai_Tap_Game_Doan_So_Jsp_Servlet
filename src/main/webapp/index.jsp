<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
        <title>Home Page</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS v5.2.1 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
                crossorigin="anonymous">
        <link rel="stylesheet" href='<c:url value="assets/css/index.css"></c:url>'>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.js" integrity="sha512-8Z5++K1rB3U+USaLKG6oO8uWWBhdYsM3hmdirnOEWp8h2B1aOikj5zBzlXs8QOrvY9OxEnD2QDkbSKKpfqcIWw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>        <!-- Bootstrap JavaScript Libraries -->
</head>

<body>
        <div class="container" id="login_container" style="justify-content:center">
                <div class="row">
                        <div class="col-lg-12" style="text-transform: uppercase;">
                			<form action="<%=request.getContextPath()%>/game" method="POST">
	                                <p>please enter your name to play game</p>
	                                <input type="text" name="input_name" id="input_name" maxlength="30">
	                                <p class="text-danger" style="font-size: 14px; display: none;" id="info_message">Please enter your name.</p>
                                     <button type="submit" id="btn_playgame" class="btn btn-primary">play
                                     game</button>
	                        </form>
                        </div>
                </div>
        </div>
        <script>
                $(function(){
		                	$("#input_name").keypress(function(e){
		                        if (e.keyCode === 13) {
		                                $("#btn_playgame").click(); 
		                        }
		                })
                        $("#btn_playgame").click(function(){
                                if ($("#input_name").val()) {
                                        return true;
                                }else{
                                        $("#info_message").css("display","block");
                                        return false;
                                }
                        })
                })
        </script>
        <!-- Bootstrap JavaScript Libraries -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
                crossorigin="anonymous">
                </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
                integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
                crossorigin="anonymous">
                </script>
</body>

</html>
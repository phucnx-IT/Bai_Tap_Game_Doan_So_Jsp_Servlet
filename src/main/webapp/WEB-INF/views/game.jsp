<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">

<head>
        <title>Game</title>
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
        <div class="container" id="game_container">
                <div class="row">
                        <div class="col-lg-12" id="game_congratulation" style="text-transform: uppercase; margin-bottom: 50px;">
								 <input type="text" value="${username}" hidden>                            
                                <p>please input number from 1 to 1000</p>
                        </div>
                        <div class="col-lg-12 game_info">
                                <input type="number" min="1" max="1000" id="input_number">
                        </div>
                        <div class="col-lg-12 game_info" style="display: none;" id="warning_message">
                                <p class="text-danger"></p>
                        </div>
                        <div class="col-lg-12 game_info">
                                <a name="" id="btn_check" class="btn btn-primary" href="#" role="button">Check</a>
                        </div>
                </div>
        </div>
        <div class="container end_game" style="display: none; text-align: center;">
                <div class="col-lg-12">
                        <a name="" id="" class="btn btn-primary" href= "<%=request.getContextPath()%>/game" role="button">Play Again</a>
                        <a name="" id="" class="btn btn-primary" href="<%=request.getContextPath()%>/record" role="button">Ranking</a>
                </div>
        </div>
        <script>
                var randomNumber = Math.round(Math.random(1000)*1000+1);
                var count = 0;
                console.log(randomNumber)
                $("#input_number").keypress(function(e){
                        if (e.keyCode === 13) {
                                $("#btn_check").click(); 
                        }
                })
                $("#btn_check").click(function(){
                        count++;
                        if ($("#input_number").val() > randomNumber) {
                                $("#warning_message").css("display","block");
                                $("#warning_message").children().html("The input value is <strong style='text-transform:uppercase'>greater</strong> than secret number")
                        }else if ($("#input_number").val() < randomNumber) {
                                $("#warning_message").css("display","block");
                                $("#warning_message").children().html("The input value is <strong style='text-transform:uppercase'>lower</strong> than secret number")
                        } else {
                                $(".game_info").css("display","none")
                                $("#game_container").addClass("congratulate");
                                $(".end_game").css("display","flex")
                                $("#game_congratulation").children().html(`The secret number is `+randomNumber)
                                let date = new Date().toLocaleDateString();
                                var player = {"name":"${username}", "count":count, dateFinish:date}
                                $.ajax({
                                        type:"POST",
                                        url:"<%=request.getContextPath()%>/handlegame",
                                        data:JSON.stringify(player),
                                        contentType:"application/json",
                                        success: function(res){
                                        	console.log(res)
                                        },
                                        error: function(xhr, status, err){
                                        	console.log(err)
                                        }
                                })
                        }
                        $("#input_number").val("");
                })
        </script>
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
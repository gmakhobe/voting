<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/">VoteSA</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="register">Register</a></li>
                <li><a href="login">Login</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="jumbotron">
            <h1>Voting SA</h1>
            <p>Login</p>
        </div>
        <div>
            <div>
                <div class="form-group">
                    <label for="email">Id Number:</label>
                    <input type="text" class="form-control" id="idnumber">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" id="pwd">
                </div>
                <button type="submit" id="loginBtn" class="btn btn-default">Submit</button>
            </div>
        </div>
    </div>

    <script>
        var loginBtn = document.getElementById("loginBtn");
        var login = () => {
            var idnumber = document.getElementById("idnumber").value,
            password = document.getElementById("pwd").value;
            for (var index = 0; index < idnumber.length; index++){
            	if (idnumber[index] >= '0' && idnumber[index] <= '9'){
            		console.log("Index: " + index);
            	}else{
            		alert("Please enter only numbers on Id Number field");
            		return ;
            	}
            }
            
            var zero = {
            		"zer": 0
            };

            //Create an object
            var xmlhttp = new XMLHttpRequest();
            //To be called when we server response is ready
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 201) {
                	
                	var response = this.responseText;
                	var res = JSON.parse(response);
                	
                	if (res){
                		
                    	if (res.regId != zero["zer"]){
                    		res = JSON.stringify(res);
                            localStorage.setItem("userObj", res);
                            window.location.assign("dashboard");
                        }else
                            alert("Please enter correct information!");
                    	
                	}else{
                		alert("Please enter correct information!");
                	}
                }
            };
            //Sending request to a php file
            xmlhttp.open("POST", "logon?idnumber=" + idnumber + "&password="+ password, true);
            xmlhttp.send();
        }
        //Event Listener
        loginBtn.addEventListener("click", login);

    </script>
</body>

</html>
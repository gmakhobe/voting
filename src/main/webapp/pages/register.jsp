<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>

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
            <p>Register</p>
        </div>
        <div>
            <div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name">
                </div>
                <div class="form-group">
                    <label for="surname">Surname:</label>
                    <input type="text" class="form-control" id="surname">
                </div>
                <div class="form-group">
                    <label for="idnumber">Id Number:</label>
                    <input type="text" class="form-control" id="idnumber">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" id="pwd">
                </div>
                <div class="form-group">
                    <label for="category">Select Category:</label>
                    <select class="form-control" id="category">
                        <option>Politics</option>
                        <option>Sports</option>
                        <option>Entertainment</option>
                    </select>
                </div>
                <button type="submit" id="registerBtn" class="btn btn-default">Submit</button>
            </div>
        </div>
    </div>

    <script>
        var registerBtn = document.getElementById("registerBtn");
        var register = () => {
            var name = document.getElementById("name").value, 
            surname = document.getElementById("surname").value,
            email_address = Math.floor(Math.random() * 15999999),
            password = document.getElementById("pwd").value,
            category = document.getElementById("category").value,
            regId = document.getElementById("idnumber").value;

            for (var index = 0; index < regId.length; index++){
            	if (regId[index] >= '0' && regId[index] <= '9'){
            		console.log("Index: " + index);
            	}else{
            		alert("Please enter only numbers on Id Number field");
            		return ;
            	}
            }
            
            //Create an object
            var xmlhttp = new XMLHttpRequest();
            //To be called when we server response is ready
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 201) {
                    alert(this.responseText);
                    window.location.assign("login");
                }
            };
            //Sending request to a php file
            xmlhttp.open("POST", "registration?regId=" + regId + "&name=" + name + "&surname=" + surname + "&email_address=" + email_address + "&password="+ password + "&category=" + category, true);
            xmlhttp.send();
        }
        //Event Listener
        registerBtn.addEventListener("click", register);

    </script>

</body>

</html>
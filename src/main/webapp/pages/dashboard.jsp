<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/dashboard">VoteSA</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="/">Logout</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="jumbotron">
            <h1>Selected Category: <span id="category"></span></span></h1>
            <p>Vote Below</p>
        </div>
        <div>
            <div id="layout">
                <center>
                    <button onclick="showResults('African National Congress')" type="button" class="btn btn-success">African National Congress</button>
                    <button onclick="showResults('Democratic Alliance')" type="button" class="btn btn-success">Democratic Alliance</button>
                    <button onclick="showResults('Economic Fredom Fighters')" type="button" class="btn btn-success">Economic Fredom Fighters</button>
                </center>
            </div>
        </div>
    </div>

    <script>
        var userObj = localStorage.getItem("userObj");
        userObj = JSON.parse(userObj);
        document.getElementById("category").innerHTML = userObj.category;
        
        function showResults(txt){

            var anc = Math.floor(Math.random() * 100);
            var da = Math.floor(Math.random() * 100);
            var eff = Math.floor(Math.random() * 100);

            document.getElementById("layout").innerHTML = '<center><h1>Resutls</h1><p>You voted for ' + txt + '</p><button type="button" class="btn btn-success">African National Congress: ' + anc  + ' votes</button>' +
            '<br/><br/> <button type="button" class="btn btn-success">Democratic Alliance: ' +  da + ' votes</button>' +
            '<br/><br/><button type="button" class="btn btn-success">Economic Fredom Fighters: ' +  eff + ' votes</button> <br/><br/> <h1>Total votes' + (anc + da + eff) + '</h1></center>';
        }
    </script>

</body>

</html>
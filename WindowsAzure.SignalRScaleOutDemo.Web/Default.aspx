<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WindowsAzure.SignalRScaleOutDemo.Web._Default" %>
<!DOCTYPE html>
<html>
<head>
    <title>SignalR Simple Chat</title>
    <style type="text/css">
        .container {
            background-color: #99CCFF;
            border: thick solid #808080;
            padding: 20px;
            margin: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        Current Instance: <strong><asp:Label ID="lblCurrentInstance" runat="server" Text="Label"></asp:Label></strong>
        <br /><br />
        <input type="text" id="message" />
        <input type="button" id="sendmessage" value="Send" />
        <input type="hidden" id="displayname" />
        <ul id="discussion">
        </ul>
    </div>

    <script src="/Scripts/jquery-1.6.4.min.js" ></script>
    <script src="/Scripts/jquery.signalR-1.1.0.js"></script>
    <script src="/signalr/hubs"></script>

    <script type="text/javascript">
        $(function () {
            var chat = $.connection.chatHub;
            chat.client.broadcastMessage = function (name, message, machineName, instanceId) {
                var encodedName = $('<div />').text(name).html();
                var encodedMsg = $('<div />').text(message).html();
                $('#discussion').append('<li><strong>' + encodedName + '</strong>:&nbsp;&nbsp;' + encodedMsg + '<br /> - Machine: ' + machineName + '<br /> - Instance: ' + instanceId + '</li>');
            };
            
            $('#displayname').val(prompt('Enter your name:', ''));
            $('#message').focus();
            
            $.connection.hub.start().done(function () {
                $('#sendmessage').click(function () {
                    chat.server.send($('#displayname').val(), $('#message').val());
                    $('#message').val('').focus();
                });
            });
        });
    </script>
</body>
</html>
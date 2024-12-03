<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BankApp.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style type="text/css">
             /* Reset and Basic Styling */
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            body {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                background: linear-gradient(135deg, #1d3557, #457b9d);
                color: #ffffff;
                font-size: 16px;
            }

            /* Login Container */
            .login-container {
                width: 400px;
                padding: 2.5rem;
                border-radius: 10px;
                background: rgba(255, 255, 255, 0.05);
                backdrop-filter: blur(10px);
                box-shadow: 0px 8px 24px rgba(0, 0, 0, 0.3);
                text-align: center;
                border: 1px solid rgba(255, 255, 255, 0.2);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .login-container:hover {
                transform: translateY(-5px);
                box-shadow: 0px 12px 32px rgba(0, 0, 0, 0.4);
            }

            .login-container h2 {
                font-size: 2.2rem;
                font-weight: 600;
                margin-bottom: 2rem;
                color: #f8f9fa;
                text-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            }

            /* Label Styling */
            .label {
                display: block;
                font-size: 0.95rem;
                margin-bottom: 0.5rem;
                color: #adb5bd;
            }

            /* Input Field Styling */
            .input-field {
                width: 100%;
                padding: 0.9rem;
                margin-bottom: 1.2rem;
                border: 1px solid rgba(255, 255, 255, 0.3);
                border-radius: 6px;
                background: rgba(255, 255, 255, 0.15);
                color: #ffffff;
                font-size: 1rem;
                transition: background 0.3s ease, border-color 0.3s ease;
            }

            .input-field::placeholder {
                color: #ced4da;
            }

            .input-field:focus {
                outline: none;
                background: rgba(255, 255, 255, 0.25);
                border-color: #74c0fc;
            }

            /* Button Styling */
            .login-button {
                width: 100%;
                padding: 0.9rem;
                margin-top: 1rem;
                border: none;
                border-radius: 6px;
                background: linear-gradient(135deg, #1d3557, #457b9d);
                font-size: 1rem;
                color: #ffffff;
                font-weight: 600;
                cursor: pointer;
                transition: background 0.3s ease, transform 0.3s ease;
            }

            .login-button:hover {
                background: linear-gradient(135deg, #457b9d, #1d3557);
                transform: translateY(-3px);
                box-shadow: 0px 6px 18px rgba(0, 0, 0, 0.25);
            }

            /* Message Styling */
            .message {
                margin-top: 0.5rem;
                font-size: 0.95rem;
                color: #ffcccc;
                opacity: 0.9;
                transition: opacity 0.3s ease;
            }

            .error-message {
                color: #ff5c5c;
                font-weight: bold;
            }

            /* Additional Styling for Professional Look */
            .login-container::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                border-radius: 10px;
                opacity: 0.05;
                background: radial-gradient(circle at top left, #ffffff, transparent);
                pointer-events: none;
            }

            .input-field, .login-button {
                box-shadow: inset 0px 1px 4px rgba(255, 255, 255, 0.2);
            }

            .input-field:hover {
                background: rgba(255, 255, 255, 0.2);
            }


        #HyperLink1 
        {
            position:absolute;
            font-size:smaller;
            font-family:Cascadia Mono;
            padding:(2,4,6,8);
            color:Silver;
            top:10px;
            left:10px;
            
        }
        
    </style>

    <script type="text/javascript">
        // Disable right-click context menu
        document.addEventListener('contextmenu', function (e) {
            e.preventDefault();

        });

        // Disable F12 and Ctrl+Shift+I
        document.onkeydown = function (e) {
            if (e.key === 'F12' || (e.ctrlKey && e.shiftKey && e.key === 'I')) {
                e.preventDefault();
                alert("Developer tools are disabled.");
            }
        };
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div class="login-container">
        <h2>Admin Login</h2>
        
            <asp:TextBox ID="txtUsername" runat="server" CssClass="input-field" placeholder="Enter your username"></asp:TextBox>
            
            <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
            
            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
            
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="login-button" OnClick="btnLogin_Click" />
        
    </div>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Bank.aspx">Back</asp:HyperLink>
    </form>
</body>
</html>

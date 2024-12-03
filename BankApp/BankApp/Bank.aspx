<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bank.aspx.cs" Inherits="BankApp.Bank" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ABC Bank</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            height: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('images/bank.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 400px;
        }

        h2 {
            color: #FF6666;
        }

        label, select, button {
            display: block;
            width: 100%;
            margin-bottom: 10px;
        }

        button {
            background-color: #FF9966;
            color: yellow;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #FF9933;
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
        <div class="container">
            <h2>Welcome to ABC Bank</h2>
            <asp:Label ID="lblRole" runat="server" Text="Select Role:" BackColor="#FF6666" ForeColor="Yellow"></asp:Label>
            <asp:DropDownList ID="ddlRole" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged">
                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>
                <asp:ListItem Text="Admin" Value="1"></asp:ListItem>
                <asp:ListItem Text="Customer" Value="2"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </form>
</body>
</html>

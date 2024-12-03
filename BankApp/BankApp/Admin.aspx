<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="BankApp.Admin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ABC Bank</title>
    <style type="text/css">
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: url('images/bank1.jpg');
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

        h2, h3 {
            color: #FF6666;
        }

        label, input, button {
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
        <div class="container">
            <h2>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Bank.aspx">Back</asp:HyperLink>
                Admin Desk</h2>
            <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" OnClick="btnCreateAccount_Click" />
            <asp:Button ID="btnDeleteAccount" runat="server" Text="Delete Account" OnClick="btnDeleteAccount_Click" />
            <asp:Button ID="btnViewAccounts" runat="server" Text="View All Accounts" OnClick="btnViewAccounts_Click" />

            <asp:Panel ID="pnlCreateAccount" runat="server" Visible="false">
                <h3>Create New Account</h3>
                <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                <asp:Label ID="lblAccountNumber" runat="server" Text="Account Number:"></asp:Label>
                <asp:TextBox ID="txtAccountNumber" runat="server"></asp:TextBox>
                <asp:Label ID="lblAccountType" runat="server" Text="Account Type:"></asp:Label>
                <asp:TextBox ID="txtAccountType" runat="server"></asp:TextBox>
                <asp:Label ID="lblInitialBalance" runat="server" Text="Initial Balance:"></asp:Label>
                <asp:TextBox ID="txtInitialBalance" runat="server"></asp:TextBox>
                <asp:Button ID="btnSubmitCreateAccount" runat="server" Text="Create Account" OnClick="btnSubmitCreateAccount_Click" />
            </asp:Panel>

            <asp:Panel ID="pnlDeleteAccount" runat="server" Visible="false">
                <h3>Delete Account</h3>
                <asp:Label ID="lblDeleteAccountNumber" runat="server" Text="Account Number:"></asp:Label>
                <asp:TextBox ID="txtDeleteAccountNumber" runat="server"></asp:TextBox>
                <asp:Button ID="btnSubmitDeleteAccount" runat="server" Text="Delete Account" OnClick="btnSubmitDeleteAccount_Click" />
            </asp:Panel>
           
            <asp:Label ID="lblMessage" runat="server" BackColor="Beige" ForeColor="Red"></asp:Label>
            <asp:GridView ID="gvAccounts" runat="server" Visible="false" 
                AutoGenerateColumns="True" Width="364px"></asp:GridView>
        </div>
    </form>
</body>
</html>

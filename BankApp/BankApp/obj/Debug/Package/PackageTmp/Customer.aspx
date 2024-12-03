<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="BankApp.Customer" %>

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
            background-image: url('images/bank.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
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
                Self Desk</h2>
            <asp:Label ID="lblEnterAccountNumber" runat="server" Text="Enter Account Number:"></asp:Label>
            <asp:TextBox ID="txtAccountNumber" runat="server"></asp:TextBox>
            <asp:Button ID="btnCheckAccount" runat="server" Text="Check Account" OnClick="btnCheckAccount_Click" />

            <asp:Panel ID="pnlAccountActions" runat="server" Visible="false">
                <h3>Account Actions</h3>
                <asp:Label ID="lblBalance" runat="server" Text="Balance:"></asp:Label>
                <asp:TextBox ID="txtDepositAmount" runat="server" Placeholder="Deposit Amount"></asp:TextBox>
                <asp:Button ID="btnDeposit" runat="server" Text="Deposit" OnClick="btnDeposit_Click" />
                <asp:TextBox ID="txtWithdrawAmount" runat="server" Placeholder="Withdraw Amount"></asp:TextBox>
                <asp:Button ID="btnWithdraw" runat="server" Text="Withdraw" OnClick="btnWithdraw_Click" />
                <asp:Button ID="btnViewBalance" runat="server" Text="View Balance" OnClick="btnViewBalance_Click" />
            </asp:Panel>

            <asp:Label ID="lblMessage" runat="server" BackColor="Beige" ForeColor="Red"></asp:Label>
        </div>
    </form>
</body>
</html>

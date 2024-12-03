using System;
using System.Collections.Generic;
using BankApp;

namespace BankApp
{
    public partial class Customer : System.Web.UI.Page
    {
        private static List<BankAccount> accounts = Admin.GetAccounts();
        private BankAccount currentAccount;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["CurrentAccountNumber"] != null)
            {
                // Restore currentAccount from ViewState
                int accountNumber = (int)ViewState["CurrentAccountNumber"];
                currentAccount = FindAccount(accountNumber);
            }
        }

        protected void btnCheckAccount_Click(object sender, EventArgs e)
        {
            string accountNumText = txtAccountNumber.Text;
            int accountNum;

            if (accountNumText.Length == 0)
            {
                lblMessage.Text = "Please Enter Account Number";
                return;
            }

            if (accountNumText.Length != 9 || !int.TryParse(accountNumText, out accountNum))
            {
                lblMessage.Text = "Account number must be exactly 9 digits.";
                pnlAccountActions.Visible = false;
                return;
            }

            currentAccount = FindAccount(accountNum);
            if (currentAccount != null)
            {
                ViewState["CurrentAccountNumber"] = currentAccount.AccountNumber; // Store account number in ViewState
                pnlAccountActions.Visible = true;
                lblMessage.Text = "Account found. You can now perform actions.";
            }
            else
            {
                lblMessage.Text = "Account not found.";
                pnlAccountActions.Visible = false;
            }
        }

        protected void btnDeposit_Click(object sender, EventArgs e)
        {
            if (currentAccount == null)
            {
                lblMessage.Text = "Please check your account first.";
                return;
            }

            float depositAmount;
            if (!float.TryParse(txtDepositAmount.Text, out depositAmount) || depositAmount <= 0)
            {
                lblMessage.Text = "Please enter a valid deposit amount.";
                return;
            }

            currentAccount.Balance += depositAmount;
            lblMessage.Text = "Deposited " + depositAmount + ". New balance: " + currentAccount.Balance + ".";
        }

        protected void btnWithdraw_Click(object sender, EventArgs e)
        {
            if (currentAccount == null)
            {
                lblMessage.Text = "Please check your account first.";
                return;
            }

            float withdrawAmount;
            if (!float.TryParse(txtWithdrawAmount.Text, out withdrawAmount) || withdrawAmount <= 0)
            {
                lblMessage.Text = "Please enter a valid withdrawal amount.";
                return;
            }

            if (withdrawAmount > currentAccount.Balance)
            {
                lblMessage.Text = "Insufficient funds.";
                return;
            }

            currentAccount.Balance -= withdrawAmount;
            lblMessage.Text = "Withdrew " + withdrawAmount + ". New balance: " + currentAccount.Balance + ".";
        }

        protected void btnViewBalance_Click(object sender, EventArgs e)
        {
            if (currentAccount == null)
            {
                lblMessage.Text = "Please check your account first.";
                return;
            }

            lblMessage.Text = "Current balance: " + currentAccount.Balance + ".";
        }

        private BankAccount FindAccount(int accountNumber)
        {
            return accounts.Find(account => account.AccountNumber == accountNumber);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace BankApp
{
    public partial class Admin : System.Web.UI.Page
    {
        public static List<BankAccount> accounts = new List<BankAccount>();

        public static List<BankAccount> GetAccounts()
        {
            return accounts;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitializeDummyAccounts();
            }
            
        }

        /*private BankAccount FindAccount(int accountNumber)
        {
            return accounts.Find(account => account.AccountNumber == accountNumber);
        }
        */
        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {
            pnlCreateAccount.Visible = true;
            pnlDeleteAccount.Visible = false;
        }

        protected void btnDeleteAccount_Click(object sender, EventArgs e)
        {
            pnlDeleteAccount.Visible = true;
            pnlCreateAccount.Visible = false;
        }

        protected void btnViewAccounts_Click(object sender, EventArgs e)
        {
            gvAccounts.Visible = true;
            gvAccounts.DataSource = accounts;
            gvAccounts.DataBind();
        }

        protected void btnSubmitCreateAccount_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string accountNumText = txtAccountNumber.Text;
            string accountTypeText = txtAccountType.Text;
            string initialBalanceText = txtInitialBalance.Text;

            // Validate account number
            long accountNum;
            if (accountNumText.Length != 9 || !long.TryParse(accountNumText, out accountNum))
            {
                lblMessage.Text = "Account number must be exactly 9 digits.";
                return;
            }

            // Validate account type
            if (accountTypeText != "1" && accountTypeText != "2")
            {
                lblMessage.Text = "Account type must be 1 (Savings) or 2 (Current).";
                return;
            }

            int accountType = int.Parse(accountTypeText);
            float balance;
            // Validate initial balance
            if (!float.TryParse(initialBalanceText, out balance))
            {
                lblMessage.Text = "Initial balance must be a valid number.";
                return;
            }

            // Check if account number already exists
            if (FindAccount((int)accountNum) != null)
            {
                lblMessage.Text = "Account number already exists.";
                return;
            }


            // Create new account
            BankAccount newAccount = new BankAccount(name, (int)accountNum, accountType, balance);
            accounts.Add(newAccount);
            lblMessage.Text = "Account created successfully.";
        }

        protected void btnSubmitDeleteAccount_Click(object sender, EventArgs e)
        {
            string accountNumText = txtDeleteAccountNumber.Text;

            // Validate account number
            long accountNum;
            if (accountNumText.Length != 9 || !long.TryParse(accountNumText, out accountNum))
            {
                lblMessage.Text = "Account number must be exactly 9 digits.";
                return;
            }

            // Find and delete account
            BankAccount account = FindAccount((int)accountNum);
            if (account != null)
            {
                accounts.Remove(account);
                lblMessage.Text = "Account deleted successfully.";
            }
            else
            {
                lblMessage.Text = "Account not found.";
            }
        }

        private BankAccount FindAccount(int accountNumber)
        {
            return accounts.Find(account => account.AccountNumber == accountNumber);
        }

        private void InitializeDummyAccounts()
        {
            if (accounts.Count == 0)
            {
                accounts.Add(new BankAccount("Mahesh", 123456786, 1, 50000));
                accounts.Add(new BankAccount("Sahil", 123456787, 2, 60000));
                accounts.Add(new BankAccount("Vishal", 123456788, 2, 80000));
                accounts.Add(new BankAccount("Shubaraj", 987654321, 2, 100000));
            }
        }
    }

    public class BankAccount
    {
        public string Name { get; set; }
        public int AccountNumber { get; set; }
        public int AccountType { get; set; }
        public float Balance { get; set; }

        public BankAccount(string name, int accountNumber, int accountType, float balance)
        {
            Name = name;
            AccountNumber = accountNumber;
            AccountType = accountType;
            Balance = balance;
        }
    }
}

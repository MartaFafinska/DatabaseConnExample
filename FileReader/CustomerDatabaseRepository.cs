using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace DatabaseConnExample
{    
    public class CustomerDatabaseRepository : ICustomerRepository
    {
        private static string connString = @"Server=(localdb)\MSSQLLocalDB;Database=BicycleShop;Trusted_Connection=True;";
        public bool AddCustomer(Customer customer)
        {
            try
            {
                using (SqlConnection sqlConnection = new SqlConnection(connString))
                {
                    sqlConnection.Open();
                    string query = "INSERT INTO dbo.Customers (Id, CustomerFirstName, CustomerSurname) VALUES (@Id, @customerFirstName, @customerSurname)";
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@Id", customer.Id);
                        sqlCommand.Parameters.AddWithValue("@customerFirstName", customer.Name);
                        sqlCommand.Parameters.AddWithValue("@customerSurname", customer.Surname);

                        sqlCommand.ExecuteNonQuery();
                    }
                }
                
            }
            catch(Exception ex)
            {
                return false;
            }
            return true;
        }

        public List<Customer> GetCustomers()
        {
            List<Customer> customers = new List<Customer>();
            using (SqlConnection sqlConnection = new SqlConnection(connString))
            {
                sqlConnection.Open();
                using (SqlCommand sqlCommand = new SqlCommand("SELECT Id, CustomerFirstName, CustomerSurname FROM dbo.Customers", sqlConnection))
                {
                    using (SqlDataReader reader = sqlCommand.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Customer customer = new Customer();
                            customer.Id = Convert.ToInt32(reader[0]);
                            customer.Name = Convert.ToString(reader[1]);
                            customer.Surname = Convert.ToString(reader[2]);
                            customers.Add(customer);
                        }
                    }
                }
            }
            return customers;
        }

        public bool UpdateCustomer(Customer customer)
        {
            try
            {
                using (SqlConnection sqlConnection = new SqlConnection(connString))
                {
                    sqlConnection.Open();
                    string query = "UPDATE dbo.Customers SET CustomerFirstName=@customerFirstName, CustomerSurname=@customerSurname WHERE Id=@Id";
                    using (SqlCommand sqlCommand = new SqlCommand(query, sqlConnection))
                    {
                        sqlCommand.Parameters.AddWithValue("@Id", customer.Id);
                        sqlCommand.Parameters.AddWithValue("@customerFirstName", customer.Name);
                        sqlCommand.Parameters.AddWithValue("@customerSurname", customer.Surname);

                        sqlCommand.ExecuteNonQuery();
                    }
                }

            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }
    }
}
